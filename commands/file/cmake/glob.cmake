#[[

    SYNTAX:
        file(GLOB <variable> [LIST_DIRECTORIES true|false] [RELATIVE <path>] [<globbing-expressions>...])
        file(GLOB_RECURSE <variable> [FOLLOW_SYMLINKS] [LIST_DIRECTORIES true|false] [RELATIVE <path>] [<globbing-expressions>...])
]]

message("This is an example of the glob opertarion.")

set(SOURCE_DIR "../resources/dir_tree")

# GLOB
file(GLOB PATH_LIST ${SOURCE_DIR}/*)
message("\nEverything from ${SOURCE_DIR} :")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()


file(GLOB PATH_LIST LIST_DIRECTORIES False ${SOURCE_DIR}/*)
message("\nOnly files from ${SOURCE_DIR} :")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()


set(BASE_DIR "/Users/SachinNarendra/Documents/Programming/Projects/")
file(GLOB PATH_LIST RELATIVE ${BASE_DIR} ${SOURCE_DIR}/*)
message("\nEverything from ${SOURCE_DIR} relative to ${BASE_DIR} :")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()

# GLOB_RECURSE
file(GLOB_RECURSE PATH_LIST ${SOURCE_DIR}/*)
message("\nEverything from ${SOURCE_DIR} :")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()


file(GLOB_RECURSE PATH_LIST LIST_DIRECTORIES False ${SOURCE_DIR}/*)
message("\nOnly files from ${SOURCE_DIR} :")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()


set(BASE_DIR "/Users/SachinNarendra/Documents/Programming/Projects/")
file(GLOB_RECURSE PATH_LIST RELATIVE ${BASE_DIR} ${SOURCE_DIR}/*)
message("\nEverything from ${SOURCE_DIR} relative to ${BASE_DIR} :")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()


# TODO : Set up an example to illustrate the use of the FOLLOW_SYMLINKS flag.


# Other GLOB wildcard examples
set(SOURCE_DIR "../resources/dir_tree/similar_file_names")
file(GLOB_RECURSE PATH_LIST LIST_DIRECTORIES False ${SOURCE_DIR}/*some_file.py*)
message("\nOnly some_file(s) from ${SOURCE_DIR} :")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()


# Multiple globbing expressions
set(SOURCE_DIR "../resources/dir_tree/similar_file_names")
file(GLOB_RECURSE PATH_LIST LIST_DIRECTORIES False ${SOURCE_DIR}/*some_file.py ${SOURCE_DIR}/*some_file.pyc)
message("\nOnly some_file(s) (py and pyc) from ${SOURCE_DIR} using separate globbing expressions:")
foreach(PATH ${PATH_LIST})
    message(STATUS ${PATH})
endforeach()