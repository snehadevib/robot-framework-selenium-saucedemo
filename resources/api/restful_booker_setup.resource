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
    [Arguments]    ${booking_id}    ${expected_status}=200
    ${response}=    GET On Session    booker    /booking/${booking_id}    expected_status=${expected_status}
    RETURN    ${response}

Authenticate And Get Token
    ${credentials}=    Create Dictionary    username=admin    password=password123
    ${response}=    POST On Session    booker    /auth    json=${credentials}
    RETURN    ${response.json()}[token]

Update Booking
    [Arguments]    ${booking_id}    ${token}    ${first_name}    ${last_name}    ${total_price}    ${deposit_paid}    ${checkin}    ${checkout}
    ${booking_data}=    Create Dictionary
    ...    firstname=${first_name}
    ...    lastname=${last_name}
    ...    totalprice=${total_price}
    ...    depositpaid=${deposit_paid}
    ...    bookingdates=${{ {"checkin": "${checkin}", "checkout": "${checkout}"} }}
    ...    additionalneeds=Breakfast
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${response}=    PUT On Session    booker    /booking/${booking_id}    json=${booking_data}    headers=${headers}
    RETURN    ${response}    

Delete Booking
    [Arguments]    ${booking_id}    ${token}
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${response}=    DELETE On Session    booker    /booking/${booking_id}    headers=${headers}
    RETURN    ${response}

