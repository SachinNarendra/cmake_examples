#[[

    SYNTAX:
        file(APPEND <filename> <content>...)

]]

message("This is an example of the file append operation.")

set(APPEND_CONTENT "\nDEPENDENCY_CMAKE 3.0")
set(INPUT_FILE_PATH "../resources/package")

file(READ ${INPUT_FILE_PATH} FILE_CONTENT)
message("File Contents Before Append : \n\n${FILE_CONTENT}\n")

file(APPEND ${INPUT_FILE_PATH} ${APPEND_CONTENT})

file(READ ${INPUT_FILE_PATH} FILE_CONTENT)
message("File Contents After Append  : \n\n${FILE_CONTENT}\n")

