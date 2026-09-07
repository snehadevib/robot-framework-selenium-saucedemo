*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          https://www.saucedemo.com/
${TIMEOUT}      10s


*** Keywords ***
Open Saucedemo Browser
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False, "profile.password_manager_leak_detection": False}); add_argument("--disable-notifications")
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Saucedemo Browser
    Close Browser