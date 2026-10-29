#include "../core/battery_monitor.h"
#include <assert.h>
static unsigned calls;static bool success=true;
static bool measure(uint16_t *v){calls++;*v=3700;return success;}
int main(void){battery_monitor m;uint16_t v;uint32_t t=UINT32_MAX-50;
 battery_monitor_init(&m,t);
 assert(battery_monitor_healthy(&m,t+4999,true));
 assert(!battery_monitor_healthy(&m,t+5000,true));
 assert(battery_monitor_healthy(&m,t+5000,false));
 battery_monitor_poll(&m,t+100,true,measure);assert(calls==1);
 battery_monitor_poll(&m,t+1099,true,measure);assert(calls==1);
 battery_monitor_poll(&m,t+1100,true,measure);assert(calls==2);
 assert(battery_monitor_read(&m,t+3599,&v)&&v==3700);
 assert(!battery_monitor_read(&m,t+3600,&v));
 battery_monitor_poll(&m,t+4000,false,measure);assert(calls==2);
 battery_monitor_poll(&m,t+4000,true,measure);assert(calls==3);
 battery_monitor n;success=false;battery_monitor_init(&n,10);
 battery_monitor_poll(&n,110,true,measure);assert(battery_monitor_healthy(&n,110,true));
 battery_monitor_poll(&n,1110,true,measure);assert(battery_monitor_healthy(&n,1110,true));
 battery_monitor_poll(&n,2110,true,measure);assert(!battery_monitor_healthy(&n,2110,true));
 assert(battery_monitor_healthy(&n,999999,false));
}
