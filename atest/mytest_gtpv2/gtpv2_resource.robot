*** Settings ***
Library           Rammbock
Library           ../message_tools.py

*** Variables ***
${TEST MACHINE}    127.0.0.1
${SERVER}         172.1.1.60
${CLIENT}         172.1.1.60
${GTP CONTROL PORT}    2123

*** Keywords ***
define gtpv2 protocol
    new protocol    gtpv2
    u8    flags    72
    u8    messageType
    u16    messageLength
    u32    tunnelEndpointIdentifier    0
    u24    sequenceNumber
    u8    spare    0
    pdu    messageLength-8
    end protocol

Create and Send
    [Arguments]    ${name}
    run keywords    ${name}
    run keywords    ${name} values
    client sends message    header:sequenceNumber:48
    # Receive and Validate Create Session Request
    # ${msg}=    Server Receives message    header:sequenceNumber:48

Check and Send
    [Arguments]    ${name}
    run keywords    ${name}
    run keywords    ${name} values
    client sends message    header:sequenceNumber:48
    # Receive and Validate Create Session Request
    # ${msg}=    Server Receives message    header:sequenceNumber:48

Create server and client, and define protocol
    define gtpv2 protocol
    Comment    start udp server    ${SERVER}    ${GTP CONTROL PORT}    protocol=gtpv2
    start udp client    ${CLIENT}    ${GTP CONTROL PORT}    protocol=gtpv2
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

Receive and Validate Create Session Request
    Create Session Request
    Create Session Request Values
    ${msg}=    Server Receives message    header:sequenceNumber:40
