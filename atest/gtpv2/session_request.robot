*** Settings ***
Test Setup        Create server and client, and define protocol
Test Teardown     Reset Rammbock
Default Tags      regression
Resource          gtpv2_resource.robot

*** Test Cases ***
Create Session Request
    Create and send Create Session Request

*** Keywords ***
Create and send Create Session Request
    Create Session Request
    Create Session Request Values
    client sends message    header:sequence number:48

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

IMSI
    new tbcd container    imsi
    tbcd    15    value
    end tbcd container

MSISDN
    new tbcd container    msisdn
    tbcd    3    country_code    86
    tbcd    *    address_digits    013312345678
    end tbcd container

ULI
    u8    flags
    TAI
    ECGI

TAI
    new struct    tai    tai
    single value tbcd container    mcc    3    ${none}
    single value tbcd container    mnc    2    ${none}
    u16    tracking_area_code
    end struct

ECGI
    new struct    E-UTRAN Cell Global Identifier    ecgi
    single value tbcd container    mcc    3    ${none}
    single value tbcd container    mnc    2    ${none}
    new binary container    eci
    Bin    4    spare    0
    bin    28    ecgi
    end binary container
    end struct

Serving network
    new tbcd container    mcc
    tbcd    3    value
    end tbcd container
    new tbcd container    mnc
    tbcd    2    value
    end tbcd container

Rat type
    u8    rat_type

Indication
    new binary container    fields
    Bin    1    DAF    0
    Bin    1    DTF    0
    Bin    1    HI    0
    Bin    1    DFI    0
    Bin    1    OI    0
    Bin    1    ISRSI    0
    Bin    1    ISRAI    0
    Bin    1    SGWCI    0
    Bin    1    SQCI    0
    Bin    1    UIMSI    0
    Bin    1    CFSI    0
    Bin    1    CRSI    0
    Bin    1    PS    0
    Bin    1    PT    0
    Bin    1    SI    0
    Bin    1    MSV    0
    Bin    3    SPARE    0
    Bin    1    S6AF    0
    Bin    1    S4AF    0
    Bin    1    MBMDT    0
    Bin    1    ISRAU    0
    Bin    1    CCRSI    0
    end binary container

F-TEID
    new binary container    values
    bin    1    v4    1
    bin    1    v6    0
    bin    6    interface type
    end binary container
    u32    teid_gre_key    0x00
    u32    f-teid_ipv4

APN
    chars    *    access_point_name

Selection mode
    new Binary container    selection_mode
    bin    6    spare    0b111111
    bin    2    value    0
    end binary container

PDN Type
    new Binary container    pdn_type
    bin    5    spare    0
    bin    3    value    1
    end binary container

PDN Address Allocation
    PDN Type
    u32    pdn_address_and_prefix    0

APN Restriction
    u8    apn_restriction    0

Aggregate maximum bit rate
    u32    ambr_uplink
    u32    ambr_downlink

Bearer context
    IE    eps_bearer_id
    IE    F-TEID
    IE    bearer_level_qos

EPS bearer id
    new binary container    epsbid
    bin    4    spare    0
    bin    4    value
    end binary container

Bearer level qos
    new binary container    arp
    bin    1    spare    0
    bin    1    pci    0
    bin    4    pl
    bin    1    spare_2    0
    bin    1    pvi    0
    end binary container
    u8    label
    u40    mbr_uplink    0
    u40    mbr_downlink    0
    u40    gbr_uplink    0
    u40    gbr_downlink    0

Recovery
    u8    recovery

UE time zone
    new binary container    timezone
    bin    6    spare    0b111111
    bin    2    value    0
    end binary container
    new binary container    dst
    bin    6    spare    0
    bin    2    value    0
    end binary container

APCO
    new binary container    values
    bin    4    extension    8
    bin    4    protocol    0
    end binary container
    u16    id    0x000d
    u8    length    0

Charging characteristics
    u16    charging_characteristic    0x3200

IP Address
    u32    ip_address
