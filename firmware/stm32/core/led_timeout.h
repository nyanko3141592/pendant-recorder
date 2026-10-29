#ifndef PENDANT_LED_TIMEOUT_H
#define PENDANT_LED_TIMEOUT_H
#include <stdbool.h>
#include <stdint.h>
#define LED_TIMEOUT_TICKS 650U
/* Caller serializes request/reset against 1ms tick. A timed-out high request
 * cannot rearm until a low request. Tick delivery itself must be qualified. */
typedef struct {uint16_t remaining;bool requested;} led_timeout;
typedef enum {LED_UNCHANGED,LED_SET_OFF,LED_SET_ON} led_action;
static inline led_action led_timeout_request(volatile led_timeout *s,bool on){
 if(!on){s->requested=false;s->remaining=0;return LED_SET_OFF;}
 if(s->requested)return LED_UNCHANGED;
 s->requested=true;s->remaining=LED_TIMEOUT_TICKS;return LED_SET_ON;
}
static inline led_action led_timeout_tick(volatile led_timeout *s){
 if(s->remaining && --s->remaining==0)return LED_SET_OFF;
 return LED_UNCHANGED;
}
#endif
