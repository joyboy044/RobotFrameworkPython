*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***

${Error_Message_Login}    xpath://div[@class='alert alert-danger col-md-12']

*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the Mortage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct


*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome    C:\Users\masen\PycharmProjects\pythonProject1\Drivers\chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window

Fill the login Form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    learninggs
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    ${result} =    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

