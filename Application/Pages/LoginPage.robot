*** Settings ***
Documentation    Robot file to store all the elements and resuable keywords for My Store Login page
Library          SeleniumLibrary 
Resource         MyStorePage.robot
Resource         ../../Public Resources/Utils/PublicLibrary.robot

*** Variables ***
#Page Title
${login_page_title}    Login - My Store

#Locators
#Login
${eMailId_loc}       jquery=#email
${password_loc}      jquery=#passwd
${submit_btn_loc}    jquery=#SubmitLogin

#Personal Info
${create_account_email_loc}    jquery=#email_create
${create_account_btn_loc}      jquery=#SubmitCreate
${first_name_loc}              jquery=#customer_firstname
${last_name_loc}               jquery=#customer_lastname
${enter_password_loc}          jquery=#passwd
${gender_group_loc}            id_gender
 
#Address
# ${enterAddressFirstName}    jquery=#firstname
# ${enterAddressLastName}     jquery=#lastname
${address_loc}              jquery=#address1
${city_loc}                 jquery=#city
${state_loc}                jquery=#id_state
${post_code_loc}            jquery=#postcode
${country_loc}              jquery=#id_country
${mobile_no_loc}            jquery=#phone_mobile
${address_alias_loc}        jquery=#alias
${register_user_btn_loc}    jquery=#submitAccount

#Gender
${gender_1}     1
${gender_2}     2

# ${userFirstName}    firstName
# ${userLastName}     lastName

*** Keywords ***
Create Account
    [Documentation]     Keyword to create account with sepecfied Email    
    [Arguments]         ${eMailId_txt}
    
    Send Keys           ${create_account_email_loc}    ${sWait}    ${eMailId_txt}
    Click WebElement    ${create_account_btn_loc}      ${sWait}
    Title Should Be     ${login_page_title}
    
Fill Personal Info
    [Documentation]    Keyword to enter personal information in create account form. 
    [Arguments]        ${choose_gender_Mr._Mrs.}    ${first_name}    ${last_name}    ${password}
    

    Title Should Be    ${login_page_title}
    Run Keyword If    '${choose_gender_Mr._Mrs.}'=='Mr.'     Select Radio Button    ${gender_group_loc}    ${gender_1}
    ...    ELSE IF    '${choose_gender_Mr._Mrs.}'=='Mrs.'    Select Radio Button    ${gender_group_loc}    ${gender_2} 
    ...    ELSE        Fail    specified gender not found.  
    Send Keys    ${first_name_loc}        ${sWait}    ${first_name}
    Send Keys    ${last_name_loc}         ${sWait}    ${last_name}
    Send Keys    ${enter_password_loc}    ${sWait}    ${password} 
    
Fill Address
    [Documentation]    Keyword to enter Address in create account form. 
    [Arguments]        ${address}    ${city}    ${state}    ${postal_code_txt}
    ...                ${country}    ${mobile_no}    ${address_alias_txt}
        
    Title Should Be              ${login_page_title}
    Send Keys                    ${address_loc}             ${sWait}    ${address}
    Send Keys                    ${city_loc}                ${sWait}    ${city}    
    Select From List By Label    ${state_loc}               ${state}
    Send Keys                    ${post_code_loc}           ${sWait}    ${postal_code_txt}
    Select From List By Label    ${country_loc}             ${country}
    Send Keys                    ${mobile_no_loc}           ${sWait}    ${mobile_no}
    Send Keys                    ${address_alias_loc}       ${sWait}    ${address_alias_txt}
    
Submit User Registration
    [Documentation]    Keyword to register the user
    
    Title Should Be     ${login_page_title}
    Click WebElement    ${register_user_btn_loc}    ${s_wait} 
    Title Should Be     ${myStoreTitle}    
 
   
Login To My Store
    [Documentation]    Keyword to login to Automation practice WebApplication
    [Arguments]        ${userName}    ${password}
     
    Title Should Be     ${login_page_title}
    Send Keys           ${eMailId_loc}       ${s_Wait}    ${userName}
    Send Keys           ${password_loc}      ${s_wait}    ${password}
    Click WebElement    ${submit_btn_loc}    ${s_Wait}
    Title Should Be     ${myStoreTitle}    

    