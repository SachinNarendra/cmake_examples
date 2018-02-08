#[[
    SYNTAX:

        string(PREPEND <string variable> [<input>...])
]]
cmake_minimum_required(VERSION 3.10)

set(INPUT_STRING "This is an example of the prepend operation. ")
set(PREPEND_STRING_1 "The operation worked! ")
set(PREPEND_STRING_2 "The operation worked on multiple inputs!! ")

message("Input : ${INPUT_STRING}\n")

string(PREPEND INPUT_STRING ${PREPEND_STRING_1} ${PREPEND_STRING_2})

message("Output : ${INPUT_STRING}\n")