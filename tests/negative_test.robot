*** Settings ***
Documentation       Negative API tests with invalid or incomplete payloads

Resource            ../resources/keywords.robot

Suite Setup         Create API Session


*** Test Cases ***
Validate Login Without Email
    [Documentation]    Validate login error when email is missing
    [Tags]    regression    negative    auth    payload
    ${response}=    Login Without Email
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.json()}
    Validate Error Response Schema    ${body}
    Dictionary Should Contain Key    ${body}    error
    Should Not Be Empty    ${body}[error]

Validate Login With Empty Payload
    [Documentation]    Validate login error when payload is empty
    [Tags]    regression    negative    auth    payload
    ${response}=    Login With Empty Payload
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.json()}
    Validate Error Response Schema    ${body}
    Dictionary Should Contain Key    ${body}    error
    Should Not Be Empty    ${body}[error]

Validate Register Without Password
    [Documentation]    Validate register error when password is missing
    [Tags]    regression    negative    register    payload
    ${response}=    Register Without Password
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.json()}
    Validate Error Response Schema    ${body}
    Dictionary Should Contain Key    ${body}    error
    Should Not Be Empty    ${body}[error]

Validate Register With Empty Payload
    [Documentation]    Validate register error when payload is empty
    [Tags]    regression    negative    register    payload
    ${response}=    Register With Empty Payload
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.json()}
    Validate Error Response Schema    ${body}
    Dictionary Should Contain Key    ${body}    error
    Should Not Be Empty    ${body}[error]
