#include "battery_stop.h"
bool battery_stop_poll(battery_stop *s,uint32_t now,bool enabled,bool valid,
 uint16_t mv,uint16_t threshold,uint32_t grace){
 if(s->latched)return true;
 if(!enabled){s->missing=false;return false;}
 if(valid){s->missing=false;if(mv<=threshold)s->latched=true;}
 else if(!s->missing){s->missing=true;s->missing_since=now;}
 else if((uint32_t)(now-s->missing_since)>=grace)s->latched=true;
 return s->latched;
}
