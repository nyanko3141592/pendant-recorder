#ifndef PENDANT_STACK_GUARD_H
#define PENDANT_STACK_GUARD_H
#include <stdbool.h>
/* Main stack only, privileged thread mode. Does not prove adequate stack size. */
bool board_stack_guard_enable(void);
#endif
