#include "../core/battery_indicator.h"
#include <assert.h>
int main(void){
 battery_indicator s={0};
 assert(!battery_indicator_poll(&s,0,true,true,4000));
 assert(!battery_indicator_poll(&s,29,true,true,4000));
 assert(battery_indicator_poll(&s,30,true,true,4000));
 assert(!battery_indicator_poll(&s,180,true,true,4000));
 assert(battery_indicator_poll(&s,330,true,true,4000));
 assert(battery_indicator_poll(&s,630,true,true,4000));
 assert(!battery_indicator_poll(&s,930,true,true,4000));
 assert(!battery_indicator_poll(&s,10000,true,true,4000));
 for(unsigned v=3500;v<=4000;v+=250){
  s=(battery_indicator){0};uint32_t base=UINT32_MAX-20;
  battery_indicator_poll(&s,base,true,true,v);
  assert(battery_indicator_poll(&s,base+30,true,true,v));
  assert(s.pulses==(v<3600?1:v<3900?2:3));
 }
 s=(battery_indicator){0};battery_indicator_poll(&s,1,true,false,0);
 assert(battery_indicator_poll(&s,31,true,false,0));
 assert(battery_indicator_poll(&s,630,true,false,0));
 assert(!battery_indicator_poll(&s,631,true,false,0));
 battery_indicator_poll(&s,700,false,false,0);battery_indicator_poll(&s,730,false,false,0);
 battery_indicator_poll(&s,731,true,false,0);assert(battery_indicator_poll(&s,761,true,false,0));
 s=(battery_indicator){0};
 assert(battery_indicator_periodic_poll(&s,UINT32_MAX-100,60000,true,4000));
 assert(!battery_indicator_periodic_poll(&s,799,60000,true,4000));
 assert(battery_indicator_periodic_poll(&s,59899,60000,true,3500));
 assert(s.pulses==1);
 assert(!battery_indicator_periodic_poll(&s,60199,60000,true,3500));
 assert(battery_indicator_periodic_poll(&s,500000,60000,false,0));
 assert(!battery_indicator_periodic_poll(&s,500600,60000,false,0));
 assert(!battery_indicator_periodic_poll(&s,500601,0,true,4000));
 assert(!battery_indicator_periodic_poll(&s,600000,999,true,4000));
 return 0;
}
