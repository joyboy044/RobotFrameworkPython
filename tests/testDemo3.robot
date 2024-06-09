*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Teardown    Close Browser
Test Setup    open the browser with the Mortage payment url
Resource    ../POM/Generic.robot

*** Variables ***

${Error_Message_Login}    xpath://div[@class='alert alert-danger col-md-12']

*** Test Cases ***
Validate Child window Functionality
    [Tags]    SMOKE
    Select the link of Child window
    Verify the use is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***

Select the link of Child window
    Run Keywords    Wait Until Element Is Enabled    css:.blinkingText    AND
    ...            Click Element                    css:.blinkingText
    Sleep    5
    
Verify the use is Switched to Child window
    Switch Window    NEW
    Title Should Be    RS Academy

Grab the Email id in the Child Window
    ${text} =    Get Text    //p[@class='im-para red']
    @{words} =   Split String    ${text}    at 
    ${textSplit} =     Get From List    ${words}    1
    Log    $[textSplit}
    @{words2} =   Split String    ${textSplit}
    ${email} =     Get From List    ${words2}    0
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
    Sleep    5s
