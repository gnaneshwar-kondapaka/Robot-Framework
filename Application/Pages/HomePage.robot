*** Settings ***
Documentation    Robot file to store all the elements and resuable keywords for My Store home page
Resource         LoginPage.robot  
Resource         ../../Public Resources/Utils/PublicLibrary.robot
Library          SeleniumLibrary    


*** Variables ***
#Page Title
${home_page_title}    My Store

#Locators
${sign_in_loc}       jquery=.login
${logout_btn_loc}    jquery=.logout


*** Keywords ***
Navigate To My Store SignIn Page
    [Documentation]     Keyword to Navaigate to User SignIn option
    
    Title Should Be     ${homePageTitle}        
    Click WebElement    ${sign_in_loc}       ${s_wait}
    Title Should Be     ${login_page_title}
     
Launch the Browser and Go to MyStore
    [Documentation]    Keyword to launch the specified browser and navigates to MyStore URL
    [Arguments]        ${browser_name}
    
     Open Browser                  ${MY_STORE_URL}     ${browser_name}    executable_path=${CHROME_DRIVE_PATH}
     Title Should Be               ${home_page_title} 
     Maximize Browser Window
     Set Selenium Implicit Wait    ${s_wait}
     
Logout from MyStore
    [Documentation]    Keyword to logout from the MyStore application
    
    Click WebElement                 ${logout_btn_loc}    ${s_wait}
    Wait Until Element Is Visible    ${sign_in_loc}
     

 