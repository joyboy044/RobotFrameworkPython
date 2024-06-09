*** Settings ***
Documentation    All the page objects and keywords of landing page(homepage)
Library    SeleniumLibrary

*** Variables ***

${Shop_page_load}    css:.nav-link


*** Keywords ***

Verify items in the checkoutpage and proceed
    Table Column Should Contain    xpath://table[@class='table table-hover']    1    Nokia Edge
    Table Column Should Contain    xpath://table[@class='table table-hover']    1    Blackberry
    Click Button    xpath://button[@class='btn btn-success']
    
    
