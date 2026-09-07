*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ../libraries/price_utils.py


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

${ITEM_TOTAL_LABEL}        class:summary_subtotal_label


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

Verify Cart Total Matches Item Prices
    @{item_prices}=    Get WebElements    class:inventory_item_price
    @{price_texts}=    Create List
    FOR    ${element}    IN    @{item_prices}
        ${text}=    Get Text    ${element}
        Append To List    ${price_texts}    ${text}
    END
    ${subtotal_text}=    Get Text    ${ITEM_TOTAL_LABEL}
    Sum Prices Matches Total    ${price_texts}    ${subtotal_text}