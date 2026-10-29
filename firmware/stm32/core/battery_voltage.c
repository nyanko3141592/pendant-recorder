#include "battery_voltage.h"
bool battery_voltage_mv(uint16_t bat,uint16_t ref,uint16_t cal,uint16_t *out){
 const uint32_t full=16383;
 if(!out||!bat||bat>=full||!ref||ref>=full||!cal||cal>=full)return false;
 /* Factory reference voltage3.000V. Keep rational precision until final result. */
 uint64_t numerator=(uint64_t)cal*3000;
 uint32_t vdda=(uint32_t)((numerator+ref/2)/ref);
 if(vdda<2700||vdda>3600)return false; /* this board uses nominal3.3V */
 uint64_t denominator=(uint64_t)ref*full;
 uint32_t mv=(uint32_t)((numerator*bat*2+denominator/2)/denominator);
 if(mv<2000||mv>4500)return false;
 *out=(uint16_t)mv;return true;
}
