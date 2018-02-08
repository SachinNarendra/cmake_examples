#[[
    SYNTAX:

        string(LENGTH <string> <output variable>)
]]

set(INPUT_STRING "This is an example of the length operation. ")
message("Input: ${INPUT_STRING}")

string(LENGTH ${INPUT_STRING} OUTPUT_VALUE)
message("\nLength of the string : ${OUTPUT_VALUE}\n")