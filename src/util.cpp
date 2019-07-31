#include "util.h"

#ifdef DEBUG

void log_argv(char** argv) {
    std::cout << "LOGGING ARGV" << std::endl;
    while(*argv) {
        std::cout << "another entry: ";
        std::cout << *argv++ << std::endl;
    }
    std::cout << "DONE LOGGING ARGV" << std::endl;
}

#else

void log_argv(char** argv) {
    std::cout << "LOGGING ARGV" << std::endl;
    std::cout << "DONE LOGGING ARGV" << std::endl;
    return;
}

#endif