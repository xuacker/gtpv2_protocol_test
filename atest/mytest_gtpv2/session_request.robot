*** Settings ***
Test Setup        Create server and client, and define protocol
Test Teardown     Reset Rammbock
Default Tags      regression
Resource          gtpv2_resource.robot
Resource          gtpv2_ie.robot
Resource          gtpv2_message.robot
Library           ../message_check.py

*** Test Cases ***
Create Session Request
    Create and send    create session request

Create Session Response
    Create and send    create session response

Check and Response
    [Template]
    start udp server    ${SERVER}    ${GTP CONTROL PORT}    protocol=gtpv2
    Create Session Request
    ${msg} =    Server receives message
    log    ${msg.IMSI}
    log    ${msg._header.messageType.hex}
    ${response}=    check message type    ${msg._header.messageType.hex}
    log    ${response}
    Should be equal    ${msg.IMSI.instance.value.hex}    0x00
    [Teardown]    Reset rammbock

Response
    define gtpv2 protocol
    start udp server    ${SERVER}    ${GTP CONTROL PORT}    protocol=gtpv2
    New message    ExampleForSearching    gtpv2    messageType:0xba
    ${msg}=    Server receives message    header_filter=messageType
    [Teardown]    Reset rammbock
