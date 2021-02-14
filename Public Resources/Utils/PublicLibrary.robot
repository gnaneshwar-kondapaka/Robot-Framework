*** Settings ***
Documentation    Public library file consits all the reuseable keywords which are independent of application
Library          SeleniumLibrary
Resource         ../../Application/Resources/Variables.robot
Resource         ../../Application/Resources/ConfigProperties.robot
 
*** Keywords ***
     
Click WebElement
    [Documentation]    User defined keyword to check presence of the given Element and perform Click operation
    [Arguments]        ${locator}    ${wait_time}
    
    Wait Until Element Is Visible    ${locator}    timeout=${wait_time}
    Click Element                    ${locator} 
    
Send Keys
    [Documentation]    User defined keyword to Enter the provided text in the textbox by verifying the presence of given Element,
    ...                and clearing the existing text
    [Arguments]        ${locator}    ${wait_time}    ${input_value}
    
    Wait Until Element Is Visible    ${locator}    timeout=${wait_time}
    Clear Element Text               ${locator}
    Input Text                       ${locator}    ${input_value}  
    