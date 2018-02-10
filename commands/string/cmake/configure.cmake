#[[
    SYNTAX:

        string(CONFIGURE <string1> <output variable> [@ONLY] [ESCAPE_QUOTES])
]]

message("This is an example of the configure operation.\n")

set(INPUT_STRING "\nProject Name : @PROJECT_NAME@\nProject Version : \${PROJECT_VERSION}")
message("Input String: ${INPUT_STRING}\n")

set(PROJECT_NAME Test"P"roject)
set(PROJECT_VERSION "1.24.3")

string(CONFIGURE ${INPUT_STRING} OUTPUT_STRING)
message("Configured String: ${OUTPUT_STRING}\n")


string(CONFIGURE ${INPUT_STRING} OUTPUT_STRING @ONLY)
message("Configured String @ONLY: ${OUTPUT_STRING}\n")


string(CONFIGURE ${INPUT_STRING} OUTPUT_STRING ESCAPE_QUOTES)
message("Configured String ESCAPE_QUOTES: ${OUTPUT_STRING}\n")