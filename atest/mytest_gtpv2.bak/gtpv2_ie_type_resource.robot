*** Settings ***
Library           Rammbock
Library           ../message_tools.py

*** Variables ***
${Reserved_type}    0
${IMSI_type}      1
${Cause_type}     2
${Recovery_type}    3
${Reserved for S101 interface_type}    4 to 50
${STN-SR_type}    51
${Reserved for Sv interface_type}    52 to 70
${APN_type}       71
${Aggregate maximum bit rate_type}    72
${EPS bearer id_type}    73
${IP Address_type}    74
${MEI_type}       75
${MSISDN_type}    76
${Indication_type}    77
${PCO_type}       78
${PDN Address Allocation_type}    79
${Bearer level qos_type}    80
${Flow QoS_type}    81
${RAT Type_type}    82
${Serving Network_type}    83
${Bearer TFT_type}    84
${TAD_type}       85
${ULI_type}       86
${F-TEID_type}    87
${TMSI_type}      88
${Global CN-Id_type}    89
${S103PDF_type}    90
${S1UDF_type}     91
${Delay Value_type}    92
${Bearer Context _type}    93
${Charging ID_type}    94
${Charging Characteristics_type}    95
${Trace Information_type}    96
${Bearer Flags_type}    97
${Reserved_type}    98
${PDN Type_type}    99
${Procedure Transaction ID_type}    100
${Reserved_type}    101
${Reserved_type}    102
${GSM Key and Triplets_type}    103
${MM Context (UMTS Key, Used Cipher and Quintuplets)_type}    104
${MM Context (GSM Key, Used Cipher and Quintuplets)_type}    105
${MM Context (UMTS Key and Quintuplets)_type}    106
${MM Context (EPS Security Context, Quadruplets and Quintuplets)_type}    107
${MM Context (UMTS Key, Quadruplets and Quintuplets)_type}    108
${PDN Connection_type}    109
${PDU Numbers_type}    110
${P-TMSI_type}    111
${P-TMSI Signature_type}    112
${Hop Counter_type}    113
${UE Time Zone_type}    114
${Trace Reference_type}    115
${Complete Request Message_type}    116
${GUTI_type}      117
${F-Container_type}    118
${F-Cause_type}    119
${Selected PLMN ID_type}    120
${Target Identification_type}    121
${Reserved_type}    122
${Packet Flow ID_type}    123
${RAB Context_type}    124
${Source RNC PDCP Context Info_type}    125
${UDP Source Port Number_type}    126
${APN Restriction_type}    127
${Selection Mode_type}    128
${Source Identification_type}    129
${Reserved_type}    130
${Change Reporting Action_type}    131
${Fully Qualified PDN Connection Set Identifier (FQ-CSID)_type}    132
${Channel needed_type}    133
${eMLPP Priority_type}    134
${Node Type_type}    135
${FQDN_type}      136
${TI_type}        137
${MBMS Session Duration_type}    138
${MBMS Service Area_type}    139
${MBMS Session Identifier_type}    140
${MBMS Flow Identifier_type}    141
${MBMS IP Multicast Distribution_type}    142
${MBMS Distribution Acknowledge_type}    143
${RFSP Index_type}    144
${UCI_type}       145
${CSG Information Reporting Action_type}    146
${CSG ID_type}    147
${CMI_type}       148
${Service indicator_type}    149
${Detach Type_type}    150
${LDN_type}       151
${Node Features_type}    152
${MBMS Time to Data Transfer_type}    153
${Throttling_type}    154
${ARP_type}       155
${EPC Timer_type}    156
${Signalling Priority Indication_type}    157
${TMGI_type}      158
${Additional MM context for SRVCC_type}    159
${Additional flags for SRVCC_type}    160
${MMBR_type}      161
${MDT Configuration_type}    162
${APCO_type}      163
${Absolute Time of MBMS Data Transfer_type}    164
${H(e)NB Information Reporting _type}    165
${IP4CP_type}     166
${Spare. For future use._type}    167 to 254
${Private Extension_type}    255
