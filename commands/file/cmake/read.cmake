#[[

    SYNTAX :

        file(READ <filename> <variable> [OFFSET <offset>] [LIMIT <max-in>] [HEX])
]]

message("This is an example of the file read operation")

set(INPUT_FILE_PATH "../resources/package")

file(READ ${INPUT_FILE_PATH} FILE_CONTENT)
message("File Contents Full: \n\n${FILE_CONTENT}\n")

file(READ ${INPUT_FILE_PATH} FILE_CONTENT HEX)
message("File Contents HEX: \n\n${FILE_CONTENT}\n")

set(F_OFFSET 10)
file(READ ${INPUT_FILE_PATH} FILE_CONTENT OFFSET ${F_OFFSET})
message("File Contents Offset ${F_OFFSET}: \n\n${FILE_CONTENT}\n")

set(F_LIMIT 20)
file(READ ${INPUT_FILE_PATH} FILE_CONTENT OFFSET ${F_OFFSET} LIMIT ${F_LIMIT})
message("File Contents Offset ${F_OFFSET} Limit ${F_LIMIT}: \n\n${FILE_CONTENT}\n")


