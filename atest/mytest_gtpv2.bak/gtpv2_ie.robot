*** Settings ***
Resource          gtpv2_resource.robot
Resource          gtpv2_header_type_resource.robot
Resource          gtpv2_ie_type_resource.robot

*** Keywords ***
APN Restriction
    u8    apn_restriction    0

APN
    chars    *    access_point_name

Aggregate maximum bit rate
    u32    ambr_uplink
    u32    ambr_downlink

APCO
    new binary container    values
    bin    4    extension    8
    bin    4    protocol    0
    end binary container
    u16    id    0x000d
    u8    length    0

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

Bearer context
    IE    eps_bearer_id
    IE    F-TEID
    IE    bearer_level_qos

Charging characteristics
    u16    charging_characteristic    0x3200

Cause
    u8    cause_value

ECGI
    new struct    E-UTRAN Cell Global Identifier    ecgi
    single value tbcd container    mcc    3    ${none}
    single value tbcd container    mnc    2    ${none}
    new binary container    eci
    Bin    4    spare    0
    bin    28    ecgi
    end binary container
    end struct

EPS bearer id
    new binary container    epsbid
    bin    4    spare    0
    bin    4    value
    end binary container

F-TEID
    new binary container    values
    bin    1    v4    1
    bin    1    v6    0
    bin    6    interface type
    end binary container
    u32    teid_gre_key    0x00
    u32    f-teid_ipv4

IMSI
    new tbcd container    imsi
    tbcd    15    value
    end tbcd container

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

IP Address
    u32    ip_address

MSISDN
    new tbcd container    msisdn
    tbcd    2    country_code    86
    tbcd    *    address_digits    013312345678
    end tbcd container

PDN Type
    new Binary container    pdn_type
    bin    5    spare    0
    bin    3    value    1
    end binary container

PDN Address Allocation
    PDN Type
    u32    pdn_address_and_prefix    0

Rat type
    u8    rat_type

Recovery
    u8    recovery

Serving network
    new tbcd container    mcc
    tbcd    3    value
    end tbcd container
    new tbcd container    mnc
    tbcd    2    value
    end tbcd container

Selection mode
    new Binary container    selection_mode
    bin    6    spare    0b111111
    bin    2    value    0
    end binary container

TAI
    new struct    tai    tai
    single value tbcd container    mcc    3    ${none}
    single value tbcd container    mnc    2    ${none}
    u16    tracking_area_code
    end struct

ULI
    u8    flags
    TAI
    ECGI

UE time zone
    new binary container    timezone
    bin    6    spare    0b111111
    bin    2    value    0
    end binary container
    new binary container    dst
    bin    6    spare    0
    bin    2    value    0
    end binary container
