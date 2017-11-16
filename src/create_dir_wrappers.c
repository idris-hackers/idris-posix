#include <sys/stat.h>

int idris_create_dir(const char* filename) {
    // For now we simply assign all the permissions
    // More fine grained control may be subject of future work
    return mkdir(filename, S_IRWXO | S_IRWXG | S_IRWXU);
}
