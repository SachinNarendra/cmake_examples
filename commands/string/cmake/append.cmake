#[[
    SYNTAX:

        string(APPEND <string variable> [<input>...])
]]

set(INPUT_STRING "This is an example of the append operation. ")
set(APPEND_STRING_1 "The operation worked! ")
set(APPEND_STRING_2 "The operation worked on multiple inputs!! ")

message("Input : ${INPUT_STRING}\n")

string(APPEND INPUT_STRING ${APPEND_STRING_1} ${APPEND_STRING_2})

message("Output : ${INPUT_STRING}\n")