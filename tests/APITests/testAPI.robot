*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}    http://216.10.245.166
${book_id}
${book_name}    RobotFramework

*** Test Cases ***

Play around with Dictionary
    &{data}=     Create Dictionary    name=kostadin    course=robot    website=rahulshettyacademy.com
    Log    ${data}
    Dictionary Should Contain Key    ${data}    name
    Log    ${data}[name]
    ${url} =     Get From Dictionary    ${data}    website
    Log    ${url}



Add book into Library DataBase
    ${json_data} =    Create Dictionary    name=${book_name}    isbn=bcddee1222    aisle=227    author=John foe
    ${response} =     POST    ${base_url}/Library/Addbook.php    json=${json_data}    expected_status=200
    Log               ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id} =    Get From Dictionary    ${response.json()}     ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}


Get the Book details which we added
    ${get_response}=     GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    Log    ${get_response.json()}
    Should Be Equal As Strings    ${book_name}    ${get_response.json()}[0][book_name]

Delete book from database
    &{delete_req}=    Create Dictionary    ID=${book_id}
    ${delete_resp}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_req}    expected_status=200
    Log    ${delete_resp.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_resp.json()}[msg]
    
