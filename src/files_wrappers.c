#include <unistd.h>

int idris_file_exists(const char *path) {
    // simply check for existence
    return access(path, F_OK) == 0;
}
