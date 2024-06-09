*** Settings ***
Documentation    All the page objects and keywords of landing page(homepage)
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***

${Error_Message_Login}    xpath://div[@class='alert alert-danger col-md-12']

*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn


wait untill Element is located in the page
    wait untill element passed in the page    ${Error_Message_Login}

verify error message is correct
    ${result} =    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.




Fill the Login Details and select the User option
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element    usertype
    Select From List By Value    xpath://select[@class='form-control']    teach
