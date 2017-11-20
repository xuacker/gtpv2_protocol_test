*** Settings ***
Library           Rammbock
Library           ../message_tools.py

*** Variables ***
${TEST MACHINE}    127.0.0.1
${SERVER}         127.0.0.1
${CLIENT}         127.0.0.1
${GTP CONTROL PORT}    2123

*** Keywords ***
define gtpv2 protocol
    new protocol    gtpv2
    u8    flags    72
    u8    message type
    u16    message length
    u32    tunnel endpoint identifier    0
    u24    sequence number
    u8    spare    0
    pdu    message length-8
    end protocol

Create server and client, and define protocol
    define gtpv2 protocol
    start udp server    ${SERVER}    ${GTP CONTROL PORT}    protocol=gtpv2
    start udp client    ip=${CLIENT}    protocol=gtpv2
    log    going to connect
    connect    ${SERVER}    ${GTP CONTROL PORT}

IE
    [Arguments]    ${name}
    Named IE    ${name}    ${name}

Named IE
    [Arguments]    ${field name}    ${name}
    ${type}    Find type if defined or empty    ${name}
    New struct    IE    ${field name}
    IE header    ${name}    ${type}
    IE value    ${name}
    End struct

Find type if defined or empty
    [Arguments]    ${name}
    ${type} =    Get variable value    ${${name}_type}    ${empty}
    [Return]    ${type}

IE header
    [Arguments]    ${name}    ${type}
    u8    ie type    ${type}
    u16    ie_length
    new binary container    instance
    bin    4    spare    0
    bin    4    value    0
    end binary container

IE Value
    [Arguments]    ${kw}
    new struct    Container    value    length=ie_length
    run keyword    ${kw}
    end struct

ADDRESS
    [Arguments]    ${value}
    IE    address    54    Chars    ie length    ${value}

single value tbcd container
    [Arguments]    ${name}    ${len}    ${value}
    new tbcd container    ${name}
    tbcd    ${len}    value    ${value}
    end tbcd container

IP Value
    [Arguments]    ${field}    ${value}
    ${converted}=    convert to ip    ${value}
    Value    ${field}    ${converted}

Label sequence value
    [Arguments]    ${field}    ${domain}
    ${converted}=    convert to label sequence    ${domain}
    Value    ${field}    ${converted}
