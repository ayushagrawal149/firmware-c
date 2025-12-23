#include "blink.h"
#include <stdint.h>

int main(void) {
  blink_init();

  for (uint32_t t = 0; t<=5000; t += 50) {
	blink_tick(t);
  }
  return 0;
}
