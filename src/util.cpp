#include "util.h"

void log_argv(char** argv) {
    while(*argv) {
        std::cout << *argv++ << std::endl;
    }
}