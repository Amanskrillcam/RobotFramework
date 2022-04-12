*** Settings ***
Documentation     Template robot main suite.
Library           Collections
Library           MyLibrary
Library           SeleniumLibrary
Resource          keywords.robot
Variables         MyVariables.py

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/  
${username}       Admin
${password}       admin123
${actualrows}     50
${actualrows2}    19
${rows} =         xpath=//table[@class='table hover']//tbody//tr
***Test Cases***
TableValidationsTest
    Open Browser	${url}	chrome
    Maximize Browser Window
    Input Text	    id=txtUsername	${username}
    Input Password	id=txtPassword	${password}
    Click Button	id=btnLogin	
    Click Element    (//a[contains(@class,'firstLevelMenu')])[3]/..
    Click Button    id=leaveList_chkSearchFilter_checkboxgroup_allcheck
    Click Button    id=btnSearch   
    Scroll Element Into View    xpath=//table[@class='table hover']/tbody
    ${elementcount1}=    Get Element Count    ${rows}
    Log to console     ${elementcount1}
    IF    ${elementcount1} == ${actualrows}
        Log To Console    Table is showing first 50 results.
    ELSE
        Log To Console    Table is not showing results Properly.
    END
    Scroll Element Into View    xpath=(//li//a[contains(text(),'Next')])[2]
    Click Element    xpath=(//li//a[contains(text(),'Next')])[2]
    Scroll Element Into View    xpath=//table[@class='table hover']/tbody
    ${elementcount2}=    Get Element Count    ${rows}
    Log To Console    ${elementcount2}
    IF    ${elementcount2} == ${actualrows2}
        Log To Console     Table is showing rest of the 19 results on 2nd page.
    ELSE
        Log To Console    Table is not showing results Properly.
    END
    Close Browser		
