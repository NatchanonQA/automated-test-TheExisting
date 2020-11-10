*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}    chrome
${url}    https://fictionlog.co/

*** Keywords ***
Open website
    Open Browser     ${url}     ${browser}

*** Test Cases ***
Test open website
    Open website