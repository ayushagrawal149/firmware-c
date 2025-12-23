#include "blink.h"
#include <stdio.h>

static uint32_t last_toggle_ms = 0;
static int led_state = 0;

void blink_init(void) {
  last_toggle_ms = 0;
  led_state = 0;
}

void blink_tick(uint32_t time_ms) {
  const uint32_t period_ms = 500;
  if ((time_ms - last_toggle_ms) >= period_ms) {
    last_toggle_ms = time_ms;
    led_state = !led_state;
    printf("[C] LED: %s at %u ms\n", led_state ? "ON" : "OFF", time_ms);
  }
}


