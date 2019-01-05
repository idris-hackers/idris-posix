#include <sys/stat.h>

inline int idris_posix_stat_file_type(char *filename) {
  struct stat buffer;
  stat(filename, &buffer);
  return buffer.st_mode;
}

inline int idris_posix_is_directory(char *filename) {
  return S_ISDIR(idris_posix_stat_file_type(filename));
}

inline int idris_posix_is_file(char *filename) {
  return S_ISREG(idris_posix_stat_file_type(filename));
}
