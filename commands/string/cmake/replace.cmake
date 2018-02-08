#[[
    SYNTAX :

        string(REPLACE <match_string> <replace_string> <output variable> <input> [<input>...])

]]

set(INPUT_STRING_1 "This is an example of the string replace function. ")
set(INPUT_STRING_2 "This is another example of the string replace function. ")
set(MATCH_STRING "string")
set(REPLACEMENT_STRING "STRING")



# Single Input
string(REPLACE ${MATCH_STRING} ${REPLACEMENT_STRING} OUTPUT_STRING ${INPUT_STRING_1} )

message("\nReplacing 'string' with 'STRING'")
message("Input : ${INPUT_STRING_1}")
message("Output : ${OUTPUT_STRING}")



# Multiple Inputs
string(REPLACE ${MATCH_STRING} ${REPLACEMENT_STRING} OUTPUT_STRINGS_COMBINED ${INPUT_STRING_1} ${INPUT_STRING_2} )

message("\nReplacing 'string' with 'STRING' in multiple inputs")
message("Input 1 : ${INPUT_STRING_1}")
message("Input 2 : ${INPUT_STRING_2}")

message("Output is a Combined String : \n${OUTPUT_STRINGS_COMBINED}")