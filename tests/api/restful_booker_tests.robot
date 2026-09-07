*** Settings ***
Resource    ../../resources/api/restful_booker_setup.resource

Suite Setup    Create Restful Booker Session


*** Test Cases ***
Create Booking Should Return Success And Booking Id
    [Tags]    TC_API_001    api    smoke
    ${response}=    Create A New Booking    John    Doe    150    ${True}    2026-01-01    2026-01-05
    Status Should Be    200    ${response}
    Should Be True    ${response.json()}[bookingid] > 0
    Should Be Equal As Strings    ${response.json()}[booking][firstname]    John

Get Booking Should Return Correct Details
    [Tags]    TC_API_002    api    regression
    ${create_response}=    Create A New Booking    Jane    Smith    200    ${False}    2026-03-01    2026-03-10
    ${booking_id}=    Set Variable    ${create_response.json()}[bookingid]
    ${get_response}=    Get Booking By Id    ${booking_id}
    Status Should Be    200    ${get_response}
    Should Be Equal As Strings    ${get_response.json()}[firstname]    Jane
    Should Be Equal As Strings    ${get_response.json()}[lastname]    Smith