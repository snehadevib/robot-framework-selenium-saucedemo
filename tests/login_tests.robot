*** Settings ***
Resource    ../resources/common/browser_setup.resource
Resource    ../resources/pages/login_page.resource

Test Setup       Open Saucedemo Browser
Test Teardown    Close Saucedemo Browser


*** Variables ***
${VALID_USERNAME}          standard_user
${VALID_PASSWORD}          secret_sauce
${LOCKED_OUT_USERNAME}     locked_out_user


*** Test Cases ***
Valid Login Should Succeed
    [Tags]    TC_002    smoke    login
     Login As    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Location Should Be    https://www.saucedemo.com/inventory.html

Locked Out User Should See Error Message
    [Tags]    TC_003    regression    login
    Login As    ${LOCKED_OUT_USERNAME}    ${VALID_PASSWORD}
    Error Message Should Be Displayed    Sorry, this user has been locked out.

Empty Username Should Show Error
    [Tags]    TC_004    regression    login
    Login As    ${EMPTY}    ${VALID_PASSWORD}
    Error Message Should Be Displayed    Username is required

Empty Password Should Show Error
    [Tags]    TC_005    regression    login
    Login As    ${VALID_USERNAME}    ${EMPTY}
    Error Message Should Be Displayed    Password is required