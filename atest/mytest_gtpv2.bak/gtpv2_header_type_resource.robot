*** Settings ***
Library           Rammbock
Library           ../message_tools.py

*** Variables ***
${Reserved}       0
${Echo Request}    1
${Echo Response}    2
${Version Not Supported Indication}    3
${Reserved for S101 interface}    4 to 24
${Reserved for Sv interface}    25 to 31
${Create Session Request}    32
${Create Session Response}    33
${Delete Session Request}    36
${Delete Session Response}    37
${Modify Bearer Request}    34
${Modify Bearer Response}    35
${Change Notification Request}    38
${Change Notification Response}    39
${For future use}    40 to 63
${Resume Notification}    164
${Resume Acknowledge}    165
${Modify Bearer Command}    64
${Modify Bearer Failure Indication}    65
${Delete Bearer Command}    66
${Delete Bearer Failure Indication}    67
${Bearer Resource Command}    68
${Bearer Resource Failure Indication}    69
${Downlink Data Notification Failure Indication}    70
${Trace Session Activation}    71
${Trace Session Deactivation}    72
${Stop Paging Indication}    73
${For future use}    74 to 94
${Create Bearer Request}    95
${Create Bearer Response}    96
${Update Bearer Request}    97
${Update Bearer Response}    98
${Delete Bearer Request}    99
${Delete Bearer Response}    100
${Delete PDN Connection Set Request}    101
${Delete PDN Connection Set Response}    102
${PGW Downlink Triggering Notification}    103
${PGW Downlink Triggering Acknowledge}    104
${For future use}    105 to 127
${Identification Request}    128
${Identification Response}    129
${Context Request}    130
${Context Response}    131
${Context Acknowledge}    132
${Forward Relocation Request}    133
${Forward Relocation Response}    134
${Forward Relocation Complete Notification}    135
${Forward Relocation Complete Acknowledge}    136
${Forward Access Context Notification}    137
${Forward Access Context Acknowledge}    138
${Relocation Cancel Request}    139
${Relocation Cancel Response}    140
${Configuration Transfer Tunnel}    141
${For future use}    142 to 148
${RAN Information Relay}    152
${Detach Notification}    149
${Detach Acknowledge}    150
${CS Paging Indication}    151
${Alert MME Notification}    153
${Alert MME Acknowledge}    154
${UE Activity Notification}    155
${UE Activity Acknowledge}    156
${For future use}    157 to 159
${Suspend Notification}    162
${Suspend Acknowledge}    163
${Create Forwarding Tunnel Request}    160
${Create Forwarding Tunnel Response}    161
${Create Indirect Data Forwarding Tunnel Request}    166
${Create Indirect Data Forwarding Tunnel Response}    167
${Delete Indirect Data Forwarding Tunnel Request}    168
${Delete Indirect Data Forwarding Tunnel Response}    169
${Release Access Bearers Request}    170
${Release Access Bearers Response}    171
${For future use}    172 to 175
${Downlink Data Notification}    176
${Downlink Data Notification Acknowledge}    177
${PGW Restart Notification}    179
${PGW Restart Notification Acknowledge}    180
${Reserved. Allocated in earlier version of the specification.}    178
${For future use}    181 to 199
${Update PDN Connection Set Request}    200
${Update PDN Connection Set Response}    201
${For future use}    202 to 210
${Modify Access Bearers Request}    211
${Modify Access Bearers Response}    212
${For future use}    213 to 230
${MBMS Session Start Request}    231
${MBMS Session Start Response}    232
${MBMS Session Update Request}    233
${MBMS Session Update Response}    234
${MBMS Session Stop Request}    235
${MBMS Session Stop Response}    236
${For future use}    237 to 239
${For future use}    248 to 255
