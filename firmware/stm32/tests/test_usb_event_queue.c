#include <assert.h>
#include "device/dcd.h"
#include "device/usbd.h"
void test_event_queue_init(void);
bool test_event_queue_push(uint32_t,bool);
unsigned test_event_queue_capacity(void);
static unsigned hooks,last_id,overflows;
void tud_event_queue_overflow_cb(uint8_t port,bool isr){assert(port==0);(void)isr;overflows++;}static bool last_isr;
void tud_event_hook_cb(uint8_t port,uint32_t id,bool isr){assert(port==0);hooks++;last_id=id;last_isr=isr;}
void dcd_int_enable(uint8_t port){(void)port;}
void dcd_int_disable(uint8_t port){(void)port;}
bool test_configuration_status(uint16_t,unsigned,bool);
bool dcd_edpt_xfer(uint8_t p,uint8_t e,uint8_t* b,uint16_t n,bool isr){(void)p;(void)e;(void)b;(void)n;(void)isr;return true;}
void dcd_edpt_stall(uint8_t p,uint8_t e){(void)p;(void)e;}
int main(void){
 assert(test_configuration_status(1,XFER_RESULT_SUCCESS,false));
 assert(!test_configuration_status(1,XFER_RESULT_FAILED,false));
 assert(!test_configuration_status(2,XFER_RESULT_SUCCESS,false));
 assert(!test_configuration_status(0,XFER_RESULT_SUCCESS,true));
 assert(!tud_event_queue_overflowed());
 const uint32_t critical[]={DCD_EVENT_BUS_RESET,DCD_EVENT_UNPLUGGED,DCD_EVENT_SUSPEND};
 for(unsigned isr=0;isr<2;isr++){
  test_event_queue_init();
  for(unsigned i=0;i<test_event_queue_capacity();i++)assert(test_event_queue_push(DCD_EVENT_XFER_COMPLETE,isr));
  for(unsigned i=0;i<3;i++){
   unsigned before=hooks;
   assert(!test_event_queue_push(critical[i],isr));
   assert(hooks==before+1&&last_id==critical[i]&&last_isr==(bool)isr);
   assert(tud_event_queue_overflowed());
  }
  test_event_queue_init();
  for(unsigned i=0;i<3;i++){
   unsigned before=hooks;assert(test_event_queue_push(critical[i],isr));assert(hooks==before+1);
  }
 }
 assert(overflows==6&&tud_event_queue_overflowed());
 return 0;
}
