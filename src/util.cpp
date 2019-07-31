#include "util.h"

void log_argv(char** argv) {
#ifdef DEBUG
    while(*argv) {
        std::cout << *argv++ << std::endl;
    }
#else
#endif
    return;
}
