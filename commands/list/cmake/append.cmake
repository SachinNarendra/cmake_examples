#[[

    SYNTAX:
        list(APPEND <list> [<element> ...])

]]

message("This is an example of the list append operation.")

set(SOME_LIST "A" "B" "C")


message("Items in list before append:")
foreach(ITEM ${SOME_LIST})
    message(STATUS ${ITEM})
endforeach(ITEM)


list(APPEND SOME_LIST "X" "Y" "Z")

message("Items in list after append:")
foreach(ITEM ${SOME_LIST})
    message(STATUS ${ITEM})
endforeach(ITEM)