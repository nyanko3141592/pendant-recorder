#include "../core/battery_stop.h"
#include <assert.h>
int main(void){
 battery_stop s={0};
 assert(!battery_stop_poll(&s,0,true,true,3601,3600,3000));
 assert(battery_stop_poll(&s,1,true,true,3600,3600,3000));
 assert(battery_stop_poll(&s,2,false,true,4200,3600,3000));
 s=(battery_stop){0};uint32_t t=UINT32_MAX-100;
 assert(!battery_stop_poll(&s,t,true,false,0,3600,3000));
 assert(!battery_stop_poll(&s,t+2999,true,false,0,3600,3000));
 assert(battery_stop_poll(&s,t+3000,true,false,0,3600,3000));
 s=(battery_stop){0};
 assert(!battery_stop_poll(&s,0,true,false,0,3600,3000));
 assert(!battery_stop_poll(&s,2999,false,false,0,3600,3000));
 assert(!battery_stop_poll(&s,9000,true,false,0,3600,3000));
 assert(!battery_stop_poll(&s,11999,true,true,3700,3600,3000));
 assert(!battery_stop_poll(&s,12000,true,false,0,3600,3000));
 assert(battery_stop_poll(&s,15000,true,false,0,3600,3000));
}
