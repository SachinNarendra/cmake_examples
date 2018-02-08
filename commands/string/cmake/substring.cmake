#[[
    SYNTAX:

        string(SUBSTRING <string> <begin> <length> <output variable>)
]]
cmake_minimum_required(VERSION 3.1)

set(INPUT_STRING "This is an example of the substring operation. ")
message("Input: ${INPUT_STRING}")
set(SUBSTRING_START 11)
set(SUBSTRING_LENGTH 24)

string(SUBSTRING ${INPUT_STRING} ${SUBSTRING_START} ${SUBSTRING_LENGTH} OUTPUT_VALUE)
message("\nSubstring starting at pos ${SUBSTRING_START}, with a length ${SUBSTRING_LENGTH}: '${OUTPUT_VALUE}'\n")
