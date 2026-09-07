*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          https://www.saucedemo.com/
${TIMEOUT}      10s


*** Keywords ***
Open Saucedemo Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Saucedemo Browser
    Close Browser