#include "audio_adf.h"
#include <string.h>
/* SRAM4 section must be placed by the final linker script. This translation
 * unit is compile-tested only; Stop2 retention and TrustZone attributes remain
 * integration gates. No caller may enter Stop2 on compile success alone. */
__attribute__((section(".lpbam"),aligned(32))) static DMA_NodeTypeDef node;
__attribute__((section(".lpbam"),aligned(32))) static DMA_QListTypeDef queue;
static DMA_HandleTypeDef dma;

HAL_StatusTypeDef pendant_audio_dma_init(MDF_HandleTypeDef *h) {
 if(!h)return HAL_ERROR;
 if(h->State!=HAL_MDF_STATE_READY)return HAL_BUSY;
 __HAL_RCC_LPDMA1_CLK_ENABLE();
 __HAL_RCC_LPDMA1_CLK_SLEEP_ENABLE();
 __HAL_RCC_LPDMA1_CLKAM_ENABLE();
 if((uintptr_t)&node<SRAM4_BASE || (uintptr_t)&node+sizeof(node)>SRAM4_BASE+SRAM4_SIZE || (uintptr_t)&queue<SRAM4_BASE || (uintptr_t)&queue+sizeof(queue)>SRAM4_BASE+SRAM4_SIZE)return HAL_ERROR;
 memset(&dma,0,sizeof(dma));memset(&queue,0,sizeof(queue));memset(&node,0,sizeof(node));
 dma.Instance=LPDMA1_Channel0;
 dma.InitLinkedList.Priority=DMA_HIGH_PRIORITY;
 dma.InitLinkedList.LinkStepMode=DMA_LSM_FULL_EXECUTION;
 dma.InitLinkedList.LinkAllocatedPort=DMA_LINK_ALLOCATED_PORT0;
 dma.InitLinkedList.TransferEventMode=DMA_TCEM_LAST_LL_ITEM_TRANSFER;
 dma.InitLinkedList.LinkedListMode=DMA_LINKEDLIST_CIRCULAR;
 if(HAL_DMAEx_List_Init(&dma)!=HAL_OK)return HAL_ERROR;
 DMA_NodeConfTypeDef config={0};
 config.NodeType=DMA_LPDMA_LINEAR_NODE;
 config.Init.Request=LPDMA1_REQUEST_ADF1_FLT0;
 config.Init.BlkHWRequest=DMA_BREQ_SINGLE_BURST;
 config.Init.Direction=DMA_PERIPH_TO_MEMORY;
 config.Init.SrcInc=DMA_SINC_FIXED;
 config.Init.DestInc=DMA_DINC_INCREMENTED;
 config.Init.SrcDataWidth=DMA_SRC_DATAWIDTH_HALFWORD;
 config.Init.DestDataWidth=DMA_DEST_DATAWIDTH_HALFWORD;
 config.Init.SrcBurstLength=1;config.Init.DestBurstLength=1;
 config.Init.TransferAllocatedPort=DMA_SRC_ALLOCATED_PORT0|DMA_DEST_ALLOCATED_PORT0;
 config.Init.TransferEventMode=DMA_TCEM_BLOCK_TRANSFER;
 config.Init.Mode=DMA_NORMAL;
 config.TriggerConfig.TriggerPolarity=DMA_TRIG_POLARITY_MASKED;
 config.DataHandlingConfig.DataExchange=DMA_EXCHANGE_NONE;
 config.DataHandlingConfig.DataAlignment=DMA_DATA_RIGHTALIGN_ZEROPADDED;
 if(HAL_DMAEx_List_BuildNode(&config,&node)!=HAL_OK)return HAL_ERROR;
 if(HAL_DMAEx_List_InsertNode_Tail(&queue,&node)!=HAL_OK)return HAL_ERROR;
 if(HAL_DMAEx_List_SetCircularMode(&queue)!=HAL_OK)return HAL_ERROR;
 if(HAL_DMAEx_List_LinkQ(&dma,&queue)!=HAL_OK)return HAL_ERROR;
 __HAL_LINKDMA(h,hdma,dma);
 HAL_NVIC_SetPriority(LPDMA1_Channel0_IRQn,2,0);
 HAL_NVIC_EnableIRQ(LPDMA1_Channel0_IRQn);
 return HAL_OK;
}
HAL_StatusTypeDef pendant_audio_dma_start(MDF_HandleTypeDef *h,
 const MDF_FilterConfigTypeDef *f,int16_t *buffer,uint32_t samples) {
 if(!h || h->hdma!=&dma || !f || !buffer || samples<2 || samples%2 || samples>32766 || ((uintptr_t)buffer&3U))return HAL_ERROR;
 if((uintptr_t)buffer<SRAM4_BASE || samples*sizeof(*buffer)>SRAM4_SIZE || (uintptr_t)buffer>SRAM4_BASE+SRAM4_SIZE-samples*sizeof(*buffer))return HAL_ERROR;
 if(!pendant_audio_claim_buffer(h,buffer,samples))return HAL_ERROR;
 MDF_DmaConfigTypeDef config={0};
 config.Address=(uint32_t)buffer;config.DataLength=samples*sizeof(*buffer);config.MsbOnly=ENABLE;
 HAL_NVIC_ClearPendingIRQ(LPDMA1_Channel0_IRQn);
 HAL_NVIC_EnableIRQ(LPDMA1_Channel0_IRQn);
 return HAL_MDF_AcqStart_DMA(h,f,&config);
}
HAL_StatusTypeDef pendant_audio_dma_stop(MDF_HandleTypeDef *h) {
 if(!h || h->hdma!=&dma)return HAL_ERROR;
 return HAL_MDF_AcqStop_DMA(h);
}
void LPDMA1_Channel0_IRQHandler(void) {
 /* Both boundaries pending means software cannot prove the oldest half was
  * copied before reuse. Never present it as continuous audio. */
 uint32_t flags=dma.Instance->CSR;
 if((flags&(DMA_CSR_HTF|DMA_CSR_TCF))==(DMA_CSR_HTF|DMA_CSR_TCF))
  HAL_MDF_ErrorCallback((MDF_HandleTypeDef *)dma.Parent);
 HAL_DMA_IRQHandler(&dma);
}

bool pendant_audio_dma_owns(MDF_HandleTypeDef *h){return h&&h->hdma==&dma;}

void pendant_audio_fault_stop(MDF_HandleTypeDef *h){
 if(!pendant_audio_dma_owns(h)||h->Instance!=ADF1_Filter0)return;
 HAL_NVIC_DisableIRQ(LPDMA1_Channel0_IRQn);
 h->Instance->DFLTCR&=~(MDF_DFLTCR_DMAEN|MDF_DFLTCR_DFLTEN);
 /* Reset only our channel, not the entire shared LPDMA peripheral. */
 dma.Instance->CCR|=DMA_CCR_RESET;
 __DSB();
 HAL_NVIC_ClearPendingIRQ(LPDMA1_Channel0_IRQn);
 dma.State=HAL_DMA_STATE_ERROR;h->State=HAL_MDF_STATE_ERROR;
 HAL_MDF_ErrorCallback(h);
}
