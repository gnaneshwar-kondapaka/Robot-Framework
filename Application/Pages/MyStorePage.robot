*** Settings ***
Documentation    Robot file to store all the elements and resuable keywords for Mystore page in mystore application
Library          SeleniumLibrary    
Resource         T_ShirtsPage.robot
Resource         ../../Public Resources/Utils/PublicLibrary.robot


*** Variables ***
#Page Title
${my_store_title}        My account - My Store

#Locators 
${T_shirts_loc}         jquery=a[title='T-shirts']:eq(1)
${search_bar_loc}       jquery=#search_query_top
${search_option_loc}    jquery=.btn.btn-default.button-search
${user_name_loc}        jquery=.account span
${close_pop_up_loc}     jquery=.cross


*** Keywords ***
Click on T-Shirts
    [Documentation]     Keyword to select T-Shirts tab in Automationpractice
    
    Title Should Be     ${my_store_title}    
    Click WebElement    ${T_shirts_loc}        ${s_wait}
    Title Should Be     ${T_shirts_page_title}
    
Add Product To Cart
    [Documentation]     Seraches for the specified product and adds it to the cart
    [Arguments]         ${product_name}
    
    Title Should Be     ${myStoreTitle}  
    Send Keys           ${search_bar_loc}          ${s_wait}    ${product_name}
    Click WebElement    ${search_option_loc}       ${s_wait}
    Mouse Over          ${first_T_shirt_loc}
    ${addToCart}        Find Product with Name     ${product_name} 
    Click WebElement    ${addToCart}       ${s_wait}
    Wait Until Element Is Visible          ${added_to_cart_loc}     ${s_wait}
    Click WebElement    ${close_pop_up_loc}    ${s_wait}
    
    
Find Product with Name
    [Documentation]    Keyword to find the sepcified product in the "Search - My Store" page
    [Arguments]        ${product_name}
    
    [Return]           xpath=//a[normalize-space()='${product_name}']/parent::h5/parent::div/div/a/span[text()='Add to cart']