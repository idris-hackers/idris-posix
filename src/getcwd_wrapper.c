#include <unistd.h>


// Used to avoid recomputing the buffer size for the `getcwd` call
long int _idris_getcwd_pmax = 0;

char *idris_getcwd() {
    if (_idris_getcwd_pmax == 0) {
        _idris_getcwd_pmax = pathconf("/", _PC_PATH_MAX);
    }
    // Passing NULL here is part of the extended POSIX interface.
    // It means `getcwd` allocates the buffer itself.
    // Should it transpire that too few platforms support this
    // we may have to allocate the buffer ourselves.
    return getcwd(NULL, _idris_getcwd_pmax);
}
