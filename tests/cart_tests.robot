*** Settings ***
Resource    ../resources/common/browser_setup.resource
Resource    ../resources/pages/login_page.resource
Resource    ../resources/pages/inventory_page.resource

Test Setup       Login And Go To Inventory
Test Teardown    Close Saucedemo Browser


*** Variables ***
${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce
${BACKPACK_ID}          sauce-labs-backpack
${BIKE_LIGHT_ID}        sauce-labs-bike-light


*** Keywords ***
Login And Go To Inventory
    Open Saucedemo Browser
    Login As    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Inventory Page Should Be Displayed


*** Test Cases ***
Add Single Item To Cart
    [Tags]    TC_006    smoke    cart
    Add Item To Cart    ${BACKPACK_ID}
    Cart Badge Should Show Count    1

Add Multiple Items To Cart
    [Tags]    TC_007    regression    cart
    Add Item To Cart    ${BACKPACK_ID}
    Add Item To Cart    ${BIKE_LIGHT_ID}
    Cart Badge Should Show Count    2

Remove Item From Cart
    [Tags]    TC_008    regression    cart
    Add Item To Cart    ${BACKPACK_ID}
    Cart Badge Should Show Count    1
    Remove Item From Cart    ${BACKPACK_ID}
    Page Should Not Contain Element    ${CART_BADGE}

Cart Icon Navigates To Cart Page
    [Tags]    TC_009    regression    cart
    Add Item To Cart    ${BACKPACK_ID}
    Click Cart Icon
    Location Should Be    https://www.saucedemo.com/cart.html