*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${USERNAME_FIELD}      id:user-name
${PASSWORD_FIELD}      id:password
${LOGIN_BUTTON}         id:login-button
${ERROR_MESSAGE}        css:h3[data-test="error"]


*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Element    ${LOGIN_BUTTON}

Login As
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button

Error Message Should Be Displayed
    [Arguments]    ${expected_message}
    Element Should Be Visible    ${ERROR_MESSAGE}
    Element Should Contain    ${ERROR_MESSAGE}    ${expected_message}