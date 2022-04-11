*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TestCase1
    Open Browser    https://robotframework.org/    chrome
    Close Browser
