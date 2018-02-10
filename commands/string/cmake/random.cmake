#[[
    SYNTAX:

        string(RANDOM [LENGTH <length>] [ALPHABET <alphabet>] [RANDOM_SEED <seed>] <output variable>)
]]

set(INPUT_STRING "This is an example of the random operation.")
message("Input String: '${INPUT_STRING}'\n")

# Default LENGTH = 5
# Default ALPHABET = all numbers and upper and lower case letters
set(R_LENGTH 7)
string (RANDOM LENGTH ${R_LENGTH} ALPHABET ${INPUT_STRING} RANDOM_STRING)

message("Random string of length ${R_LENGTH} using the letters in '${INPUT_STRING}' : ${RANDOM_STRING}\n")



