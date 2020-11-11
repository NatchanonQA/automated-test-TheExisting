*** Settings ***
Library    Selenium2Library
Test Teardown   Close Browser

*** Variables ***
${browser}    chrome
${url}    https://fictionlog.co/
${login_btn}     xpath=//*[text()='เข้าสู่ระบบ']
${register_btn}     xpath=//*[text()='สมัครสมาชิก']
${username}     natchanon1107
${password}     123456
${wrong_password}    123455
${email}        natchanon.ak@gmail.com
${submit_register_btn}    xpath=//button[text()='สมัครสมาชิก']
${submit_login_btn}      xpath=//button[text()='เข้าสู่ระบบ']

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
    Input Text      name=root_email-name       ${email}
Input username in login page
    Wait Until Element Is Visible      id=login-username
    Input Text      id=login-username       ${username}
Input password in login page
    Wait Until Element Is Visible      id=login-password
    Input Text      id=login-password       ${password}
Input wrong password in login page
    Wait Until Element Is Visible      id=login-password
    Input Text      id=login-password       ${wrong_password}
Submit register
    Wait Until Element Is Visible    ${submit_register_btn}
    Click Element      ${submit_register_btn}    
Submit login
    Wait Until Element Is Visible   ${submit_login_btn}     10
    Click Element      ${submit_login_btn}
Vaild login 
    Wait Until Element Is Visible    xpath=//img[@alt='profile-image']
    
*** Test Cases ***
Cannot register with existing account
    Open website
    Click login button
    Click register button
    Input username in register page
    Input password in register page
    Input email in register page
    Submit register
    Wait Until Element Is Visible    xpath=//*[text()='ชื่อนี้มีอยู่ในระบบแล้ว กรุณาเลือกชื่อใหม่']
Cannot register with empty username
    Open website
    Click login button
    Click register button
    Input password in register page
    Input email in register page
    Submit register
    Wait Until Element Is Visible    xpath=//*[text()='โปรดระบุ ชื่อผู้ใช้']
Cannot register with empty password
    Open website
    Click login button
    Click register button
    Input username in register page
    Input email in register page
    Submit register
    Wait Until Element Is Visible    xpath=//*[text()='โปรดระบุ รหัสผ่าน']
Cannot register with empty email
    Open website
    Click login button
    Click register button
    Input username in register page
    Input password in register page
    Submit register
    Wait Until Element Is Visible    xpath=//*[text()='โปรดระบุ อีเมล']
Login with correct account and password
    Open website
    Click login button
    Input username in login page
    Input password in login page
    Submit login
    Vaild login
Cannot login with wrong password
    Open website
    Click login button
    Input username in login page
    Input wrong password in login page
    Submit login
    Wait Until Element Is Visible    xpath=//*[text()='ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง']