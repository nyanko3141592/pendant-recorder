#include "led_timeout.h"
#include <assert.h>
int main(void){
 led_timeout s={0};
 assert(led_timeout_tick(&s)==LED_UNCHANGED);
 assert(led_timeout_request(&s,true)==LED_SET_ON);
 for(unsigned i=0;i<649;i++){
  assert(led_timeout_request(&s,true)==LED_UNCHANGED);
  assert(led_timeout_tick(&s)==LED_UNCHANGED);
 }
 assert(led_timeout_tick(&s)==LED_SET_OFF);
 for(unsigned i=0;i<10000;i++){
  assert(led_timeout_request(&s,true)==LED_UNCHANGED);
  assert(led_timeout_tick(&s)==LED_UNCHANGED);
 }
 assert(led_timeout_request(&s,false)==LED_SET_OFF);
 assert(led_timeout_request(&s,true)==LED_SET_ON);
 for(unsigned i=0;i<150;i++)assert(led_timeout_tick(&s)==LED_UNCHANGED);
 assert(led_timeout_request(&s,false)==LED_SET_OFF);
 assert(s.remaining==0);
 assert(led_timeout_request(&s,true)==LED_SET_ON);
 assert(s.remaining==650);
 return 0;
}
