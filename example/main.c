#include <stdlib.h>

void f(void) {
  int *p = malloc(10 * sizeof(int));
  p[10] = 0; // BOOM
}

int main(void) {
  f();
  return 0;
}
