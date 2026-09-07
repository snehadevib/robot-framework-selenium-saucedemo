*** Settings ***
Resource    ../resources/common/browser_setup.resource

Test Setup       Open Saucedemo Browser
Test Teardown    Close Saucedemo Browser


*** Test Cases ***
Saucedemo Site Should Load
    Title Should Be    Swag Labs