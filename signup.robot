*** Settings ***
Documentation       Suite de testes de cadastro de dog walker

Library             Browser


*** Test Cases ***
Deve poder cadastrar um novo dog walker

    ${dog_walker}        Create Dictionary    
    ...    name=Nicolas Kumabe
    ...    email=nicolas@gmail.com    
    ...    cpf=00000014141    
    ...    cep=04534011    
    ...    street=Rua Joaquim Floriano    
    ...    district=Itaim Bibi    
    ...    city_uf=São Paulo/SP    
    ...    number=1000    
    ...    details=Apto 28    
    ...    cnh=toretto.jpg


    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form    
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.

*** Keywords ***
    
Go to signup page   
    New Browser    browser=chromium    headless=False
    New Page    https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${dog_walker}
    Fill Text    css=input[name=name]             ${dog_walker}[name]
    Fill Text    css=input[name=email]            ${dog_walker}[email]
    Fill Text    css=input[name=cpf]              ${dog_walker}[cpf]
    Fill Text    css=input[name=cep]              ${dog_walker}[cep]

    Click        css=input[type=button][value$=CEP]

    Get Property    css=input[name=addressStreet]      value    equal    ${dog_walker}[street]
    Get Property    css=input[name=addressDistrict]    value    equal    ${dog_walker}[district]
    Get Property    css=input[name=addressCityUf]      value    equal    ${dog_walker}[city_uf]

    Fill Text    css=input[name=addressNumber]     ${dog_walker}[number]
    Fill Text    css=input[name=addressDetails]    ${dog_walker}[details]

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/${dog_walker}[cnh]

Submit signup form
    Click    css=.button-register

Popup should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text                   css=.swal2-html-container    equal      ${expected_text}
    