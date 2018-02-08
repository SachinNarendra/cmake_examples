#[[
    SYNTAX:

        string(COMPARE LESS <string1> <string2> <output variable>)
        string(COMPARE GREATER <string1> <string2> <output variable>)
        string(COMPARE EQUAL <string1> <string2> <output variable>)
        string(COMPARE NOTEQUAL <string1> <string2> <output variable>)
        string(COMPARE LESS_EQUAL <string1> <string2> <output variable>)
        string(COMPARE GREATER_EQUAL <string1> <string2> <output variable>)
]]

set(INPUT_STRING "   This is an example of the strip operation. ")
message(${INPUT_STRING})

set(INPUT_STRING_1 "abcd")
set(INPUT_STRING_2 "abbd")
message("Input 1: '${INPUT_STRING_1}' ")
message("Input 2: '${INPUT_STRING_2}' ")
message("")

# The comparison uses lexicographical ordering:
# First the first two items are compared, and if they differ this
# determines the outcome of the comparison; if they are equal,
# the next two items are compared, and so on, until either sequence is exhausted.
# For example if we compare two strings 'abcd' and 'abbd', it goes
#    a==a <check_next>
#         b==b <check_next>
#              c>b <difference detected : result returned based on these characters>
# doesn't matter what comes next in either string

string(COMPARE LESS ${INPUT_STRING_1} ${INPUT_STRING_2} OUTPUT_VALUE)
message("${INPUT_STRING_1} LESS than ${INPUT_STRING_2}          : ${OUTPUT_VALUE}")


string(COMPARE GREATER ${INPUT_STRING_1} ${INPUT_STRING_2} OUTPUT_VALUE)
message("${INPUT_STRING_1} GREATER than ${INPUT_STRING_2}       : ${OUTPUT_VALUE}")


string(COMPARE EQUAL ${INPUT_STRING_1} ${INPUT_STRING_2} OUTPUT_VALUE)
message("${INPUT_STRING_1} EQUAL to ${INPUT_STRING_2}           : ${OUTPUT_VALUE}")


string(COMPARE NOTEQUAL ${INPUT_STRING_1} ${INPUT_STRING_2} OUTPUT_VALUE)
message("${INPUT_STRING_1} NOTEQUAL to ${INPUT_STRING_2}        : ${OUTPUT_VALUE}")


string(COMPARE LESS_EQUAL ${INPUT_STRING_1} ${INPUT_STRING_2} OUTPUT_VALUE)
message("${INPUT_STRING_1} LESS_EQUAL to ${INPUT_STRING_2}      : ${OUTPUT_VALUE}")


string(COMPARE GREATER_EQUAL ${INPUT_STRING_1} ${INPUT_STRING_2} OUTPUT_VALUE)
message("${INPUT_STRING_1} GREATER_EQUAL to ${INPUT_STRING_2}   : ${OUTPUT_VALUE}")