*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing

*** Variables ***
${URL}              https://www.saucedemo.com/
${BROWSER}          chrome
${DRIVER}           rf-env/WebDriverManager/chrome/86.0.4240.22/chromedriver_win32/chromedriver.exe
${DELAY}            1

*** Test Cases ***
Test Checkout
    Prepare Browser
    Login   standard_user   secret_sauce
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

    

