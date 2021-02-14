*** Settings ***
Documentation    Robot file to store all the elements and resuable keywords for My Store T-Shirts page
Library          SeleniumLibrary   
Resource         ../../Public Resources/Utils/PublicLibrary.robot
Resource         MyStorePage.robot

*** Variables ***
#PageTitle
${T_shirts_page_title}    T-shirts - My Store

#Locators
${first_T_shirt_loc}    jquery=.product-image-container a
${add_to_cart_loc}      jquery=[title='Add to cart']
${added_to_cart_loc}    jquery=.icon-ok



*** Keywords ***
Add a T-Shirt to cart
    [Documentation]    Keyword to select first displayed T-Shirt and add it to cart.
    
    Title Should Be                   ${T_shirts_page_title}    
    Mouse Over                        ${first_T_shirt_loc}   
    Click WebElement                  ${add_to_cart_loc}       ${s_wait}
    Wait Until Element Is Visible     ${added_to_cart_loc}     ${s_wait}    
    Click WebElement                  ${close_pop_up_loc}      ${s_wait}