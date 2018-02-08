#[[
    SYNTAX:

        string(TOUPPER <input variable> <output variable>)
]]

set(INPUT_STRING "This is an example of the toupper operation. ")
message("Input: ${INPUT_STRING}")

string(TOUPPER ${INPUT_STRING} OUTPUT_STRING)
message("\nOutput : ${OUTPUT_STRING}\n")