#[[

    SYNTAX:
        file(WRITE <filename> <content>...)

]]

message("This is an example of the file write operation.")

set(WRITE_CONTENT "NAME cmake_examples
OWNER sachin-n
VERSION 4.03.45
")

set(INPUT_FILE_PATH "../resources/package")

file(READ ${INPUT_FILE_PATH} FILE_CONTENT)
message("File Contents Before Write : \n\n${FILE_CONTENT}\n")

file(WRITE ${INPUT_FILE_PATH} ${WRITE_CONTENT})

file(READ ${INPUT_FILE_PATH} FILE_CONTENT)
message("File Contents After Write  : \n\n${FILE_CONTENT}\n")
