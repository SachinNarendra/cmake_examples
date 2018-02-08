#[[
    SYNTAX:

        string(GENEX_STRIP <input string> <output variable>)
]]

set(INPUT_STRING "This is an example of the genex_strip operation.")
message(${INPUT_STRING})

set(EXPRESSION_STRING "Platform ID : $<PLATFORM_ID>")
message("         Input String : '${EXPRESSION_STRING}'")
string(GENEX_STRIP ${EXPRESSION_STRING} OUTPUT_VALUE)
message("Genex Stripped String : '${OUTPUT_VALUE}'")