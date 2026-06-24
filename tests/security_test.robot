*** Settings ***
Documentation       API security automated tests

Resource            ../resources/keywords.robot


*** Test Cases ***
Validate Request Without API Key
    [Documentation]    Validate API returns unauthorized when x-api-key is missing
    [Tags]    regression    negative    security    auth

    Create API Session Without API Key

    ${response}=    Request User Without API Key

    Should Be Equal As Integers    ${response.status_code}    401

    ${body}=    Set Variable    ${response.json()}

    Dictionary Should Contain Key    ${body}    error

    Should Be Equal
    ...    ${body}[error]
    ...    missing_api_key

    Log To Console    Missing API key validated successfully

Validate Request With Invalid API Key
    [Documentation]    Validate API returns forbidden when x-api-key is invalid
    [Tags]    regression    negative    security    auth

    Create API Session With Invalid API Key

    ${response}=    Request User With Invalid API Key

    Should Be Equal As Integers    ${response.status_code}    403

    ${body}=    Set Variable    ${response.json()}

    Dictionary Should Contain Key    ${body}    error

    Should Be Equal
    ...    ${body}[error]
    ...    invalid_api_key

    Log To Console    Invalid API key validated successfully
