*** Settings ***
Library    RequestsLibrary


*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com


*** Keywords ***
Create Restful Booker Session
    Create Session    booker    ${BASE_URL}    verify=${True}

Create A New Booking
    [Arguments]    ${first_name}    ${last_name}    ${total_price}    ${deposit_paid}    ${checkin}    ${checkout}
    ${booking_data}=    Create Dictionary
    ...    firstname=${first_name}
    ...    lastname=${last_name}
    ...    totalprice=${total_price}
    ...    depositpaid=${deposit_paid}
    ...    bookingdates=${{ {"checkin": "${checkin}", "checkout": "${checkout}"} }}
    ...    additionalneeds=Breakfast
    ${response}=    POST On Session    booker    /booking    json=${booking_data}
    RETURN    ${response}

Get Booking By Id
    [Arguments]    ${booking_id}
    ${response}=    GET On Session    booker    /booking/${booking_id}
    RETURN    ${response}

