/* Software waveform simulation. Output state is held until the next main-loop poll. */
#include "battery_indicator.h"
#include "terminal_indicator.h"
#include "led_timeout.h"
#include <stdio.h>
#include <stdint.h>
int main(void){
 const uint32_t gaps[]={1,10,100,1000,5000,60000};
 printf("[");
 for(unsigned g=0;g<sizeof gaps/sizeof gaps[0];g++){
  uint32_t gap=gaps[g];unsigned max_on=0,max_limited=0;
  for(unsigned band=0;band<4;band++){
   battery_indicator s={0};led_timeout timeout={0};unsigned on=0,limited_on=0;bool raw=false,limited=false;
   for(uint32_t t=0;t<120000;t++){
    if(t%gap==0){
     raw=battery_indicator_periodic_poll(&s,t,60000,band!=0,band==1?3500:band==2?3800:4000);
     led_action a=led_timeout_request(&timeout,raw);
     if(a!=LED_UNCHANGED)limited=a==LED_SET_ON;
    }
    on+=raw;limited_on+=limited;
    if(led_timeout_tick(&timeout)==LED_SET_OFF)limited=false;
   }
   if(on>max_on)max_on=on;
   if(limited_on>max_limited)max_limited=limited_on;
  }
  printf("%s{\"poll_gap_ms\":%u,\"duration_ms\":120000,\"max_on_ms_across_voltage_bands\":%u,\"limited_on_ms_with_1ms_ticks\":%u}",g?",":"",gap,max_on,max_limited);
 }
 puts("]");return 0;
}
