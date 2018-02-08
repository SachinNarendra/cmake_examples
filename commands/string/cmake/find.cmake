#[[
    SYNTAX :

        string(FIND <string> <substring> <output variable> [REVERSE])

]]

set(INPUT_STRING "This is an example of the find operation! lets see what it finds.")
set(SUB_STRING "find")

string(FIND ${INPUT_STRING} ${SUB_STRING} POS_FIRST)
message("Position of first occurance : ${POS_FIRST}")

string(FIND ${INPUT_STRING} ${SUB_STRING} POS_LAST REVERSE)
message("Position of last occurance end : ${POS_LAST}")

set(NOT_SUB_STRING "not found")

string(FIND ${INPUT_STRING} ${NOT_SUB_STRING} POS_NOT_FOUND)
message("Position when not found : ${POS_NOT_FOUND}")

set(UC_SUB_STRING "FIND")

string(FIND ${INPUT_STRING} ${UC_SUB_STRING} POS_DIFF_CASE)
message("Position when string exists in a different case : ${POS_DIFF_CASE}")
