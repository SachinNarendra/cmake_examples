#[[
    SYNTAX:

        string(STRIP <string> <output variable>)
]]

set(INPUT_STRING "   This is an example of the strip operation. ")
message("Input: '${INPUT_STRING}' ")

string(STRIP ${INPUT_STRING} OUTPUT_VALUE)
message("\nStripped String : '${OUTPUT_VALUE}'")