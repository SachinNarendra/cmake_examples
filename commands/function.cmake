function(some_function)

    set(options OPTION)
    cmake_parse_arguments(TEST ${options} "" "" ${ARGN})

    if(TEST_OPTION)
        message("OPTION Specified")
    else()
        message("OPTION Not Specified")
    endif()
endfunction(some_function)

some_function()