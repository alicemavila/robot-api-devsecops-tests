*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    payloads/user_payloads.py

Variables    config/variables.py
Variables    config/endpoints.py

*** Keywords ***
Create API Session
    ${headers}=    Create Dictionary
    ...    x-api-key=${API_KEY}
    ...    Content-Type=application/json

    Create Session
    ...    alias=reqres
    ...    url=${BASE_URL}
    ...    headers=${headers}
    ...    timeout=${DEFAULT_TIMEOUT}
    ...    verify=${VERIFY_SSL}

Get User By Id
    [Arguments]    ${user_id}

    ${response}=    GET On Session
    ...    reqres
    ...    ${USERS_ENDPOINT}/${user_id}

    RETURN    ${response}

Get Non Existing User
    ${response}=    GET On Session
    ...    reqres
    ...    ${USERS_ENDPOINT}/999
    ...    expected_status=404

    RETURN    ${response}

Create New User
    ${payload}=    Create User Payload

    ${response}=    POST On Session
    ...    reqres
    ...    ${USERS_ENDPOINT}
    ...    json=${payload}
    ...    expected_status=201

    RETURN    ${response}

Update Existing User
    [Arguments]    ${user_id}

    ${payload}=    Update User Payload

    ${response}=    PUT On Session
    ...    reqres
    ...    ${USERS_ENDPOINT}/${user_id}
    ...    json=${payload}
    ...    expected_status=200

    RETURN    ${response}

Delete Existing User
    [Arguments]    ${user_id}

    ${response}=    DELETE On Session
    ...    reqres
    ...    ${USERS_ENDPOINT}/${user_id}
    ...    expected_status=204

    RETURN    ${response}