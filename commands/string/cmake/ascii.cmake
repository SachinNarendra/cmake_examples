#[[
    SYNTAX:

        string(ASCII <number> [<number> ...] <output variable>)
]]

set(INPUT_STRING "This is an example of the ascii operation. ")
message("${INPUT_STRING}\n")

set(NUMBER_1 192)

string(ASCII ${NUMBER_1} OUTPUT_VALUE)
message("\nOutput : ${OUTPUT_VALUE}\n")