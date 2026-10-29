#include "battery_indicator.h"
bool battery_indicator_poll(battery_indicator *s,uint32_t now,bool pressed,bool valid,uint16_t mv){
 if(pressed!=s->raw){s->raw=pressed;s->changed=now;}
 if(s->stable!=s->raw&&(uint32_t)(now-s->changed)>=30){
  s->stable=s->raw;
  if(s->stable){s->shown=now;s->active=true;s->pulses=valid?(mv<3600?1:mv<3900?2:3):0;}
 }
 if(!s->active)return false;
 uint32_t elapsed=now-s->shown;
 uint32_t duration=s->pulses?s->pulses*300u:600u;
 if(elapsed>=duration){s->active=false;return false;}
 return !s->pulses||elapsed%300u<150u;
}

bool battery_indicator_periodic_poll(battery_indicator *s,uint32_t now,
 uint32_t interval_ms,bool valid,uint16_t mv){
 if(interval_ms<1000u){s->active=false;return false;}
 if(!s->automatic_started || (uint32_t)(now-s->automatic_last)>=interval_ms){
  s->automatic_started=true;s->automatic_last=now;
  s->shown=now;s->active=true;s->pulses=valid?(mv<3600?1:mv<3900?2:3):0;
 }
 /* Reuse waveform and timeout without creating a synthetic button edge. */
 return battery_indicator_poll(s,now,false,valid,mv);
}
