#[[

    SYNTAX:
        list(LENGTH <list> <output variable>)

]]

message("This is an example of the list length operation.")

set(SOME_LIST "A" "B" "C")
list(LENGTH SOME_LIST LIST_LENGTH)

message("The length of the list is : ${LIST_LENGTH}")