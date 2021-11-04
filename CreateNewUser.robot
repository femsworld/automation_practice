*** Settings ***
Documentation    User Should be able to create account
Library          SeleniumLibrary
Resource        Training_resources.robot

*** Test Cases ***
Create New User Account
    #[Tags]    Femi
    Navigate To Homepage And Click Sign In
    Enter Email To Create User And Click Create Account Button
    Provide All Required Info to Create New User Click Register
    page should contain    ${LOGGED_IN_USER}