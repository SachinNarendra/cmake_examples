#[[
    SYNTAX:

        string(UUID <output variable> NAMESPACE <namespace> NAME <name> TYPE <MD5|SHA1> [UPPER])
]]

set(INPUT_STRING "This is an example of the UUID operation.")
message("Input String: '${INPUT_STRING}'\n")

set(UUID_DNS_NAMESPACE 6ba7b810-9dad-11d1-80b4-00c04fd430c8)

# Cannot generate a UUID without a valid NAMESPACE
string(UUID OUTPUT_UUID NAMESPACE ${UUID_DNS_NAMESPACE} NAME CMake-Sachin TYPE SHA1)
message("UUID: ${OUTPUT_UUID}" )

