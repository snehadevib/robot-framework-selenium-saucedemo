*** Settings ***
Resource    ../resources/common/browser_setup.resource
Resource    ../resources/pages/login_page.resource
Resource    ../resources/pages/inventory_page.resource
Resource    ../resources/pages/checkout_page.resource

Test Setup       Login Add Item And Go To Cart
Test Teardown    Close Saucedemo Browser
Test Template    Checkout Should Succeed With Given Info


*** Variables ***
${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce
${BACKPACK_ID}          sauce-labs-backpack


*** Keywords ***
Login Add Item And Go To Cart
    Open Saucedemo Browser
    Login As    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Item To Cart    ${BACKPACK_ID}
    Click Cart Icon

Checkout Should Succeed With Given Info
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Complete Checkout    ${first_name}    ${last_name}    ${postal_code}
    Location Should Be    https://www.saucedemo.com/checkout-complete.html


*** Test Cases ***    FIRST NAME    LAST NAME    POSTAL CODE
TC_015 Checkout With Standard Name                John        Doe         12345
TC_016 Checkout With Long Postal Code              Jane       Smith       A1B2C3
TC_017 Checkout With Single Character Names        A          B           1
TC_018 Checkout With Hyphenated Last Name          Mary      Smith-Jones     90210