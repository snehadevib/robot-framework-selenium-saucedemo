*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${CHECKOUT_BUTTON}         id:checkout
${FIRST_NAME_FIELD}        id:first-name
${LAST_NAME_FIELD}         id:last-name
${POSTAL_CODE_FIELD}       id:postal-code
${CONTINUE_BUTTON}         id:continue
${CANCEL_BUTTON}           id:cancel
${FINISH_BUTTON}           id:finish
${ORDER_TOTAL}             class:summary_total_label
${CONFIRMATION_HEADER}     class:complete-header
${BACK_HOME_BUTTON}        id:back-to-products


*** Keywords ***
Click Checkout
    Click Element    ${CHECKOUT_BUTTON}

Fill Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}

Click Continue
    Click Element    ${CONTINUE_BUTTON}


Click Finish
    Click Element    ${FINISH_BUTTON}

Order Total Should Be Visible
    Element Should Be Visible    ${ORDER_TOTAL}

Order Confirmation Should Be Displayed
    Element Should Be Visible    ${CONFIRMATION_HEADER}
    Element Should Contain    ${CONFIRMATION_HEADER}    Thank you for your order!

Complete Checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Click Checkout
    Fill Checkout Information    ${first_name}    ${last_name}    ${postal_code}
    Click Continue
    Order Total Should Be Visible
    Click Finish
    Order Confirmation Should Be Displayed