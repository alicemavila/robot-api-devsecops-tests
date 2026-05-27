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


Create API Session Without API Key
    ${headers}=    Create Dictionary
    ...    Content-Type=application/json

    Create Session
    ...    alias=reqres_no_key
    ...    url=${BASE_URL}
    ...    headers=${headers}
    ...    timeout=${DEFAULT_TIMEOUT}
    ...    verify=${VERIFY_SSL}


Create API Session With Invalid API Key
    ${headers}=    Create Dictionary
    ...    x-api-key=invalid-api-key
    ...    Content-Type=application/json

    Create Session
    ...    alias=reqres_invalid_key
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


Get Users By Page
    [Arguments]    ${page}

    ${response}=    GET On Session
    ...    reqres
    ...    ${USERS_ENDPOINT}
    ...    params=page=${page}

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


Login Successfully
    ${payload}=    Create Dictionary
    ...    email=eve.holt@reqres.in
    ...    password=cityslicka

    ${response}=    POST On Session
    ...    reqres
    ...    ${LOGIN_ENDPOINT}
    ...    json=${payload}
    ...    expected_status=200

    RETURN    ${response}


Login Without Password
    ${payload}=    Create Dictionary
    ...    email=peter@klaven

    ${response}=    POST On Session
    ...    reqres
    ...    ${LOGIN_ENDPOINT}
    ...    json=${payload}
    ...    expected_status=400

    RETURN    ${response}


Request User Without API Key
    ${response}=    GET On Session
    ...    reqres_no_key
    ...    ${USERS_ENDPOINT}/2
    ...    expected_status=401

    RETURN    ${response}


Request User With Invalid API Key
    ${response}=    GET On Session
    ...    reqres_invalid_key
    ...    ${USERS_ENDPOINT}/2
    ...    expected_status=403

    RETURN    ${response}


Validate Existing User Response
    [Arguments]    ${body}

    Dictionary Should Contain Key    ${body}          data
    Dictionary Should Contain Key    ${body}          support
    Dictionary Should Contain Key    ${body}[data]    id
    Dictionary Should Contain Key    ${body}[data]    email
    Dictionary Should Contain Key    ${body}[data]    first_name
    Dictionary Should Contain Key    ${body}[data]    last_name
    Dictionary Should Contain Key    ${body}[data]    avatar

    Should Contain         ${body}[data][email]     @reqres.in
    Should Not Be Empty    ${body}[data][avatar]


Validate Users List Response
    [Arguments]    ${body}

    Dictionary Should Contain Key    ${body}    page
    Dictionary Should Contain Key    ${body}    per_page
    Dictionary Should Contain Key    ${body}    total
    Dictionary Should Contain Key    ${body}    total_pages
    Dictionary Should Contain Key    ${body}    data
    Dictionary Should Contain Key    ${body}    support

    Should Not Be Empty    ${body}[data]


Validate Created User Response
    [Arguments]    ${body}

    Dictionary Should Contain Key    ${body}    name
    Dictionary Should Contain Key    ${body}    job
    Dictionary Should Contain Key    ${body}    id
    Dictionary Should Contain Key    ${body}    createdAt

    Should Not Be Empty    ${body}[name]
    Should Not Be Empty    ${body}[job]
    Should Not Be Empty    ${body}[id]
    Should Not Be Empty    ${body}[createdAt]


Validate Updated User Response
    [Arguments]    ${body}

    Dictionary Should Contain Key    ${body}    name
    Dictionary Should Contain Key    ${body}    job
    Dictionary Should Contain Key    ${body}    updatedAt

    Should Not Be Empty    ${body}[name]
    Should Not Be Empty    ${body}[job]
    Should Not Be Empty    ${body}[updatedAt]


Validate Security Headers
    [Arguments]    ${headers}

    Dictionary Should Contain Key    ${headers}    Content-Type
    Dictionary Should Contain Key    ${headers}    X-Content-Type-Options
    Dictionary Should Contain Key    ${headers}    X-Frame-Options