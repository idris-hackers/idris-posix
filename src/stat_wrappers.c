#include <sys/stat.h>

inline int idris_posix_stat_file_type(char *filename) {
  struct stat buffer;
  stat(filename, &buffer);
  return buffer.st_mode & S_IFMT;
}

inline int idris_posix_is_directory(char *filename) {
  return idris_posix_stat_file_type(filename) == S_IFDIR;
}

inline int idris_posix_is_file(char *filename) {
  return idris_posix_stat_file_type(filename) == S_IFREG;
}
