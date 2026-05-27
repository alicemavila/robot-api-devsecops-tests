*** Settings ***
Documentation    Users API automated tests

Resource         ../resources/keywords.robot

Suite Setup      Create API Session

*** Test Cases ***
Validate Get Existing User
    [Documentation]    Validate successful retrieval of an existing user
    [Tags]    smoke    regression    get    users

    ${response}=    Get User By Id    2

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Should Be Equal    ${body}[data][first_name]    Janet
    Should Be Equal    ${body}[data][last_name]     Weaver

    Dictionary Should Contain Key    ${body}[data]    email
    Dictionary Should Contain Key    ${body}[data]    avatar

    Log To Console    Existing user validated successfully

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

    Dictionary Should Contain Key    ${body}    name
    Dictionary Should Contain Key    ${body}    job
    Dictionary Should Contain Key    ${body}    id
    Dictionary Should Contain Key    ${body}    createdAt

    Should Not Be Empty    ${body}[name]
    Should Not Be Empty    ${body}[job]

    Log To Console    User created successfully

Validate User Update
    [Documentation]    Validate successful user update
    [Tags]    regression    put    users

    ${response}=    Update Existing User    2

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Dictionary Should Contain Key    ${body}    name
    Dictionary Should Contain Key    ${body}    job
    Dictionary Should Contain Key    ${body}    updatedAt

    Should Be Equal    ${body}[job]    Senior QA Engineer

    Log To Console    User updated successfully

Validate User Deletion
    [Documentation]    Validate successful user deletion
    [Tags]    regression    delete    users

    ${response}=    Delete Existing User    2

    Should Be Equal As Integers    ${response.status_code}    204

    Log To Console    User deleted successfully