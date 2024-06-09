*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Library    DataDriver    file=resources/data.csv    encoding=utf_8    dialect=unix
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login

*** Variables ***

${Error_Message_Login}    xpath://div[@class='alert alert-danger col-md-12']

*** Test Cases ***
Login with user ${username} and password ${password}    zyx    123

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortage payment url
    Fill the login Form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct


open the browser with the Mortage payment url
    Create Webdriver    Chrome    C:\Users\masen\PycharmProjects\pythonProject1\Drivers\chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    ${result} =    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.
