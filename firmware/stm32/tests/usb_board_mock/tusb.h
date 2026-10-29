#include <stdbool.h>
bool tud_inited(void);
bool tud_deinit(unsigned port);
void tusb_int_handler(unsigned port,bool in_isr);
