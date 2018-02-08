#[[
    SYNTAX :

        string(REGEX MATCH <regular_expression> <output variable> <input> [<input>...])

        string(REGEX MATCHALL <regular_expression> <output variable> <input> [<input>...])

        string(REGEX REPLACE <regular_expression> <replace_expression> <output variable> <input> [<input>...])

]]

set(INPUT_STRING "This is an example of the regex operations. Lets see what it does.")
message("Input : ${INPUT_STRING}\n")

set(REGEX_PATTERN "([ ]?)([a-zA-Z]+)(s)")

string(REGEX MATCH ${REGEX_PATTERN} MATCH_RESULT ${INPUT_STRING})
message("First word that ends with the letter 's' : ${MATCH_RESULT}")
message("Initial letters of first word that ends with the letter 's' : ${CMAKE_MATCH_2}\n")

string(REGEX MATCHALL ${REGEX_PATTERN} MATCHALL_RESULT ${INPUT_STRING})
message("All the words that with the letter 's' : ${MATCHALL_RESULT}")
# CMAKE_MATCH_<n> is overwritten everytime there is a match so only the last word is available
message("Initial letters of last word that ends with the letter 's' : ${CMAKE_MATCH_2}\n")

# The regex pattern is set to capture
#     - the space/no space before the words ending with an s
#     - the letters preceeding the ending 's'
#     - the ending 's' itself
# For example , in the input string used here,
# when the regex pattern encounters the words "This is ...."
# it captures
# (<NoSpace>)(Thi)(s) from This
# (<Space>)(i)(s)  from is
# the can be accessed as a whole using \\0 or
# individually using \\1 , \\2, \\3

# Case 1: Prefix an @ to the words ending with 's'
string(REGEX REPLACE ${REGEX_PATTERN} "\\1@\\2\\3" REPLACE_RESULT ${INPUT_STRING})
message("All the words that end with the letter 's' prefixed: \n${REPLACE_RESULT}\n")

# Case 2: Redact all the words ending with 's'
string(REGEX REPLACE ${REGEX_PATTERN} "\\1REDACTED" REPLACE_RESULT ${INPUT_STRING})
message("All the words that end with the letter 's' redacted: \n${REPLACE_RESULT}\n")

# Case 3: Replace the ending 's' with '(s)'
string(REGEX REPLACE ${REGEX_PATTERN} "\\1\\2(s)" REPLACE_RESULT ${INPUT_STRING})
message("All the words that end with the letter 's' redacted: \n${REPLACE_RESULT}\n")