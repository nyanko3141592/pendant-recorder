#include "battery_monitor.h"
#ifdef PENDANT_BATTERY_STOP_MV
#define SAMPLE_INTERVAL_MS 1000U
#define VALID_AGE_MS 2500U
#define HEALTH_DEADLINE_MS 5000U
#else
#define SAMPLE_INTERVAL_MS 60000U
#define VALID_AGE_MS 120000U
#define HEALTH_DEADLINE_MS 180000U
#endif
void battery_monitor_init(battery_monitor *m,uint32_t now){
 *m=(battery_monitor){.started=now};
}
void battery_monitor_poll(battery_monitor *m,uint32_t now,bool allowed,bool (*measure)(uint16_t *)){
 if(!allowed||!measure)return;
 if(!m->attempted&&(uint32_t)(now-m->started)<100)return;
 if(m->attempted&&(uint32_t)(now-m->attempted_at)<SAMPLE_INTERVAL_MS)return;
 m->attempted=true;m->attempted_at=now;m->valid=false;
 uint16_t value;
 if(measure(&value)&&value>=2000&&value<=4500){
  m->mv=value;m->valid=true;m->ever_valid=true;m->valid_at=now;
  m->consecutive_failures=0;
 }else if(m->consecutive_failures<UINT8_MAX)m->consecutive_failures++;
}
bool battery_monitor_healthy(const battery_monitor *m,uint32_t now,bool required){
 if(!m||!required)return m!=0;
 if(m->consecutive_failures>=3)return false;
 uint32_t reference=m->ever_valid?m->valid_at:m->started;
 return (uint32_t)(now-reference)<HEALTH_DEADLINE_MS;
}
bool battery_monitor_read(const battery_monitor *m,uint32_t now,uint16_t *mv){
 if(!mv||!m->valid||(uint32_t)(now-m->attempted_at)>=VALID_AGE_MS)return false;
 *mv=m->mv;return true;
}
