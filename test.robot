*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}    chrome
${url}    https://fictionlog.co/
${login_btn}     xpath=//*[text()='เข้าสู่ระบบ']
${register_btn}     xpath=//*[text()='สมัครสมาชิก']
${username}     natchanon1107
${password}     123456
${email}        natchanon.ak@gmail.com
${sumit_register_btn}    xpath=//button[text()='สมัครสมาชิก']

*** Keywords ***
Open website
    Open Browser     ${url}     ${browser}
Click login button
    Wait Until Element Is Visible      ${login_btn}
    Click Element     ${login_btn}
Click register button  
    Wait Until Element Is Visible      ${register_btn}
    Click Element      ${register_btn}
Input username in register page
    Wait Until Element Is Visible      name=root_username-name
    Input Text      name=root_username-name       ${username}
Input password in register page
    Wait Until Element Is Visible      name=root_password-name
    Input Text      name=root_password-name       ${password}
Input email in register page
    Wait Until Element Is Visible      name=root_email-name
    Input Text      name=root_email-name          ${email}            
Sumit register
    Wait Until Element Is Visible    ${sumit_register_btn}
    Click Element      ${sumit_register_btn}  

*** Test Cases ***
Cannot register with existing account
    Open website
    Click login button
    Click register button
    Input username in register page
    Input password in register page
    Input email in register page
    Sumit register
    Wait Until Element Is Visible    xpath=//*[text()='ชื่อนี้มีอยู่ในระบบแล้ว กรุณาเลือกชื่อใหม่']
  
