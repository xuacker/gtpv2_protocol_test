*** Settings ***
Resource          gtpv2_resource.robot
Resource          gtpv2_ie.robot

*** Keywords ***
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
    new message    create session request    gtpv2    header:messageType:${CREATE SESSION REQUEST}
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

Create Session Response Values
    ${cause_flag}    Set variable    1
    ${flag}    Set variable    1
    Run keyword If    ${flag}    ip value    F-TEID.value.f-teid_ipv4    172.1.1.60
    Run keyword If    ${flag}    value    F-TEID.value.values.interface type    7
    Run keyword If    ${flag}    ip value    Bearer context.value.F-TEID.value.f-teid_ipv4    172.1.1.60
    Run keyword If    ${flag}    value    Bearer context.value.F-TEID.value.values.interface type    7
    Run keyword If    ${flag}    value    Aggregate maximum bit rate.value.ambr_uplink    2
    Run keyword If    ${flag}    value    Aggregate maximum bit rate.value.ambr_downlink    1
    Run keyword If    ${flag}    value    Bearer context.value.eps_bearer_id.value.epsbid.value    5
    Run keyword If    ${flag}    value    Bearer context.value.bearer_level_qos.value.arp.pl    1
    Run keyword If    ${flag}    value    Bearer context.value.bearer_level_qos.value.label    9
    Run keyword If    ${flag}    value    Recovery.value.recovery    1
    Run keyword If    ${cause_flag}    value    Cause.value.cause_value    1

Create Session Response
    value    Cause.value.cause_value    1
    new message    create session Response    gtpv2    header:messageType:${CREATE SESSION Response}
    ${flag}    Set variable    1
    ${cause_flag}    Set variable    1
    Run keyword If    ${cause_flag}    IE    Cause
    Run keyword If    ${flag}    IE    F-TEID
    Run keyword If    ${flag}    IE    APN
    Run keyword If    ${flag}    IE    PDN Address Allocation
    Run keyword If    ${flag}    IE    Aggregate maximum bit rate
    Run keyword If    ${flag}    IE    APCO
    Run keyword If    ${flag}    IE    Bearer context
    Run keyword If    ${flag}    IE    Recovery
