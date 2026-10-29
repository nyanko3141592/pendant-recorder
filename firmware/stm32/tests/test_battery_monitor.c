#include "../core/battery_monitor.h"
#include <assert.h>
static unsigned calls;static bool success=true;
static bool measure(uint16_t *mv){calls++;*mv=3800;return success;}
int main(void){
 battery_monitor m;uint16_t mv=123;uint32_t start=UINT32_MAX-50;
 battery_monitor_init(&m,start);
 battery_monitor_poll(&m,start+99,true,measure);assert(!calls);
 battery_monitor_poll(&m,start+100,false,measure);assert(!calls);
 battery_monitor_poll(&m,start+100,true,measure);assert(calls==1);
 assert(battery_monitor_healthy(&m,start+100,true));
 assert(battery_monitor_read(&m,start+100,&mv)&&mv==3800);
 battery_monitor_poll(&m,start+60099,true,measure);assert(calls==1);
 success=false;battery_monitor_poll(&m,start+60100,true,measure);assert(calls==2);
 assert(battery_monitor_healthy(&m,start+60100,true));
 mv=123;assert(!battery_monitor_read(&m,start+60101,&mv)&&mv==123);
 success=true;battery_monitor_poll(&m,start+120100,true,measure);assert(calls==3);
 assert(battery_monitor_read(&m,start+240099,&mv));
 assert(battery_monitor_healthy(&m,start+240099,false));
 mv=123;assert(!battery_monitor_read(&m,start+240100,&mv)&&mv==123);
 return 0;
}
