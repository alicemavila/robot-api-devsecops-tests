*** Settings ***
Documentation       Users API automated tests

Resource            ../resources/keywords.robot

Suite Setup         Create API Session


*** Test Cases ***
Validate Get Existing User
    [Documentation]    Validate successful retrieval of an existing user
    [Tags]    smoke    regression    get    users

    ${response}=    Get User By Id    2

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Validate Existing User Response    ${body}
    Validate Existing User Schema    ${body}

    Should Be Equal    ${body}[data][first_name]    Janet
    Should Be Equal    ${body}[data][last_name]    Weaver

    Log To Console    Existing user validated successfully

Validate Get Users List
    [Documentation]    Validate successful retrieval of users list
    [Tags]    smoke    regression    get    users

    ${response}=    Get Users By Page    2

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Validate Users List Response    ${body}
    Validate Users List Schema    ${body}

    Should Be Equal As Integers    ${body}[page]    2

    Log To Console    Users list validated successfully

Validate Non Existing User
    [Documentation]    Validate API response for non existing user
    [Tags]    regression    negative    users

    ${response}=    Get Non Existing User

    Should Be Equal As Integers    ${response.status_code}    404

    Log To Console    Non existing user validated successfully

Validate User Creation
    [Documentation]    Validate successful user creation
    [Tags]    smoke    regression    post    users

    ${response}=    Create New User

    Should Be Equal As Integers    ${response.status_code}    201

    ${body}=    Set Variable    ${response.json()}

    Validate Created User Response    ${body}
    Validate Created User Schema    ${body}

    Log To Console    User created successfully

Validate User Update
    [Documentation]    Validate successful user update
    [Tags]    regression    put    users

    ${response}=    Update Existing User    2

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Validate Updated User Response    ${body}
    Validate Updated User Schema    ${body}

    Should Be Equal    ${body}[job]    Senior QA Engineer

    Log To Console    User updated successfully

Validate User Deletion
    [Documentation]    Validate successful user deletion
    [Tags]    regression    delete    users

    ${response}=    Delete Existing User    2

    Should Be Equal As Integers    ${response.status_code}    204

    Log To Console    User deleted successfully

Validate User Response Security Headers
    [Documentation]    Validate relevant security headers in API response
    [Tags]    regression    security    headers    users

    ${response}=    Get User By Id    2

    Should Be Equal As Integers    ${response.status_code}    200

    Validate Security Headers    ${response.headers}

    Log To Console    Security headers validated successfully
