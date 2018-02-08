#[[
    SYNTAX:

        string(CONCAT <output variable> [<input>...])
]]

set(INPUT_STRING_1 "This is an example of the concat operation. ")
set(INPUT_STRING_2 "The operation worked! ")
set(INPUT_STRING_3 "The operation worked on multiple inputs!! ")

message("Input 1: ${INPUT_STRING_1}")
message("Input 2: ${INPUT_STRING_2}")
message("Input 3: ${INPUT_STRING_3}")

string(CONCAT OUTPUT_STRING ${INPUT_STRING_1} ${INPUT_STRING_2} ${INPUT_STRING_3})

message("\nOutput : ${OUTPUT_STRING}\n")