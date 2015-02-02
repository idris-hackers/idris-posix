#include <stdlib.h>
#include <time.h>

#define IDRIS_POSIX_STRFTIME_LENGTH 256

inline time_t idris_posix_time() {
  time_t timer;
  time(&timer);
  return timer;
}

inline char *idris_posix_strftime(char *format, time_t timer) {
  char *buffer = malloc(sizeof(char) * IDRIS_POSIX_STRFTIME_LENGTH);
  struct tm *tp = localtime(&timer);
  strftime(buffer, IDRIS_POSIX_STRFTIME_LENGTH - 2, format, tp);
  return buffer;
}
