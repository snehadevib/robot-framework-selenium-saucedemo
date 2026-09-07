*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${INVENTORY_CONTAINER}     id:inventory_container
${SORT_DROPDOWN}           id:product_sort_container
${CART_ICON}               class:shopping_cart_link
${CART_BADGE}              class:shopping_cart_badge


*** Keywords ***
Inventory Page Should Be Displayed
    Element Should Be Visible    ${INVENTORY_CONTAINER}

Add Item To Cart
    [Arguments]    ${item_id}
    Click Element    id:add-to-cart-${item_id}

Remove Item From Cart
    [Arguments]    ${item_id}
    Click Element    id:remove-${item_id}

Cart Badge Should Show Count
    [Arguments]    ${expected_count}
    Element Text Should Be    ${CART_BADGE}    ${expected_count}

Click Cart Icon
    Click Element    ${CART_ICON}

Sort Products By
    [Arguments]    ${sort_option}
    Select From List By Label    ${SORT_DROPDOWN}    ${sort_option}