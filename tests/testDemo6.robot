*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup    Open Browser With Url    Firefox
Test Teardown    Close Browser
Resource    ../POM/Generic.robot
Resource    ../POM/LandingPage.robot
Resource    ../POM/ShopPage.robot
Resource    ../POM/CheckoutPage.robot
Resource    ../POM/ConfirmationPage.robot

*** Variables ***

@{listofProducts}    Blackberry    Nokia Edge
${country_name}      Macedonia

*** Test Cases ***
Validate Unsuccessful error message is correct
    [Tags]    SMOKE
    LandingPage.Fill the login Form    ${username}    ${invalid_password}
    LandingPage.wait untill Element is located in the page
    LandingPage.Verify Error Message Is Correct
    
    
Validate Cards display in the Shopping Page
    [Tags]    REGRESSION
    LandingPage.Fill The Login Form    ${userName}    ${validPassword}
    ShopPage.wait untill Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout    ${listofProducts}
    CheckoutPage.Verify items in the checkoutpage and proceed
    ConfirmationPage.select country and proceeed     ${country_name}
    ConfirmationPage.Verify successful purchase
    Sleep    2

Select the form and davigate to Child window
    LandingPage.Fill the Login Details and select the User option
    Click Button    signInBtn




