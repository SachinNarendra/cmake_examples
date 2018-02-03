#[[
    SYNTAX :

        string(REGEX MATCH <regular_expression> <output variable> <input> [<input>...])

        string(REGEX MATCHALL <regular_expression> <output variable> <input> [<input>...])

        string(REGEX REPLACE <regular_expression> <replace_expression> <output variable> <input> [<input>...])

]]

set(INPUT_STRING "This is an example of the regex match operation. Lets see what it matches.")
message("Input : ${INPUT_STRING}\n")

set(REGEX_PATTERN "([ ]?)([a-zA-Z]+)s")

string(REGEX MATCH ${REGEX_PATTERN} MATCH_RESULT ${INPUT_STRING})
message("First word that ends with the letter 's' : ${MATCH_RESULT}")
message("Initial letters of first word that ends with the letter 's' : ${CMAKE_MATCH_2}\n")

string(REGEX MATCHALL ${REGEX_PATTERN} MATCHALL_RESULT ${INPUT_STRING})
message("All the words that with the letter 's' : ${MATCHALL_RESULT}")
# CMAKE_MATCH_<n> is overwritten everytime there is a match so only the last word is available
message("Initial letters of last word that ends with the letter 's' : ${CMAKE_MATCH_2}\n")


string(REGEX REPLACE ${REGEX_PATTERN} "\\1REDACTED" REPLACE_RESULT ${INPUT_STRING})
message("All the words that end with the letter 's' redacted: \n${REPLACE_RESULT}\n")
