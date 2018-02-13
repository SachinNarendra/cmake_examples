#[[

    SYNTAX:
        file(STRINGS <filename> <variable> [<options>...])

]]

message("This is an example of the file strings operation.\n")

set(INPUT_FILE_PATH "../resources/package")


file(STRINGS ${INPUT_FILE_PATH} LINES)
message("All Lines : ")
foreach(LINE ${LINES})
    message(${LINE})
endforeach()


# LENGTH_MAXIMUM
# This one is not what you'd expect.
# It doesn't return only the lines that are les than L_MAX.
# Instead it returns the longer lines split up into chunks
# that are <= L_MAX in length. IS THIS MAYBE A BUG ??
set(L_MAX 14)
file(STRINGS ${INPUT_FILE_PATH} LINES LENGTH_MAXIMUM ${L_MAX})
message("\nLines of length less than ${L_MAX} : ")
foreach(LINE ${LINES})
    message(${LINE})
endforeach()


# LENGTH_MINIMUM
# Works as expected. Returns only lines that are >= than L_MIN.
set(L_MIN 19)
file(STRINGS ${INPUT_FILE_PATH} LINES LENGTH_MINIMUM ${L_MIN})
message("\nLines of length greater than ${L_MIN} : ")
foreach(LINE ${LINES})
    message(${LINE})
endforeach()



# LIMIT_COUNT
# Returns only the first L_CNT lines.
set(L_CNT 2)
file(STRINGS ${INPUT_FILE_PATH} LINES LIMIT_COUNT ${L_CNT})
message("\nFirst n(=${L_CNT}) lines : ")
foreach(LINE ${LINES})
    message(${LINE})
endforeach()



# LIMIT_INPUT
# Returns only lines after reading only the first L_IN characters of the file.
set(L_IN 25)
file(STRINGS ${INPUT_FILE_PATH} LINES LIMIT_INPUT ${L_IN})
message("\nLines within first n(=${L_IN}) characters: ")
foreach(LINE ${LINES})
    message(${LINE})
endforeach()


# LIMIT_OUTPUT
# Returns only lines after reading only the first L_IN characters of the file.
set(L_OUT 25)
file(STRINGS ${INPUT_FILE_PATH} LINES LIMIT_OUTPUT ${L_OUT})
message("\nLines within the output, which is limited to n(=${L_OUT}) characters: ")
foreach(LINE ${LINES})
    message(${LINE})
endforeach()


# REGEX
# Returns only lines that match the regex pattern.
set(RE_PATTERN "VERSION[ ]+[0-9]+")
file(STRINGS ${INPUT_FILE_PATH} LINES REGEX ${RE_PATTERN})
message("\nLines that match the regex ${RE_PATTERN}: ")
foreach(LINE ${LINES})
    message(${LINE})
endforeach()



