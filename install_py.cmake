cmake_minimum_required(VERSION 3.0)

project(wizaction VERSION 1.16.0)
set(SOURCE_REPO "lib-python-wizaction")

message("\nProject Name           : ${PROJECT_NAME}")
message("Project Source Dir     : ${PROJECT_SOURCE_DIR}")
message("Project Version        : ${PROJECT_VERSION}\n")


function(install_py_file)
    #[[
    "
    Compiles a single source py file and installs it to the specified
    destination.
    "
    ]]
    cmake_parse_arguments(PY "SCRIPT" "SRC_FILE;REL_INSTALL_DIR" "" ${ARGN})

#     message(${CMAKE_CURRENT_SOURCE_DIR})
#     message(${CMAKE_CURRENT_BINARY_DIR})
#     message(${PY_SRC_FILE})

    # Get the relative path of the py file
    # Example:
    # CMAKE_CURRENT_LIST_DIR     = /user_data/dev/my-repo/python
    # PY_SRC_FILE            = /user_data/dev/my-repo/python/module/functions.py
    # REL_SRC_FILE               = module/functions.py
    file(RELATIVE_PATH REL_SRC_FILE ${CMAKE_CURRENT_LIST_DIR} ${PY_SRC_FILE})

    # Get the relative dir and name without extension and the extension
    # Example:
    # REL_SRC_FILE               = module/functions.py
    # REL_PATH                   = module
    # FILE_NAME(No extension)    = functions
    get_filename_component(REL_PATH ${REL_SRC_FILE} DIRECTORY)
    get_filename_component(FILE_NAME ${REL_SRC_FILE} NAME_WE)

    # Construct the target file path
    # Example:
    # CMAKE_CURRENT_BINARY_DIR   = /user_data/dev/my-repo/build/python
    set(DEST_FILE "${CMAKE_CURRENT_BINARY_DIR}/${REL_PATH}/${FILE_NAME}.py")
    set(COMPILED_FILE "${CMAKE_CURRENT_BINARY_DIR}/${REL_PATH}/${FILE_NAME}.pyc")

    add_custom_command(
        OUTPUT ${COMPILED_FILE} ${DEST_FILE}
        COMMAND "python" "-m" "py_compile" ${PY_SRC_FILE} DEPENDS ${PY_SRC_FILE}
        COMMAND ${CMAKE_COMMAND} -E copy ${PY_SRC_FILE} ${DEST_FILE} DEPENDS ${PY_SRC_FILE}
        COMMENT "Compiling and Copying ${REL_PATH}/${FILE_NAME}.py"
    )
    list(APPEND DEST_FILES ${DEST_FILE})

    if(${PY_SCRIPT})
        # Not sure if we ever need to/should install to a subdirectory under bin
        set(INSTALL_DEST "bin/${PY_REL_INSTALL_DIR}/${REL_PATH}")
        install(
            FILES ${DEST_FILE}
            DESTINATION ${INSTALL_DEST}
            PERMISSIONS OWNER_EXECUTE OWNER_READ OWNER_WRITE GROUP_EXECUTE GROUP_READ
        )
    else()
        set(INSTALL_DEST "lib/python/${PROJECT_NAME}/${PY_REL_INSTALL_DIR}/${REL_PATH}")
        install(
            FILES ${DEST_FILE}
            DESTINATION ${INSTALL_DEST}
        )
    endif()

    set(TARGET_NAME "${REL_PATH}_${FILE_NAME}")
    string(REPLACE "/" "_" TARGET_NAME ${TARGET_NAME} )
    add_custom_target(${TARGET_NAME} ALL DEPENDS ${DEST_FILES})

endfunction(install_py_file)


function(install_py_files)

    cmake_parse_arguments(PY "SCRIPT" "REL_INSTALL_DIR" "SRC_FILES" ${ARGN})
    # Compute the relative path from a CMAKE_BINARY_DIR to
    # CMAKE_CURRENT_BINARY_DIR and store it in the REL_DESTINATION.

    if(PY_SRC_FILES)
        message("Python files specified for Python Source Directory :")
        message("${CMAKE_CURRENT_SOURCE_DIR}\n")

        foreach(PY_SRC_FILE ${PY_SRC_FILES})
            list(
                APPEND
                PY_SRC_FILE_PATHS
                "${CMAKE_CURRENT_SOURCE_DIR}/${PY_SRC_FILE}"
            )
        endforeach()
    else()
        message("Python files NOT specified for Python Source Directory :")
        message(${CMAKE_CURRENT_SOURCE_DIR})
        message("GLOBBING for files\n")

        file(
            GLOB_RECURSE
            PY_SRC_FILE_PATHS
            "${CMAKE_CURRENT_SOURCE_DIR}/*.py"
         )
    endif()

    foreach(PY_SRC_FILE_PATH ${PY_SRC_FILE_PATHS})
        if(${PY_SCRIPT})
            install_py_file(
                SCRIPT
                SRC_FILE ${PY_SRC_FILE_PATH}
                REL_INSTALL_DIR ${PY_REL_INSTALL_DIR}
            )
        else()
            install_py_file(
                SRC_FILE ${PY_SRC_FILE_PATH}
                REL_INSTALL_DIR ${PY_REL_INSTALL_DIR}
            )
        endif()
    endforeach()

