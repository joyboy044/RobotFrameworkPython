*** Settings ***
Documentation    A resuorce file with reusable keywords and variables
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${userName}    rahulshettyacademy
${validPassword}    learning
${invalidPassword}    123456
${url}    https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***

open the browser with the Mortage payment url
    Create Webdriver    Chrome    C:\Users\masen\PycharmProjects\pythonProject1\Drivers\chromedriver
    Go To    ${url}
    Maximize Browser Window

open browser with url
    [Arguments]    ${browser}
    Create Webdriver    ${browser}    C:\Users\masen\PycharmProjects\pythonProject1\Drivers\${browser}
    Go To    ${url}
    Maximize Browser Window

wait untill element passed in the page
    [Arguments]        ${page_locator}
    Wait Until Element Is Visible    ${page_locator}
