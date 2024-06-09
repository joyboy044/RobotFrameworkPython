*** Settings ***
Documentation    All the page objects and keywords of landing page(homepage)
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***

${Shop_page_load}    css:.nav-link


*** Keywords ***

wait untill Element is located in the page
    wait untill element passed in the page    ${Shop_page_load}


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

