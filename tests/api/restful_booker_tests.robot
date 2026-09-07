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