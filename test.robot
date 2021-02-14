*** Settings ***


*** Variables ***
${browser}    "chromee"

*** Test Cases ***
TestCase01
    Convert To String    "Name"
    Should Be Equal    "chrome"    "chrome"
    
TestCase02
    Convert To Boolean    False