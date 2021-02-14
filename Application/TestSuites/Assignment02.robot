*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Variables.robot
Resource    ../Pages/HomePage.robot
Resource    ../Pages/MyStorePage.robot
Resource    ../Pages/T_ShirtsPage.robot
Resource    ../Resources/TestData.robot
Resource    ../Resources/ConfigProperties.robot

Test Setup       Launch the Browser and Go to MyStore    ${BROWSER_NAME}
Test Teardown    Close Browser      


*** Test Cases ***
User Registration
    [Documentation]    Test case for verifying user registration
    [Tags]             Registration
    
    Navigate To My Store SignIn Page
    Create Account        ${user_details}[eMailId]     
    Fill Personal Info    ${user_details}[gender]         ${user_details}[first_name]    ${user_details}[last_name]    ${user_details}[password]
    Fill Address          ${user_address}[address]        ${user_address}[city]          ${user_address}[state]
    ...                   ${user_address}[postal_code]    ${user_address}[country]       ${user_address}[mobileNo]     ${user_address}[address_alias]
    Submit User Registration
    Logout from MyStore
    

User Login
    [Documentation]    Test to verify whether user is able to login with appropriate credentials
    [Tags]             Login
     
    Navigate To My Store SignIn Page
    Login To My Store    ${user_details}[eMailId]    ${user_details}[password]
    Logout from MyStore
    
Search For a Product and Add it to Cart
    [Documentation]    Test case to search for a dress and add it to cart.
    [Tags]             Add to Cart
     
    Navigate To My Store SignIn Page
    Login To My Store      ${user_details}[eMailId]    ${user_details}[password]
    Add Product To Cart    ${add_product_to_cart}[product_name]
    Logout from MyStore
    

Navigate To T-Shirts and Add a Product to Cart
    [Documentation]    Test to Navigate to T-Shirts menu and add a product to cart
    [Tags]             Add to Cart 
    
    Navigate To My Store SignIn Page
    Login To My Store     ${user_details}[eMailId]    ${user_details}[password]
    Click on T-Shirts    
    Add a T-Shirt to cart
    Logout from MyStore
    
    
    

    
