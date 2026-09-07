*** Settings ***
Resource    ../resources/common/browser_setup.resource
Resource    ../resources/pages/login_page.resource
Resource    ../resources/pages/inventory_page.resource
Resource    ../resources/pages/checkout_page.resource

Test Setup       Login Add Item And Go To Cart
Test Teardown    Close Saucedemo Browser


*** Variables ***
${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce
${BACKPACK_ID}          sauce-labs-backpack
${ERROR_MESSAGE}        css:h3[data-test="error"]


*** Keywords ***
Login Add Item And Go To Cart
    Open Saucedemo Browser
    Login As    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Item To Cart    ${BACKPACK_ID}
    Click Cart Icon


*** Test Cases ***
Complete Checkout With Valid Information
    [Tags]    TC_010    smoke    checkout
    Complete Checkout    John    Doe    12345
    Location Should Be    https://www.saucedemo.com/checkout-complete.html

Checkout Should Fail With Missing First Name
    [Tags]    TC_011    regression    checkout
    Click Checkout
    Fill Checkout Information    ${EMPTY}    Doe    12345
    Click Continue
    Wait Until Page Contains Element    ${ERROR_MESSAGE}    timeout=5s
    Element Should Be Visible    ${ERROR_MESSAGE}
    Element Should Contain    ${ERROR_MESSAGE}    Error: First Name is required

Checkout Should Fail With Missing Postal Code
    [Tags]    TC_012    regression    checkout
    Click Checkout
    Fill Checkout Information    John    Doe    ${EMPTY}
    Click Continue
    Wait Until Page Contains Element    ${ERROR_MESSAGE}    timeout=5s
    Element Should Be Visible    ${ERROR_MESSAGE}
    Element Should Contain    ${ERROR_MESSAGE}    Error: Postal Code is required

Back Home Button Should Return To Inventory Page
    [Tags]    TC_013    regression    checkout
    Complete Checkout    Jane    Smith    54321
    Click Element    ${BACK_HOME_BUTTON}
    Inventory Page Should Be Displayed