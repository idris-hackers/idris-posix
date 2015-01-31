#include <dirent.h>

inline char *idris_posix_dirent_d_name(struct dirent* d) {
  return d->d_name;
}
