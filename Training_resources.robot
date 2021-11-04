*** Setting ***
Documentation     Variables and Keywords for Automation practice project
Library           SeleniumLibrary
Library           FakerLibrary


*** Variable ***
${URL}                    http://automationpractice.com/index.php
${BROWSER}                chrome
${LOG_IN_BUTTON}          class:login
${LOGIN_EMAIL_FIELD}      id:email
${VALID_USEREMAIL}
${INVALID_USEREMAIL}      lanreikuesan@gmail.com
${PASSWORD_FIELD}         id:passwd
${CREATE_EMAIL_FIELD}     name:email_create
${CREATE_ANACC_BUTT}      xpath://*[@id="SubmitCreate"]/span
${GENDER_BUTTON}          id:id_gender1
${FIRST_NAME}             name:customer_firstname
${LASTNAME}               id:customer_lastname
${PASSWORD}               name:passwd
${DOB_DAY}                id:days
${DOB_MONTH}              id:months
${DOB_YEAR}               id:years
${ADDRESS}                name:address1
${CITY}                   name:city
${STATE}                  id:id_state
${POSTCODE}               name:postcode
${NUMBER}                 name:phone_mobile
${ALIAS}                  name:alias
${REGISTER_BUTT}        xpath://span[text() = 'Register']
${VALID_USERPASSWORD}     testing
${INVALID_USERPASSWORD}   test
${Submit_Login}           id:SubmitLogin
${LOGGED_IN_USER}         Femi Paul
${MAXIMUM_WAIT}           10s
${Error_Message}          Error message displayed

*** Keywords ***

Navigate To Homepage And Click Sign In
    #Open Browser    http://automationpractice.com/index.php  headlesschrome
    Open Browser    http://automationpractice.com/index.php  chrome
    Maximize Browser Window
    wait until element is visible       ${LOG_IN_BUTTON}
    Click Element        ${LOG_IN_BUTTON}


Login User
    [Arguments]     ${username}     ${password}
    wait until element is visible       ${LOGIN_EMAIL_FIELD}
    execute javascript      window.scrollTo(0,document.body.scrollHeight)
    input text   ${LOGIN_EMAIL_FIELD}       ${username}
    input text      ${PASSWORD_FIELD}        ${password}
    #Click Element       id:SubmitLogin
    Click Element       ${Submit_Login}
    wait until page contains       ${LOGGED_IN_USER}

Enter Email To Create User And Click Create Account Button
   ${email}=    FakerLibrary.email
   log    ${email}
   Set Test Variable        ${email}
   wait until element is visible    ${CREATE_EMAIL_FIELD}
  input text     ${CREATE_EMAIL_FIELD}   ${email}
  wait until element is visible     ${CREATE_ANACC_BUTT}
  click element    ${CREATE_ANACC_BUTT}

Provide All Required Info to Create New User Click Register
   Sleep   5
   click element       ${GENDER_BUTTON}
   wait until element is visible   ${FIRSTNAME}
   input text     ${FIRSTNAME}    Femi
   input text     ${LASTNAME}    Paul
   input text     ${PASSWORD}    testing
   click element    ${DOB_DAY}
   select from list by index    ${DOB_DAY}  25
   click element    ${DOB_MONTH}
   select from list by index     ${DOB_MONTH}   12
   click element    ${DOB_YEAR}
   select from list by value     ${DOB_YEAR}   1990
   input text   ${ADDRESS}   111 testing hq
   input text   ${CITY}      Chicago
   click element   ${STATE}
   select from list by index    ${STATE}   15
   input text   ${POSTCODE}    00000
   input text   ${NUMBER}      1234567890
   input text    ${ALIAS}      Test Building
   click element    ${REGISTER_BUTT}





Invalid Login Credentials Should Return The Error Message
    [Arguements] ${Email} ${Password} ${ErrorMesage}
    #Open Browser    http://automationpractice.com/index.php chrome
    #Maximize Browser Window
    #Capture Page Screenshot
    #Click Element    class:login
    wait until element is visible       ${LOGIN_EMAIL_FIELD}
    execute javascript      window.scrollTo(0,document.body.scrollHeight)
    #input text   ${LOGIN_EMAIL_FIELD}       ${username}
    input text   ${LOGIN_EMAIL_FIELD}       lanreikuesan@gmail.com
    input text      ${PASSWORD_FIELD}        ${password}
    #Click Element       id:SubmitLogin
    Click Element       ${Submit_Login}

















