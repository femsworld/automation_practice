*** Setting ***
Documentation     Checking Login Functionalities
#Suite Setup       Navigate To Homepage And Click Sign In
#Suite Teardown    Close all Browsers
Library           SeleniumLibrary
Resource          Training_resources.robot


*** Test Cases ***
ValidLogin
    #[Tags]       Femi
    [Setup]      Navigate to Homepage And Click Sign In
    Login User     ${VALID_USEREMAIL}       ${VALID_USERPASSWORD}
    #Wait Until Element Is Visible       ${LOGIN_EMAIL_FIELD}       ${MAXIMUM_WAIT}
    #Input Text    ${LOGIN_EMAIL_FIELD}    ${VALID_USEREMAIL}
    #Input Password    ${PASSWORD_FIELD}    ${VALID_USERPASSWORD}
    #Click Element    ${LOGIN_BUTTON}
    Page Should Contain     ${LOGGED_IN_USER}
    [Teardown]    Close Browser

InvalidLogin1
    #[Tags]       Femi
    [Setup]      Navigate to Homepage And Click Sign In
    Invalid Login Credentials Should Return The Error Message       ${INVALID_USEREMAIL}    ${VALID_USERPASSWORD}   ${Error_Message}
    #Open Browser    http://automationpractice.com/index.php chrome   chrome
    #Maximize Browser Window
    #Click Element    class:login
    #Click Element    class:login
    #Click Element    class:login
    #Wait Until Element Is Visible    id:email    10s
    #Wait Until Element Is Visible    ${LOGIN_EMAIL_FIELD}    ${MAXIMUM_WAIT}
    #Input Text    id: email    lanreikuesan@gmail.com
    #Input Password    id:passwd    testing
    #Click Element    id:SubmitLogin
    Page Should Contains Not    ${LOGGED_IN_USER}
    [Teardown]    Close Browser

InvalidLogin2
    #[Tags]       Femi
    #Open Browser    http://automationpractice.com/index.php chrome?
    #Maximize Browser Window
    #Click Element    class:login
    [Setup]      Navigate to Homepage And Click Sign In
    Input Text    id: email    lanre.ikuesan@gmail.com
    Input Password    id:passwd    test
    Click Element    id:SubmitLogin
    Page Should Not Contains    ${LOGGED_IN_USER}
    [Teardown]    Close Browser

InvalidLogin3
    [Template]    Invalid Login Credentials Should Return The Error Message
    lanre.ikuesan@gmail.com    test    Invalid passowrd
    lanreikuesan@gmail.com    testing    Authentication failed
    ${EMPTY}    ${EMPTY}    An email address is required

*** Keywords ***
Invalid Loin Credentials Should Return The Error Message
    [Arguments]     ${Email}   ${Password}   ${ErrorMesage}
    Open Browser    http://automationpractice.com/index.php     chrome
    Maximize Browser Window
    Capture Page Screenshot
    Click Element    class:login
    Input Text    id: email    ${Email}
    Input Password    id:passwd    ${Password}
    Click Element    id:SubmitLogin
    Page Should Contains    ${ErrorMessage}
    [Teardown]    Close Browser


