#include "../core/battery_voltage.h"
#include <assert.h>
int main(void){
 uint16_t mv=123;
 assert(battery_voltage_mv(10922,6666,6666,&mv)&&mv==4000);
 /* Same battery under different analog supply, with corresponding reference. */
 assert(battery_voltage_mv(9929,6060,6666,&mv)&&mv>=3999&&mv<=4001);
 assert(!battery_voltage_mv(10000,0,6666,&mv));
 uint16_t previous=mv;
 assert(!battery_voltage_mv(16383,6666,6666,&mv)&&mv==previous);
 assert(!battery_voltage_mv(10922,6666,65535,&mv)&&mv==previous);
 assert(!battery_voltage_mv(10922,1,6666,&mv)&&mv==previous);
 assert(!battery_voltage_mv(100,6666,6666,&mv)&&mv==previous);
 assert(!battery_voltage_mv(10922,6666,6666,0));
 for(unsigned i=1;i<16383;i++){
  mv=123;bool ok=battery_voltage_mv(i,6666,6666,&mv);
  if(ok)assert(mv>=2000&&mv<=4500);else assert(mv==123);
 }
 return 0;
}
