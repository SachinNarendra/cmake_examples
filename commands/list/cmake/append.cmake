#[[

    SYNTAX:
        list(APPEND <list> [<element> ...])

]]

message("This is an example of the file append operation.")

list(APPEND SOME_LIST "A" "B" "C")

message("Items in some list:")
foreach(ITEM ${SOME_LIST})
    message(STATUS ${ITEM})
endforeach(ITEM)