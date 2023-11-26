*** Settings ***
Documentation       Suite de testes de cadastro de dog walker

Library             Browser


*** Test Cases ***
Deve poder cadastrar um novo dog walker
    ${name}             Set Variable    Nicolas Kumabe
    ${email}            Set Variable    nicolas@gmail.com
    ${cpf}              Set Variable    000000014141
    ${cep}              Set Variable    04534011
    ${addressNumber}     Set Variable    1000
    ${addressDetails}    Set Variable    Apto 28

    New Browser    browser=chromium    headless=False
    New Page    https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Faça seu cadastro

    Fill Text    css=input[name=name]             ${name}
    Fill Text    css=input[name=email]            ${email}
    Fill Text    css=input[name=cpf]              ${cpf}
    Fill Text    css=input[name=cep]              ${cep}
    Fill Text    css=input[name=addressNumber]     ${addressNumber}
    Fill Text    css=input[name=addressDetails]    ${addressDetails}
