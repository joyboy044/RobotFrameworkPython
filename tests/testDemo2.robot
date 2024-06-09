*** Settings ***
Documentation    To Validate the Login form
Library          SeleniumLibrary
Library          Collections
Test Setup       open the browser with the Mortage payment url
Test Teardown    Close Browser
Resource         ../POM/Generic.robot

*** Variables ***

${Error_Message_Login}    xpath://div[@class='alert alert-danger col-md-12']
${Shop_page_load}         css:.nav-link

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    SMOKE
    Fill the login Form    ${userName}    ${invalidPassword}
    wait untill Element is located in the page    ${Error_Message_Login}
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill The Login Form    ${userName}    ${validPassword}
    wait untill Element is located in the page    ${Shop_page_load}
    Verify Card titles in the Shop page
    Select the card     Nokia Edge

Select the form and davigate to Child window
    Fill the Login Details and select the User option
#    Click Button    signInBtn

*** Keywords ***
Fill the login Form
    [Arguments]         ${username}    ${password}
    Input Text          id:username    ${username}
    Input Password      id:password    ${password}
    Click Button        signInBtn


wait untill Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result} =    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList} =     Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =     Get Webelements    xpath://h4[@class='card-title']
    @{actualList} =    Create List
    FOR    ${element}     IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}
    
Select the card
    [Arguments]    ${cardName}
    ${elements} =     Get Webelements    xpath://h4[@class='card-title']
    ${index} =    Set Variable    1
    FOR    ${element}    IN    @{elements}
       Exit For Loop If    '${cardName}' == '${element.text}'
        ${index} =    Evaluate     ${index} + 1
    END
    Click Button    xpath:(//div[@class='card-footer'])[${index}]/button



Fill the Login Details and select the User option
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element    usertype
    Select From List By Value    xpath://select[@class='form-control']    teach
