#[[
    SYNTAX:

        string(TOLOWER <input variable> <output variable>)
]]

set(INPUT_STRING "This is an example of the TOLOWER operation. ")
message("Input: ${INPUT_STRING}")

string(TOLOWER ${INPUT_STRING} OUTPUT_STRING)
message("\nOutput : ${OUTPUT_STRING}\n")