*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing

*** Variables ***
${URL}              https://www.saucedemo.com/
${BROWSER}          chrome
${DRIVER}           rf-env/WebDriverManager/chrome/86.0.4240.22/chromedriver_win32/chromedriver.exe
${DELAY}            0

*** Test Cases ***
Test Checkout
    Prepare Browser
    Login   standard_user   secret_sauce

    Add item to cart    Jacket

    Click Element    xpath=//*[@id="shopping_cart_container"]/a

    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]

    Your Information    John    Doe     55555

    Click Element   xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

    Close Browser

*** Keywords ***
Prepare Browser
    Open Browser    ${URL}  ${BROWSER}  executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Login
    [Arguments]     ${arg1}     ${arg2}
    Input Text  id=user-name    ${arg1}
    Input Text  id=password     ${arg2}
    Click Element   login-button

Add item to cart
    [Arguments]     ${item}
    Click Button    xpath=//div[@class='inventory_item' and contains(.,'${item}')]//button[contains(.,'ADD')]

Your Information
    [Arguments]     ${first}    ${last}  ${zip}
    Input Text  id=first-name   ${first}
    Input Text  id=last-name    ${last}
    Input Text  id=postal-code  ${zip}
    Click Element   xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input