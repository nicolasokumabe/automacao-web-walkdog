*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Library        Browser

*** Test Cases ***
Deve poder cadastrar um novo dog walker

    # Nicolas Kumabe
    # nicolas@gmail.com
    # 000000014141
    # 04534011
    # 1000
    # Apto 28

    New Browser    browser=chromium    headless=False
    New Page    https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal         Faça seu cadastro