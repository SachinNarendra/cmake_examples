#[[
    SYNTAX:

        string(TIMESTAMP <output variable> [<format string>] [UTC])
]]

set(INPUT_STRING "This is an example of the timestamp operation.")
message("Input String: '${INPUT_STRING}'\n")


string(TIMESTAMP OUTPUT_VALUE )
message("Default formatting : ${OUTPUT_VALUE}")


string(TIMESTAMP OUTPUT_VALUE "[Day %j : %d/%m/%y]")
message("Custom formatting  : ${OUTPUT_VALUE}\n")