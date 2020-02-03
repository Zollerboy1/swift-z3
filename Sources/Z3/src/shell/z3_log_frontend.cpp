/*++
Copyright (c) 2011 Microsoft Corporation

Module Name:

    z3_log_frontend.cpp

Abstract:

    Z3 log frontend.
    Replay a log generated by Z3

Author:

    Leonardo de Moura (leonardo) 2011-09-26.

Revision History:

--*/
#include<iostream>
#include<fstream>
#include<time.h>
#include "../util/util.h"
#include "../util/error_codes.h"
#include "../api/z3_replayer.h"

static void solve(char const * stream_name, std::istream & in) {
    clock_t start_time = clock();
    z3_replayer r(in);
    try {
        r.parse();
    }
    catch (z3_exception & ex) {
        std::cerr << "Error at line " << r.get_line() << ": " << ex.msg() << std::endl;
    }
    clock_t end_time = clock();
    memory::display_max_usage(std::cout);
    std::cout << "time:               " << ((static_cast<double>(end_time) - static_cast<double>(start_time)) / CLOCKS_PER_SEC) << "\n";
}

void replay_z3_log(char const * file_name) {
    if (!file_name) {
        solve(file_name, std::cin);
    }
    else {
        std::ifstream in(file_name);
        if (in.bad() || in.fail()) {
            std::cerr << "Error: failed to open file \"" << file_name << "\".\n";
            exit(ERR_OPEN_FILE);
        }
        solve(file_name, in);
    }
    exit(0);
}


