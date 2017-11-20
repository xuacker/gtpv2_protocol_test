*** Settings ***
Test Setup        Create server and client, and define protocol
Test Teardown     Reset Rammbock
Default Tags      regression
Resource          gtpv2_resource.robot
Resource          gtpv2_ie.robot

*** Test Cases ***
Create Session Request
    Create and send Create Session Request
    # Receive and Validate Create Session Request

*** Keywords ***
Create and send Create Session Request
    Create Session Request
    Create Session Request Values
    client sends message    header:sequence number:48
    # Receive and Validate Create Session Request
    # ${msg}=    Server Receives message    header:sequence number:48

Create and send Create Session Request
    Create Session Request
    Create Session Request Values
    client sends message    header:sequence number:48
    # Receive and Validate Create Session Request
    # ${msg}=    Server Receives message    header:sequence number:48

Create Session Request Values
    value    IMSI.instance.value    0x00
    value    IMSI.value.imsi.value    50218209999999
    value    Serving network.value.mcc.value    502
    value    Serving network.value.mnc.value    18
    value    Rat type.value.rat_type    3
    ip value    F-TEID.value.f-teid_ipv4    172.1.1.60
    value    F-TEID.value.values.interface type    7
    ip value    Bearer context.value.F-TEID.value.f-teid_ipv4    172.1.1.60
    value    Bearer context.value.F-TEID.value.values.interface type    7
    Label sequence value    APN.value.access_point_name    aaa.com.mnc018.mcc502.gprs
    value    Aggregate maximum bit rate.value.ambr_uplink    2
    value    Aggregate maximum bit rate.value.ambr_downlink    1
    value    Bearer context.value.eps_bearer_id.value.epsbid.value    5
    value    Bearer context.value.bearer_level_qos.value.arp.pl    1
    value    Bearer context.value.bearer_level_qos.value.label    9
    value    Recovery.value.recovery    1
    ip value    IP Address.value.ip_address    20.20.0.1

Create Session Request
    new message    create session request    gtpv2    header:message type:${CREATE SESSION REQUEST}
    IE    IMSI
    IE    MSISDN
    IE    Serving network
    IE    Rat type
    IE    F-TEID
    IE    APN
    IE    Selection mode
    IE    PDN Address Allocation
    IE    Aggregate maximum bit rate
    IE    APCO
    IE    Bearer context
    IE    Recovery
    IE    charging characteristics
    IE    IP Address
