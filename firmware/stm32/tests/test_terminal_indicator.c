#include "terminal_indicator.h"
#include <assert.h>
#include <stdint.h>
int main(void){
 unsigned full_on=0,fault_on=0,full_edges=0,fault_edges=0;
 bool full_previous=false,fault_previous=false;
 uint32_t start=UINT32_MAX-2000U;
 for(uint32_t t=0;t<10000U;t++){
  uint32_t now=start+t;
  bool full=terminal_indicator_on(now-start,true);
  bool fault=terminal_indicator_on(now-start,false);
  full_on+=full;fault_on+=fault;
  full_edges+=full&&!full_previous;fault_edges+=fault&&!fault_previous;
  full_previous=full;fault_previous=fault;
 }
 assert(full_on==2400&&fault_on==1200);
 assert(full_edges==4&&fault_edges==8);
 assert(!terminal_indicator_on(600,true)&&terminal_indicator_on(900,true));
 assert(!terminal_indicator_on(150,false)&&terminal_indicator_on(300,false));
 return 0;
}
