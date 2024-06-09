*** Settings ***
Documentation    All the page objects and keywords of landing page(homepage)
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***

${Shop_page_load}    css:.nav-link
${country_location}    xpath://a[text()='Macedonia']

*** Keywords ***

select country and proceeed
    [Arguments]    ${country_name}
    Input Text    id:country    ${country_name}
    Sleep    3
    Wait Untill Element Passed In The Page    xpath://a[text()='${country_name}']
    Sleep    3
    Click Element    xpath://a[text()='${country_name}']
    Click Element        xpath://div[@class='checkbox checkbox-primary']
    Click Button    xpath://input[@type='submit']

Verify successful purchase
    Page Should Contain    Success!
