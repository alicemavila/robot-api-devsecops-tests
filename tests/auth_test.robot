*** Settings ***
Documentation    Authentication API automated tests

Resource         ../resources/keywords.robot

Suite Setup      Create API Session

*** Test Cases ***
Validate Successful Login
    [Documentation]    Validate successful login with valid credentials
    [Tags]    smoke    regression    auth    login

    ${response}=    Login Successfully

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Dictionary Should Contain Key    ${body}    token
    Should Not Be Empty             ${body}[token]

    Log To Console    Successful login validated

Validate Login Without Password
    [Documentation]    Validate login error when password is missing
    [Tags]    regression    negative    auth    login

    ${response}=    Login Without Password

    Should Be Equal As Integers    ${response.status_code}    400

    ${body}=    Set Variable    ${response.json()}

    Dictionary Should Contain Key    ${body}    error
    Should Not Be Empty             ${body}[error]

    Log To Console    Login without password validated