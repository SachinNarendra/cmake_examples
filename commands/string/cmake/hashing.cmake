#[[
    SYNTAX:

        string(<HASH> <output variable> <input>)
]]

set(INPUT_STRING "This is an example of the hashing operation. ")
message("Input String: '${INPUT_STRING}'\n")

string(SHA1 HASH_VALUE ${INPUT_STRING} )
message("Hash value of the string using SHA1  : ${HASH_VALUE}")

string(MD5 HASH_VALUE ${INPUT_STRING} )
message("Hash value of the string using MD5   : ${HASH_VALUE}")