endfunction(install_py_files)


function(install_qt_file)
    #[[
    "
    Compiles a single source UI file based on the Qt version
    and installs it to the specified destination
    "
    ]]

    cmake_parse_arguments(QT "PYSIDE2" "SRC_FILE;REL_INSTALL_DIR" "" ${ARGN})

#     message(${CMAKE_CURRENT_SOURCE_DIR})
#     message(${CMAKE_CURRENT_BINARY_DIR})
#     message(${QT_SRC_FILE})

    # Get the relative path of the ui file
    file(RELATIVE_PATH REL_SRC_FILE ${CMAKE_CURRENT_SOURCE_DIR} ${QT_SRC_FILE})

    # Get the relative dir and name without extension
    get_filename_component(REL_PATH ${REL_SRC_FILE} DIRECTORY)
    get_filename_component(FILE_NAME ${REL_SRC_FILE} NAME_WE)

    # Construct the target file path
    set(PY_FILE "${CMAKE_CURRENT_BINARY_DIR}/${REL_PATH}/${FILE_NAME}.py")

    if (${QT_PYSIDE2})
        set(OUTPUT_FILES
            ${PY_FILE}
            "${CMAKE_CURRENT_BINARY_DIR}/${REL_PATH}/pyside2_${FILE_NAME}.py"
            )
    else()
        # set the output files
        set(
            OUTPUT_FILES
            ${PY_FILE}
            "${CMAKE_CURRENT_BINARY_DIR}/${REL_PATH}/pyside_${FILE_NAME}.py"
            "${CMAKE_CURRENT_BINARY_DIR}/${REL_PATH}/pyqt_${FILE_NAME}.py"
        )
    endif()

    # Add the command that is responsible for converting the ui file to .py
    add_custom_command(
        OUTPUT ${OUTPUT_FILES}
        COMMAND "qtswitch_compile" ${QT_SRC_FILE} ${PY_FILE}
        DEPENDS ${QT_SRC_FILE}
        COMMENT "Converting ${REL_SRC_FILE} to ${REL_PATH}/${FILE_NAME}.py"
    )

    # Construct the target name for this target file
    set(TARGET_NAME "${REL_PATH}_${FILE_NAME}")
    string(REPLACE "/" "_" TARGET_NAME ${TARGET_NAME} )

    # Add a custom target that corresponds to the custom command for the
    # input target file
    add_custom_target(${TARGET_NAME} ALL DEPENDS ${OUTPUT_FILES})

    # Define the make install behaviour for this target file
    # In this case it is installing the py files generated by the qtswitch to
    # the specified destination
    set(INSTALL_DEST "lib/python/${PROJECT_NAME}/${QT_REL_INSTALL_DIR}")
    install(FILES ${OUTPUT_FILES} DESTINATION ${INSTALL_DEST})

endfunction(install_qt_file)


# installs and compiles all source files arguments
function(install_qt_files)

    cmake_parse_arguments(QT "" "REL_INSTALL_DIR" "FILES" ${ARGN})
    # Get the version of QT we are compiling with
    string(
        REGEX MATCH
        ".*/([0-9]+).([0-9]+).([0-9]+)/([0-9a-f]+)"
        matches
        $ENV{BOB_WORLD_SLOT_qt}
    )

    set(QT_WORLD ${CMAKE_MATCH_0})
    set(QT_VERSION_MAJOR ${CMAKE_MATCH_1})
    set(QT_VERSION_MINOR ${CMAKE_MATCH_2})
    set(QT_VERSION_PATCH ${CMAKE_MATCH_3})

    message("\nQT_VERSION   : ${QT_VERSION_MAJOR}.${QT_VERSION_MINOR}.${QT_VERSION_PATCH}")
    message("QT_WORLD : ${QT_WORLD}\n")

    # Get the relative binary path so that is can be used to install the
    # compiled files into the correct sub directory
    # file(RELATIVE_PATH REL_BINARY_DIR ${CMAKE_BINARY_DIR} ${CMAKE_CURRENT_BINARY_DIR})

    set(REL_INSTALL_DIR "widget/ui/")

    # Install all the qt source files
    foreach(SRC_FILE ${QT_FILES})
        if (QT_VERSION_MAJOR EQUAL 5)
            install_qt_file(
                PYSIDE2
                SRC_FILE ${CMAKE_CURRENT_SOURCE_DIR}/${SRC_FILE}
                REL_INSTALL_DIR ${QT_REL_INSTALL_DIR}
            )
        else()
            install_qt_file(
                SRC_FILE ${CMAKE_CURRENT_SOURCE_DIR}/${SRC_FILE}
                REL_INSTALL_DIR ${QT_REL_INSTALL_DIR}
            )
        endif()
    endforeach()

endfunction(install_qt_files)



add_subdirectory(src)
add_subdirectory(scripts)
