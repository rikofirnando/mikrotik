# jul/03/2023 12:08:15 by RouterOS 6.49.8
# software id = J2VH-W8U5
#
# model = RB750Gr3
# serial number = HCQ0862FZ8Y
/interface bridge
add ageing-time=5m arp=reply-only arp-timeout=auto auto-mac=yes comment=\
    "BRIDGE LAN" dhcp-snooping=no disabled=no fast-forward=yes forward-delay=\
    15s igmp-snooping=no max-message-age=20s mtu=auto name=bridge-lan \
    priority=0x8000 protocol-mode=rstp transmit-hold-count=6 vlan-filtering=\
    no
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    comment="ISP 1 INDIHOME (Main Connection)" disabled=no full-duplex=yes \
    l2mtu=1596 loop-protect=default loop-protect-disable-time=5m \
    loop-protect-send-interval=5s mac-address=18:FD:74:2E:07:AC mtu=1500 \
    name=ether1-isp1-indihome orig-mac-address=18:FD:74:2E:07:AC \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    comment="ISP 2 ASTINET (Backup Connection)" disabled=no full-duplex=yes \
    l2mtu=1596 loop-protect=default loop-protect-disable-time=5m \
    loop-protect-send-interval=5s mac-address=18:FD:74:2E:07:AD mtu=1500 \
    name=ether2-isp2-astinet orig-mac-address=18:FD:74:2E:07:AD \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1596 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:2E:07:AE mtu=1500 name=ether3 orig-mac-address=18:FD:74:2E:07:AE \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1596 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:2E:07:AF mtu=1500 name=ether4 orig-mac-address=18:FD:74:2E:07:AF \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1596 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:2E:07:B0 mtu=1500 name=ether5 orig-mac-address=18:FD:74:2E:07:B0 \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
/queue interface
set bridge-lan queue=no-queue
/interface ethernet switch
set 0 !cpu-flow-control mirror-source=none mirror-target=none name=switch1
/interface ethernet switch port
set 0 default-vlan-id=1 vlan-mode=fallback
set 1 default-vlan-id=1 vlan-mode=fallback
set 2 default-vlan-id=1 vlan-mode=fallback
set 3 default-vlan-id=1 vlan-mode=fallback
set 4 default-vlan-id=1 vlan-mode=fallback
set 5 default-vlan-id=1 vlan-mode=fallback
/interface list
set [ find name=all ] comment="contains all interfaces" exclude="" include="" \
    name=all
set [ find name=none ] comment="contains no interfaces" exclude="" include="" \
    name=none
set [ find name=dynamic ] comment="contains dynamic interfaces" exclude="" \
    include="" name=dynamic
set [ find name=static ] comment="contains static interfaces" exclude="" \
    include="" name=static
/interface lte apn
set [ find default=yes ] add-default-route=yes apn=internet \
    default-route-distance=2 name=default use-peer-dns=yes
/interface wireless security-profiles
set [ find default=yes ] authentication-types="" disable-pmkid=no \
    eap-methods=passthrough group-ciphers=aes-ccm group-key-update=5m \
    interim-update=0s management-protection=disabled \
    management-protection-key="" mode=none mschapv2-password="" \
    mschapv2-username="" name=default radius-called-format=mac:ssid \
    radius-eap-accounting=no radius-mac-accounting=no \
    radius-mac-authentication=no radius-mac-caching=disabled \
    radius-mac-format=XX:XX:XX:XX:XX:XX radius-mac-mode=as-username \
    static-algo-0=none static-algo-1=none static-algo-2=none static-algo-3=\
    none static-key-0="" static-key-1="" static-key-2="" static-key-3="" \
    static-sta-private-algo=none static-sta-private-key="" \
    static-transmit-key=key-0 supplicant-identity=MikroTik tls-certificate=\
    none tls-mode=no-certificates unicast-ciphers=aes-ccm wpa-pre-shared-key=\
    "" wpa2-pre-shared-key=""
/ip dhcp-client option
set clientid_duid code=61 name=clientid_duid value="0xff\$(CLIENT_DUID)"
set clientid code=61 name=clientid value="0x01\$(CLIENT_MAC)"
set hostname code=12 name=hostname value="\$(HOSTNAME)"
/ip firewall layer7-protocol
add name=Speedtest regexp="^.+(speedtest-+[a-z0-9.]+[a-z]+.net.id|nflxvideo.ne\
    t|ooklaserver.net|speedtestcustom.com|speedtest.net|fast.com|speedtest.+[a\
    -z]+.id|.speedtest.|openspeedtest.com).*\$"
add name="VPN MRA Telkomsel" regexp=\
    "^.+(mra\\.telkomsel\\.co\\.id|telkomsel\\.co\\.id).*\$"
add name="NUN CORP" regexp="^.+(lowongan-pekerjaan\\.nuncorp\\.id\\absen\\.nun\
    corp\\.id|nuncorp\\.id).*\$"
/ip hotspot profile
set [ find default=yes ] dns-name="" hotspot-address=0.0.0.0 html-directory=\
    flash/hotspot html-directory-override="" http-cookie-lifetime=3d \
    http-proxy=0.0.0.0:0 login-by=cookie,http-chap name=default rate-limit="" \
    smtp-server=0.0.0.0 split-user-domain=no use-radius=no
/ip hotspot user profile
set [ find default=yes ] add-mac-cookie=yes address-list="" idle-timeout=none \
    !insert-queue-before keepalive-timeout=2m mac-cookie-timeout=3d name=\
    default !parent-queue !queue-type shared-users=1 status-autorefresh=1m \
    transparent-proxy=no
/ip ipsec mode-config
set [ find default=yes ] name=request-only responder=no use-responder-dns=\
    exclusively
/ip ipsec policy group
set [ find default=yes ] name=default
/ip ipsec profile
set [ find default=yes ] dh-group=modp2048,modp1024 dpd-interval=2m \
    dpd-maximum-failures=5 enc-algorithm=aes-128,3des hash-algorithm=sha1 \
    lifetime=1d name=default nat-traversal=yes proposal-check=obey
/ip ipsec proposal
set [ find default=yes ] auth-algorithms=sha1 disabled=no enc-algorithms=\
    aes-256-cbc,aes-192-cbc,aes-128-cbc lifetime=30m name=default pfs-group=\
    modp1024
/ip pool
add name=dhcp_pool0 ranges=192.168.10.11-192.168.10.254
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 authoritative=yes disabled=no \
    interface=bridge-lan lease-script="" lease-time=15m name=dhcp1 \
    use-radius=no
/ppp profile
set *0 address-list="" !bridge !bridge-horizon bridge-learning=default \
    !bridge-path-cost !bridge-port-priority change-tcp-mss=yes !dns-server \
    !idle-timeout !incoming-filter !insert-queue-before !interface-list \
    !local-address name=default on-down="" on-up="" only-one=default \
    !outgoing-filter !parent-queue !queue-type !rate-limit !remote-address \
    !session-timeout use-compression=default use-encryption=default use-mpls=\
    default use-upnp=default !wins-server
set *FFFFFFFE address-list="" !bridge !bridge-horizon bridge-learning=default \
    !bridge-path-cost !bridge-port-priority change-tcp-mss=yes !dns-server \
    !idle-timeout !incoming-filter !insert-queue-before !interface-list \
    !local-address name=default-encryption on-down="" on-up="" only-one=\
    default !outgoing-filter !parent-queue !queue-type !rate-limit \
    !remote-address !session-timeout use-compression=default use-encryption=\
    yes use-mpls=default use-upnp=default !wins-server
/queue type
set 0 kind=pfifo name=default pfifo-limit=50
set 1 kind=pfifo name=ethernet-default pfifo-limit=50
set 2 kind=sfq name=wireless-default sfq-allot=1514 sfq-perturb=5
set 3 kind=red name=synchronous-default red-avg-packet=1000 red-burst=20 \
    red-limit=60 red-max-threshold=50 red-min-threshold=10
set 4 kind=sfq name=hotspot-default sfq-allot=1514 sfq-perturb=5
set 5 kind=pcq name=pcq-upload-default pcq-burst-rate=0 pcq-burst-threshold=0 \
    pcq-burst-time=10s pcq-classifier=src-address pcq-dst-address-mask=32 \
    pcq-dst-address6-mask=128 pcq-limit=50KiB pcq-rate=0 \
    pcq-src-address-mask=32 pcq-src-address6-mask=128 pcq-total-limit=2000KiB
set 6 kind=pcq name=pcq-download-default pcq-burst-rate=0 \
    pcq-burst-threshold=0 pcq-burst-time=10s pcq-classifier=dst-address \
    pcq-dst-address-mask=32 pcq-dst-address6-mask=128 pcq-limit=50KiB \
    pcq-rate=0 pcq-src-address-mask=32 pcq-src-address6-mask=128 \
    pcq-total-limit=2000KiB
set 7 kind=none name=only-hardware-queue
set 8 kind=mq-pfifo mq-pfifo-limit=50 name=multi-queue-ethernet-default
set 9 kind=pfifo name=default-small pfifo-limit=10
/queue interface
set ether1-isp1-indihome queue=only-hardware-queue
set ether2-isp2-astinet queue=only-hardware-queue
set ether3 queue=only-hardware-queue
set ether4 queue=only-hardware-queue
set ether5 queue=only-hardware-queue
/queue simple
add bucket-size=0.1/0.1 burst-limit=0/0 burst-threshold=0/0 burst-time=0s/0s \
    disabled=no limit-at=0/0 max-limit=400/400 name=TOTAL_SPEED packet-marks=\
    "" parent=none priority=8/8 queue=default/default target=192.168.10.0/24 \
    !time
add bucket-size=0.1/0.1 burst-limit=40M/40M burst-threshold=8704k/8704k \
    burst-time=16s/16s comment=\
    "Social Media (Facebook, Instagram, Twitter, TikTok, YouTube)" disabled=\
    no limit-at=20M/20M max-limit=30M/30M name="0. Social Media" \
    packet-marks=Social-Media-Packet parent=TOTAL_SPEED priority=2/2 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.0/24 !time
add bucket-size=0.1/0.1 burst-limit=60M/60M burst-threshold=9638k/9638k \
    burst-time=16s/16s comment="High Priority Connection (Microsoft Teams, Goo\
    gle Meet, Remote Desktop Visa, WhatsApp & Telegram)" disabled=no \
    limit-at=30M/30M max-limit=50M/50M name="1. High Priority" packet-marks=\
    High-Priority-Packet parent=TOTAL_SPEED priority=1/1 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.0/24 !time
add bucket-size=0.1/0.1 burst-limit=60M/60M burst-threshold=9638k/9638k \
    burst-time=16s/16s comment="High Priority Connection (Zoom)" disabled=no \
    limit-at=30M/30M max-limit=50M/50M name=Zoom packet-marks=Zoom-Packet \
    parent=TOTAL_SPEED priority=1/1 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.0/24 !time
add bucket-size=0.1/0.1 burst-limit=40M/40M burst-threshold=8704k/8704k \
    burst-time=16s/16s comment="Games Online (Mobile Legend, Free Fire, PUBG M\
    obile, Call of Duty Mobile, Arena of Valor, Stumble Guys, Genshin Impact, \
    Clash of Clans, Clash Royale, League of Legends Mobile, DOTA2, Fifa Online\
    , Point Blank Mobile, LINE Let's Get Rich, Dream League Soccer, & Among Us\
    )" disabled=no limit-at=20M/20M max-limit=30M/30M name="2. Games Online" \
    packet-marks=Games-Online-Packet parent=TOTAL_SPEED priority=2/2 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.0/24 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s comment="XIAOMI REDMI 11 PRO 5G TESTING ONLY" disabled=no \
    limit-at=50M/50M max-limit=60M/60M name=Testing-QoS-1 packet-marks="" \
    parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.4/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s comment="A21S TESTING ONLY" disabled=no limit-at=50M/50M \
    max-limit=60M/60M name="Testing QoS-2" packet-marks="" parent=TOTAL_SPEED \
    priority=8/8 queue=pcq-upload-default/pcq-download-default target=\
    192.168.10.5/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s comment="LENOVO IDEPAD 7I TESTING ONLY" disabled=yes limit-at=\
    50M/50M max-limit=60M/60M name=Testing-QoS-3 packet-marks="" parent=\
    TOTAL_SPEED priority=8/8 queue=pcq-upload-default/pcq-download-default \
    target=192.168.10.3/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-20 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.20/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-21 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.21/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-22 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.22/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-23 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.23/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-24 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.24/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-25 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.25/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-26 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.26/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-27 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.27/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-28 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.28/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-29 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.29/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-30 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.30/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-31 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.31/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-32 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.32/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-33 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.33/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-34 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.34/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-35 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.35/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-36 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.36/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-37 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.37/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-38 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.38/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-39 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.39/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-40 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.40/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-41 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.41/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-42 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.42/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-43 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.43/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-44 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.44/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-45 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.45/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-46 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.46/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-47 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.47/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-48 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.48/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-49 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.49/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-50 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.50/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-51 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.51/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-52 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.52/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-53 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.53/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-54 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.54/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-55 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.55/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-56 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.56/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-57 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.57/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-58 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.58/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-59 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.59/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-60 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.60/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-61 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.61/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-62 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.62/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-63 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.63/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-64 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.64/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-65 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.65/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-66 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.66/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-67 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.67/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-68 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.68/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-69 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.69/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-70 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.70/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-71 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.71/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-72 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.72/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-73 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.73/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-74 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.74/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-75 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.75/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-76 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.76/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-77 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.77/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-78 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.78/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-79 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.79/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-80 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.80/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-81 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.81/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-82 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.82/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-83 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.83/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-84 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.84/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-85 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.85/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-86 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.86/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-87 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.87/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-88 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.88/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-89 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.89/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-90 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.90/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-91 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.91/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-92 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.92/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-93 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.93/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-94 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.94/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-95 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.95/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-96 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.96/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-97 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.97/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-98 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.98/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=NUN-Client-99 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.99/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-100 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.100/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-101 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.101/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-102 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.102/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-103 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.103/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-104 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.104/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-105 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.105/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-106 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.106/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-107 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.107/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-108 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.108/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-109 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.109/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-110 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.110/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-111 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.111/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-112 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.112/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-113 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.113/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-114 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.114/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-115 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.115/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-116 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.116/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-117 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.117/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-118 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.118/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-119 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.119/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-120 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.120/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-121 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.121/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-122 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.122/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-123 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.123/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-124 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.124/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-125 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.125/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-126 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.126/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-127 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.127/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-128 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.128/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-129 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.129/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-130 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.130/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-131 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.131/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-132 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.132/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-133 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.133/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-134 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.134/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-135 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.135/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-136 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.136/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-137 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.137/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-138 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.138/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-139 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.139/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-140 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.140/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-141 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.141/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-142 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.142/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-143 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.143/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-144 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.144/32 !time
add bucket-size=0.1/0.1 burst-limit=0/0 burst-threshold=0/0 burst-time=\
    16s/16s disabled=no limit-at=0/0 max-limit=0/0 name=NUN-Client-145 \
    packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.145/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-146 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.146/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-147 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.147/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-148 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.148/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-149 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.149/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-150 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.150/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-151 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.151/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-152 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.152/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-153 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.153/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-154 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.154/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-155 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.155/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-156 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.156/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-157 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.157/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-158 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.158/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-159 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.159/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-160 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.160/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-161 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.161/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-162 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.162/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-163 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.163/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-164 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.164/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-165 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.165/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-166 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.166/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-167 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.167/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-168 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.168/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-169 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.169/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-170 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.170/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-171 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.171/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-172 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.172/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-173 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.173/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-174 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.174/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-175 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.175/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-176 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.176/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-177 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.177/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-178 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.178/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-179 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.179/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-180 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.180/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-181 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.181/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-182 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.182/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-183 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.183/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-184 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.184/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-185 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.185/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-186 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.186/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-187 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.187/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-188 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.188/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-189 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.189/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-190 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.190/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-191 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.191/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-192 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.192/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-193 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.193/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-194 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.194/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-195 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.195/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-196 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.196/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-197 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.197/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-198 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.198/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-199 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.199/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-200 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.200/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-201 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.201/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-202 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.202/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-203 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.203/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-204 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.204/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-205 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.205/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-206 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.206/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-207 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.207/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-208 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.208/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-209 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.209/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-210 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.210/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-211 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.211/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-212 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.212/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-213 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.213/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-214 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.214/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-215 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.215/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-216 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.216/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-217 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.217/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-218 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.218/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-219 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.219/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-220 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.220/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-221 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.221/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-222 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.222/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-223 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.223/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-224 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.224/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-225 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.225/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-226 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.226/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-227 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.227/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-228 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.228/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-229 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.229/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-230 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.230/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-231 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.231/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-232 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.232/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-233 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.233/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-234 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.234/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-235 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.235/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-236 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.236/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-237 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.237/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-238 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.238/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-239 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.239/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-240 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.240/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-241 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.241/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-242 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.242/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-243 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.243/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-244 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.244/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-245 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.245/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-246 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.246/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-247 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.247/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-248 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.248/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-249 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.249/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-250 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.250/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-251 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.251/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-252 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.252/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-253 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.253/32 !time
add bucket-size=0.1/0.1 burst-limit=70M/70M burst-threshold=3M/3M burst-time=\
    16s/16s disabled=no limit-at=50M/50M max-limit=60M/60M name=\
    NUN-Client-254 packet-marks="" parent=TOTAL_SPEED priority=8/8 queue=\
    pcq-upload-default/pcq-download-default target=192.168.10.254/32 !time
/routing bgp instance
set default as=65530 client-to-client-reflection=yes !cluster-id \
    !confederation disabled=no ignore-as-path-len=no name=default out-filter=\
    "" redistribute-connected=no redistribute-ospf=no redistribute-other-bgp=\
    no redistribute-rip=no redistribute-static=no router-id=0.0.0.0 \
    routing-table=""
/routing ospf instance
set [ find default=yes ] disabled=no distribute-default=never !domain-id \
    !domain-tag in-filter=ospf-in metric-bgp=auto metric-connected=20 \
    metric-default=1 metric-other-ospf=auto metric-rip=20 metric-static=20 \
    !mpls-te-area !mpls-te-router-id name=default out-filter=ospf-out \
    redistribute-bgp=no redistribute-connected=no redistribute-other-ospf=no \
    redistribute-rip=no redistribute-static=no router-id=0.0.0.0 \
    !routing-table !use-dn
/routing ospf area
set [ find default=yes ] area-id=0.0.0.0 disabled=no instance=default name=\
    backbone type=default
/snmp community
set [ find default=yes ] addresses=::/0 authentication-password="" \
    authentication-protocol=MD5 disabled=no encryption-password="" \
    encryption-protocol=DES name=public read-access=yes security=none \
    write-access=no
/system logging action
set 0 memory-lines=1000 memory-stop-on-full=no name=memory target=memory
set 1 disk-file-count=2 disk-file-name=flash/log disk-lines-per-file=1000 \
    disk-stop-on-full=no name=disk target=disk
set 2 name=echo remember=yes target=echo
set 3 bsd-syslog=no name=remote remote=0.0.0.0 remote-port=514 src-address=\
    0.0.0.0 syslog-facility=daemon syslog-severity=auto syslog-time-format=\
    bsd-syslog target=remote
/user group
set read name=read policy="local,telnet,ssh,reboot,read,test,winbox,password,w\
    eb,sniff,sensitive,api,romon,tikapp,!ftp,!write,!policy,!dude" skin=\
    default
set write name=write policy="local,telnet,ssh,reboot,read,write,test,winbox,pa\
    ssword,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude" skin=\
    default
set full name=full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,\
    winbox,password,web,sniff,sensitive,api,romon,tikapp,!dude" skin=default
add name=selected policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,w\
    inbox,web,sniff,sensitive,tikapp,!password,!api,!romon,!dude" skin=\
    default
/caps-man aaa
set called-format=mac:ssid interim-update=disabled mac-caching=disabled \
    mac-format=XX:XX:XX:XX:XX:XX mac-mode=as-username
/caps-man manager
set ca-certificate=none certificate=none enabled=no package-path="" \
    require-peer-certificate=no upgrade-policy=none
/caps-man manager interface
set [ find default=yes ] disabled=no forbid=no interface=all
/certificate settings
set crl-download=no crl-store=ram crl-use=no
/interface bridge port
add auto-isolate=no bpdu-guard=no bridge=bridge-lan broadcast-flood=yes \
    disabled=no edge=auto fast-leave=no frame-types=admit-all horizon=none \
    hw=yes ingress-filtering=no interface=ether3 internal-path-cost=10 learn=\
    auto multicast-router=temporary-query path-cost=10 point-to-point=auto \
    priority=0x80 pvid=1 restricted-role=no restricted-tcn=no tag-stacking=no \
    trusted=no unknown-multicast-flood=yes unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge-lan broadcast-flood=yes \
    disabled=no edge=auto fast-leave=no frame-types=admit-all horizon=none \
    hw=yes ingress-filtering=no interface=ether4 internal-path-cost=10 learn=\
    auto multicast-router=temporary-query path-cost=10 point-to-point=auto \
    priority=0x80 pvid=1 restricted-role=no restricted-tcn=no tag-stacking=no \
    trusted=no unknown-multicast-flood=yes unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge-lan broadcast-flood=yes \
    disabled=no edge=auto fast-leave=no frame-types=admit-all horizon=none \
    hw=yes ingress-filtering=no interface=ether5 internal-path-cost=10 learn=\
    auto multicast-router=temporary-query path-cost=10 point-to-point=auto \
    priority=0x80 pvid=1 restricted-role=no restricted-tcn=no tag-stacking=no \
    trusted=no unknown-multicast-flood=yes unknown-unicast-flood=yes
/interface bridge port-controller
# disabled
set bridge=none cascade-ports="" switch=none
/interface bridge port-extender
# disabled
set control-ports="" excluded-ports="" switch=none
/interface bridge settings
set allow-fast-path=yes use-ip-firewall=no use-ip-firewall-for-pppoe=no \
    use-ip-firewall-for-vlan=no
/ip firewall connection tracking
set enabled=auto generic-timeout=10m icmp-timeout=10s loose-tcp-tracking=yes \
    tcp-close-timeout=10s tcp-close-wait-timeout=10s tcp-established-timeout=\
    1d tcp-fin-wait-timeout=10s tcp-last-ack-timeout=10s \
    tcp-max-retrans-timeout=5m tcp-syn-received-timeout=5s \
    tcp-syn-sent-timeout=5s tcp-time-wait-timeout=10s tcp-unacked-timeout=5m \
    udp-stream-timeout=3m udp-timeout=10s
/ip neighbor discovery-settings
set discover-interface-list=static lldp-med-net-policy-vlan=disabled \
    protocol=cdp,lldp,mndp
/ip settings
set accept-redirects=no accept-source-route=no allow-fast-path=yes \
    arp-timeout=30s icmp-rate-limit=10 icmp-rate-mask=0x1818 ip-forward=yes \
    max-neighbor-entries=8192 route-cache=yes rp-filter=no secure-redirects=\
    yes send-redirects=yes tcp-syncookies=no
/interface detect-internet
set detect-interface-list=none internet-interface-list=none \
    lan-interface-list=none wan-interface-list=none
/interface l2tp-server server
set allow-fast-path=no authentication=pap,chap,mschap1,mschap2 \
    caller-id-type=ip-address default-profile=default-encryption enabled=no \
    ipsec-secret="" keepalive-timeout=30 max-mru=1450 max-mtu=1450 \
    max-sessions=unlimited mrru=disabled one-session-per-host=no use-ipsec=no
/interface ovpn-server server
set auth=sha1,md5 cipher=blowfish128,aes128 default-profile=default enabled=\
    no keepalive-timeout=60 mac-address=FE:65:36:7B:63:55 max-mtu=1500 mode=\
    ip netmask=24 port=1194 require-client-certificate=no
/interface pptp-server server
set authentication=mschap1,mschap2 default-profile=default-encryption \
    enabled=no keepalive-timeout=30 max-mru=1450 max-mtu=1450 mrru=disabled
/interface sstp-server server
set authentication=pap,chap,mschap1,mschap2 certificate=none default-profile=\
    default enabled=no force-aes=no keepalive-timeout=60 max-mru=1500 \
    max-mtu=1500 mrru=disabled pfs=no port=443 tls-version=any \
    verify-client-certificate=no
/interface wireless align
set active-mode=yes audio-max=-20 audio-min=-100 audio-monitor=\
    00:00:00:00:00:00 filter-mac=00:00:00:00:00:00 frame-size=300 \
    frames-per-second=25 receive-all=no ssid-all=no
/interface wireless cap
set bridge=none caps-man-addresses="" caps-man-certificate-common-names="" \
    caps-man-names="" certificate=none discovery-interfaces="" enabled=no \
    interfaces="" lock-to-caps-man=no static-virtual=no
/interface wireless sniffer
set channel-time=200ms file-limit=10 file-name="" memory-limit=10 \
    multiple-channels=no only-headers=no receive-errors=no streaming-enabled=\
    no streaming-max-rate=0 streaming-server=0.0.0.0
/interface wireless snooper
set channel-time=200ms multiple-channels=yes receive-errors=no
/ip accounting
set account-local-traffic=no enabled=no threshold=256
/ip accounting web-access
set accessible-via-web=no address=0.0.0.0/0
/ip address
add address=192.168.1.2/24 comment="ISP 1 INDIHOME" disabled=no interface=\
    ether1-isp1-indihome network=192.168.1.0
add address=192.168.10.1/24 comment=BRIDGE-LAN disabled=no interface=\
    bridge-lan network=192.168.10.0
add address=36.64.20.151/30 comment="ISP 2 ASTINET" disabled=no interface=\
    ether2-isp2-astinet network=36.64.20.148
/ip cloud
set ddns-enabled=no ddns-update-interval=none update-time=yes
/ip cloud advanced
set use-local-address=no
/ip dhcp-client
add add-default-route=yes default-route-distance=1 dhcp-options=\
    hostname,clientid disabled=yes interface=ether1-isp1-indihome \
    use-peer-dns=yes use-peer-ntp=yes
add add-default-route=yes default-route-distance=1 dhcp-options=\
    hostname,clientid disabled=yes interface=ether2-isp2-astinet \
    use-peer-dns=yes use-peer-ntp=yes
/ip dhcp-server config
set accounting=yes interim-update=0s store-leases-disk=5m
/ip dhcp-server lease
add address=192.168.10.2 address-lists="" client-id=1:0:e0:4c:36:be:a3 \
    comment="RIKO FIRNANDO LAN" dhcp-option="" disabled=no \
    !insert-queue-before mac-address=00:E0:4C:36:BE:A3 server=dhcp1 \
    use-src-mac=yes
add address=192.168.10.254 address-lists="" client-id=1:ac:15:a2:a1:f3:16 \
    dhcp-option="" disabled=no !insert-queue-before mac-address=\
    AC:15:A2:A1:F3:16 server=dhcp1
add address=192.168.10.3 address-lists="" client-id=1:f8:b5:4d:5e:59:7a \
    comment="RIKO FIRNANDO WLAN" dhcp-option="" disabled=no \
    !insert-queue-before mac-address=F8:B5:4D:5E:59:7A server=dhcp1 \
    use-src-mac=yes
add address=192.168.10.4 address-lists="" client-id=1:74:f2:fa:f7:5e:85 \
    comment="RIKO FIRNANDO XIAOMI REDMI 11 PRO 5G" dhcp-option="" disabled=no \
    !insert-queue-before mac-address=74:F2:FA:F7:5E:85 server=dhcp1 \
    use-src-mac=yes
add address=192.168.10.5 address-lists="" client-id=1:68:bf:c4:d7:31:1a \
    comment="RIKO FIRNANDO SAMSUNG A21S" dhcp-option="" disabled=no \
    !insert-queue-before mac-address=68:BF:C4:D7:31:1A server=dhcp1 \
    use-src-mac=yes
add address=192.168.10.6 address-lists="" client-id=1:9c:a2:f4:ff:a3:41 \
    comment=NUN_LOBBY dhcp-option="" disabled=no !insert-queue-before \
    mac-address=9C:A2:F4:FF:A3:41 server=dhcp1 use-src-mac=yes
add address=192.168.10.249 address-lists="" client-id=1:cc:15:31:a3:6f:6f \
    comment="Laptop Accounting" dhcp-option="" disabled=no \
    !insert-queue-before mac-address=CC:15:31:A3:6F:6F server=dhcp1 \
    use-src-mac=yes
add address=192.168.10.237 address-lists="" client-id=1:a0:c9:a0:8d:97:27 \
    comment=Aufa dhcp-option="" disabled=no !insert-queue-before mac-address=\
    A0:C9:A0:8D:97:27 server=dhcp1 use-src-mac=yes
add address=192.168.10.216 address-lists="" client-id=1:dc:21:48:77:c8:92 \
    comment=Setyadi dhcp-option="" disabled=no !insert-queue-before \
    mac-address=DC:21:48:77:C8:92 server=dhcp1 use-src-mac=yes
add address=192.168.10.235 address-lists="" client-id=1:5c:d0:6e:2c:5c:c5 \
    comment=Salwa dhcp-option="" disabled=no !insert-queue-before \
    mac-address=5C:D0:6E:2C:5C:C5 server=dhcp1 use-src-mac=yes
add address=192.168.10.213 address-lists="" client-id=1:b0:be:83:7f:bd:8a \
    comment=Azils dhcp-option="" disabled=no !insert-queue-before \
    mac-address=B0:BE:83:7F:BD:8A server=dhcp1 use-src-mac=yes
add address=192.168.10.232 address-lists="" client-id=1:a4:77:f3:3:3c:a4 \
    comment="MAC MINI M1" dhcp-option="" disabled=no !insert-queue-before \
    mac-address=A4:77:F3:03:3C:A4 server=dhcp1 use-src-mac=yes
add address=192.168.10.210 address-lists="" client-id=1:d2:df:b4:31:93:22 \
    comment=Rifanda dhcp-option="" disabled=no !insert-queue-before \
    mac-address=D2:DF:B4:31:93:22 server=dhcp1 use-src-mac=yes
add address=192.168.10.185 address-lists="" client-id=1:86:7:34:5:c0:21 \
    comment=Anggi dhcp-option="" disabled=no !insert-queue-before \
    mac-address=86:07:34:05:C0:21 server=dhcp1 use-src-mac=yes
add address=192.168.10.202 address-lists="" client-id=1:9c:3e:53:80:23:1a \
    comment=Indrarose dhcp-option="" disabled=no !insert-queue-before \
    mac-address=9C:3E:53:80:23:1A server=dhcp1 use-src-mac=yes
add address=192.168.10.250 address-lists="" client-id=1:50:c2:e8:c5:4d:83 \
    comment=WILASARI dhcp-option="" disabled=no !insert-queue-before \
    mac-address=50:C2:E8:C5:4D:83 server=dhcp1 use-src-mac=yes
add address=192.168.10.163 address-lists="" client-id=1:a8:8f:d9:42:e:ef \
    comment=TETRA dhcp-option="" disabled=no !insert-queue-before \
    mac-address=A8:8F:D9:42:0E:EF server=dhcp1
add address=192.168.10.7 address-lists="" client-id=1:5c:62:5a:19:65:20 \
    comment="Canon Printer G3010" dhcp-option="" disabled=no \
    !insert-queue-before mac-address=5C:62:5A:19:65:20 server=dhcp1 \
    use-src-mac=yes
/ip dhcp-server network
add address=192.168.10.0/24 caps-manager="" dhcp-option="" dns-server="" \
    gateway=192.168.10.1 ntp-server="" wins-server=""
/ip dns
set allow-remote-requests=yes cache-max-ttl=1w cache-size=2048KiB \
    max-concurrent-queries=100 max-concurrent-tcp-sessions=20 \
    max-udp-packet-size=4096 query-server-timeout=2s query-total-timeout=10s \
    servers=8.8.8.8,8.8.4.4,192.168.1.1,192.168.10.1,36.64.20.150 \
    use-doh-server="" verify-doh-cert=no
/ip firewall address-list
add address=192.168.10.0/24 disabled=no list=IP-Local-Client
add address=13.107.64.0/18 disabled=no list="Microsoft Teams"
add address=52.112.0.0/14 disabled=no list="Microsoft Teams"
add address=52.120.0.0/14 disabled=no list="Microsoft Teams"
add address=52.238.119.141 disabled=no list="Microsoft Teams"
add address=52.244.160.207 disabled=no list="Microsoft Teams"
add address=91.108.4.0/22 disabled=no list=Telegram
add address=91.108.8.0/22 disabled=no list=Telegram
add address=91.108.56.0/22 disabled=no list=Telegram
add address=95.161.64.0/20 disabled=no list=Telegram
add address=149.154.160.0/22 disabled=no list=Telegram
add address=149.154.164.0/22 disabled=no list=Telegram
add address=74.125.250.0/24 disabled=no list="Google Meet"
add address=142.250.82.0/24 disabled=no list="Google Meet"
add address=74.125.247.129 disabled=no list="Google Meet"
add address=34.64.20.148/30 disabled=no list=ISP+CLIENT
add address=192.168.1.0/24 disabled=no list=ISP+CLIENT
add address=192.168.10.0/24 disabled=no list=ISP+CLIENT
add address=36.86.63.182 disabled=no list="Remote Desktop Visa"
add address=13.76.195.19 disabled=no list="Remote Desktop Visa"
add address=20.212.192.4 disabled=no list="Remote Desktop Visa"
add address=3.7.35.0/25 disabled=no list=Zoom
add address=3.21.137.128/25 disabled=no list=Zoom
add address=3.22.11.0/24 disabled=no list=Zoom
add address=3.23.93.0/24 disabled=no list=Zoom
add address=3.25.41.128/25 disabled=no list=Zoom
add address=3.25.42.0/25 disabled=no list=Zoom
add address=3.25.49.0/24 disabled=no list=Zoom
add address=3.80.20.128/25 disabled=no list=Zoom
add address=3.96.19.0/24 disabled=no list=Zoom
add address=3.101.32.128/25 disabled=no list=Zoom
add address=3.101.52.0/25 disabled=no list=Zoom
add address=3.104.34.128/25 disabled=no list=Zoom
add address=3.120.121.0/25 disabled=no list=Zoom
add address=3.127.194.128/25 disabled=no list=Zoom
add address=3.208.72.0/25 disabled=no list=Zoom
add address=3.211.241.0/25 disabled=no list=Zoom
add address=3.235.69.0/25 disabled=no list=Zoom
add address=3.235.71.128/25 disabled=no list=Zoom
add address=3.235.72.128/25 disabled=no list=Zoom
add address=3.235.73.0/25 disabled=no list=Zoom
add address=3.235.82.0/23 disabled=no list=Zoom
add address=3.235.96.0/23 disabled=no list=Zoom
add address=4.34.125.128/25 disabled=no list=Zoom
add address=4.35.64.128/25 disabled=no list=Zoom
add address=8.5.128.0/24 disabled=no list=Zoom
add address=8.5.128.0/23 disabled=no list=Zoom
add address=13.52.6.128/25 disabled=no list=Zoom
add address=13.52.146.0/25 disabled=no list=Zoom
add address=18.157.88.0/24 disabled=no list=Zoom
add address=18.205.93.128/25 disabled=no list=Zoom
add address=20.203.158.80/28 disabled=no list=Zoom
add address=20.203.190.192/26 disabled=no list=Zoom
add address=50.239.202.0/23 disabled=no list=Zoom
add address=50.239.204.0/24 disabled=no list=Zoom
add address=52.61.100.128/25 disabled=no list=Zoom
add address=52.202.62.192/26 disabled=no list=Zoom
add address=52.215.168.0/25 disabled=no list=Zoom
add address=64.125.62.0/24 disabled=no list=Zoom
add address=64.211.144.0/24 disabled=no list=Zoom
add address=64.224.32.0/19 disabled=no list=Zoom
add address=65.39.152.0/24 disabled=no list=Zoom
add address=69.174.57.0/24 disabled=no list=Zoom
add address=69.174.108.0/22 disabled=no list=Zoom
add address=99.79.20.0/25 disabled=no list=Zoom
add address=101.36.167.0/24 disabled=no list=Zoom
add address=101.36.170.0/23 disabled=no list=Zoom
add address=103.122.166.0/23 disabled=no list=Zoom
add address=111.33.115.0/25 disabled=no list=Zoom
add address=111.33.181.0/25 disabled=no list=Zoom
add address=115.110.154.192/26 disabled=no list=Zoom
add address=115.114.56.192/26 disabled=no list=Zoom
add address=115.114.115.0/26 disabled=no list=Zoom
add address=115.114.131.0/26 disabled=no list=Zoom
add address=120.29.148.0/24 disabled=no list=Zoom
add address=129.151.1.128/27 disabled=no list=Zoom
add address=129.151.1.192/27 disabled=no list=Zoom
add address=129.151.2.0/27 disabled=no list=Zoom
add address=129.151.3.160/27 disabled=no list=Zoom
add address=129.151.7.96/27 disabled=no list=Zoom
add address=129.151.11.64/27 disabled=no list=Zoom
add address=129.151.11.128/27 disabled=no list=Zoom
add address=129.151.12.0/27 disabled=no list=Zoom
add address=129.151.13.64/27 disabled=no list=Zoom
add address=129.151.15.224/27 disabled=no list=Zoom
add address=129.151.16.0/27 disabled=no list=Zoom
add address=129.151.31.224/27 disabled=no list=Zoom
add address=129.151.40.0/25 disabled=no list=Zoom
add address=129.151.40.160/27 disabled=no list=Zoom
add address=129.151.40.192/27 disabled=no list=Zoom
add address=129.151.41.0/25 disabled=no list=Zoom
add address=129.151.41.192/26 disabled=no list=Zoom
add address=129.151.42.0/27 disabled=no list=Zoom
add address=129.151.42.64/27 disabled=no list=Zoom
add address=129.151.42.128/26 disabled=no list=Zoom
add address=129.151.42.224/27 disabled=no list=Zoom
add address=129.151.43.0/27 disabled=no list=Zoom
add address=129.151.43.64/26 disabled=no list=Zoom
add address=129.151.48.0/27 disabled=no list=Zoom
add address=129.151.48.160/27 disabled=no list=Zoom
add address=129.151.49.0/26 disabled=no list=Zoom
add address=129.151.49.96/27 disabled=no list=Zoom
add address=129.151.49.128/27 disabled=no list=Zoom
add address=129.151.49.192/26 disabled=no list=Zoom
add address=129.151.50.0/27 disabled=no list=Zoom
add address=129.151.50.64/27 disabled=no list=Zoom
add address=129.151.52.128/26 disabled=no list=Zoom
add address=129.151.53.32/27 disabled=no list=Zoom
add address=129.151.53.224/27 disabled=no list=Zoom
add address=129.151.55.32/27 disabled=no list=Zoom
add address=129.151.56.32/27 disabled=no list=Zoom
add address=129.151.57.32/27 disabled=no list=Zoom
add address=129.151.60.192/27 disabled=no list=Zoom
add address=129.159.2.32/27 disabled=no list=Zoom
add address=129.159.2.192/27 disabled=no list=Zoom
add address=129.159.3.0/24 disabled=no list=Zoom
add address=129.159.4.0/23 disabled=no list=Zoom
add address=129.159.6.0/27 disabled=no list=Zoom
add address=129.159.6.96/27 disabled=no list=Zoom
add address=129.159.6.128/26 disabled=no list=Zoom
add address=129.159.6.192/27 disabled=no list=Zoom
add address=129.159.160.0/26 disabled=no list=Zoom
add address=129.159.160.64/27 disabled=no list=Zoom
add address=129.159.163.0/26 disabled=no list=Zoom
add address=129.159.163.160/27 disabled=no list=Zoom
add address=129.159.208.0/21 disabled=no list=Zoom
add address=129.159.216.0/26 disabled=no list=Zoom
add address=129.159.216.64/27 disabled=no list=Zoom
add address=129.159.216.128/26 disabled=no list=Zoom
add address=130.61.164.0/22 disabled=no list=Zoom
add address=132.226.176.0/25 disabled=no list=Zoom
add address=132.226.176.128/26 disabled=no list=Zoom
add address=132.226.177.96/27 disabled=no list=Zoom
add address=132.226.177.128/25 disabled=no list=Zoom
add address=132.226.178.0/27 disabled=no list=Zoom
add address=132.226.178.128/27 disabled=no list=Zoom
add address=132.226.178.224/27 disabled=no list=Zoom
add address=132.226.179.0/27 disabled=no list=Zoom
add address=132.226.179.64/27 disabled=no list=Zoom
add address=132.226.180.128/27 disabled=no list=Zoom
add address=132.226.183.160/27 disabled=no list=Zoom
add address=132.226.185.192/27 disabled=no list=Zoom
add address=134.224.0.0/16 disabled=no list=Zoom
add address=140.238.128.0/24 disabled=no list=Zoom
add address=140.238.232.0/22 disabled=no list=Zoom
add address=144.195.0.0/16 disabled=no list=Zoom
add address=147.124.96.0/19 disabled=no list=Zoom
add address=149.137.0.0/17 disabled=no list=Zoom
add address=150.230.224.0/25 disabled=no list=Zoom
add address=150.230.224.128/26 disabled=no list=Zoom
add address=150.230.224.224/27 disabled=no list=Zoom
add address=152.67.20.0/24 disabled=no list=Zoom
add address=152.67.118.0/24 disabled=no list=Zoom
add address=152.67.168.0/22 disabled=no list=Zoom
add address=152.67.180.0/24 disabled=no list=Zoom
add address=152.67.184.32/27 disabled=no list=Zoom
add address=152.67.240.0/21 disabled=no list=Zoom
add address=152.70.0.0/25 disabled=no list=Zoom
add address=152.70.0.128/26 disabled=no list=Zoom
add address=152.70.0.224/27 disabled=no list=Zoom
add address=152.70.1.0/25 disabled=no list=Zoom
add address=152.70.1.128/26 disabled=no list=Zoom
add address=152.70.1.192/27 disabled=no list=Zoom
add address=152.70.2.0/26 disabled=no list=Zoom
add address=152.70.7.192/27 disabled=no list=Zoom
add address=152.70.10.32/27 disabled=no list=Zoom
add address=152.70.224.32/27 disabled=no list=Zoom
add address=152.70.224.64/26 disabled=no list=Zoom
add address=152.70.224.160/27 disabled=no list=Zoom
add address=152.70.224.192/27 disabled=no list=Zoom
add address=152.70.225.0/25 disabled=no list=Zoom
add address=152.70.225.160/27 disabled=no list=Zoom
add address=152.70.225.192/27 disabled=no list=Zoom
add address=152.70.226.0/27 disabled=no list=Zoom
add address=152.70.227.96/27 disabled=no list=Zoom
add address=152.70.227.192/27 disabled=no list=Zoom
add address=152.70.228.0/27 disabled=no list=Zoom
add address=152.70.228.64/27 disabled=no list=Zoom
add address=152.70.228.128/27 disabled=no list=Zoom
add address=156.45.0.0/17 disabled=no list=Zoom
add address=158.101.64.0/24 disabled=no list=Zoom
add address=158.101.184.0/23 disabled=no list=Zoom
add address=158.101.186.0/25 disabled=no list=Zoom
add address=158.101.186.128/27 disabled=no list=Zoom
add address=158.101.186.192/26 disabled=no list=Zoom
add address=158.101.187.0/25 disabled=no list=Zoom
add address=158.101.187.160/27 disabled=no list=Zoom
add address=158.101.187.192/26 disabled=no list=Zoom
add address=160.1.56.128/25 disabled=no list=Zoom
add address=161.199.136.0/22 disabled=no list=Zoom
add address=162.12.232.0/22 disabled=no list=Zoom
add address=162.255.36.0/22 disabled=no list=Zoom
add address=165.254.88.0/23 disabled=no list=Zoom
add address=166.108.64.0/18 disabled=no list=Zoom
add address=168.138.16.0/22 disabled=no list=Zoom
add address=168.138.48.0/24 disabled=no list=Zoom
add address=168.138.56.0/21 disabled=no list=Zoom
add address=168.138.72.0/24 disabled=no list=Zoom
add address=168.138.74.0/25 disabled=no list=Zoom
add address=168.138.80.0/25 disabled=no list=Zoom
add address=168.138.80.128/26 disabled=no list=Zoom
add address=168.138.80.224/27 disabled=no list=Zoom
add address=168.138.81.0/24 disabled=no list=Zoom
add address=168.138.82.0/23 disabled=no list=Zoom
add address=168.138.84.0/25 disabled=no list=Zoom
add address=168.138.84.128/27 disabled=no list=Zoom
add address=168.138.84.192/26 disabled=no list=Zoom
add address=168.138.85.0/24 disabled=no list=Zoom
add address=168.138.86.0/23 disabled=no list=Zoom
add address=168.138.96.0/22 disabled=no list=Zoom
add address=168.138.116.0/27 disabled=no list=Zoom
add address=168.138.116.64/27 disabled=no list=Zoom
add address=168.138.116.128/27 disabled=no list=Zoom
add address=168.138.116.224/27 disabled=no list=Zoom
add address=168.138.117.0/27 disabled=no list=Zoom
add address=168.138.117.96/27 disabled=no list=Zoom
add address=168.138.117.128/27 disabled=no list=Zoom
add address=168.138.118.0/27 disabled=no list=Zoom
add address=168.138.118.160/27 disabled=no list=Zoom
add address=168.138.118.224/27 disabled=no list=Zoom
add address=168.138.119.0/27 disabled=no list=Zoom
add address=168.138.119.128/27 disabled=no list=Zoom
add address=168.138.244.0/24 disabled=no list=Zoom
add address=170.114.0.0/16 disabled=no list=Zoom
add address=173.231.80.0/20 disabled=no list=Zoom
add address=173.231.92.0/24 disabled=no list=Zoom
add address=173.231.94.0/24 disabled=no list=Zoom
add address=192.204.12.0/22 disabled=no list=Zoom
add address=193.122.16.0/25 disabled=no list=Zoom
add address=193.122.16.192/27 disabled=no list=Zoom
add address=193.122.17.0/26 disabled=no list=Zoom
add address=193.122.17.64/27 disabled=no list=Zoom
add address=193.122.17.224/27 disabled=no list=Zoom
add address=193.122.18.32/27 disabled=no list=Zoom
add address=193.122.18.64/26 disabled=no list=Zoom
add address=193.122.18.160/27 disabled=no list=Zoom
add address=193.122.18.192/27 disabled=no list=Zoom
add address=193.122.19.0/27 disabled=no list=Zoom
add address=193.122.19.160/27 disabled=no list=Zoom
add address=193.122.19.192/27 disabled=no list=Zoom
add address=193.122.20.224/27 disabled=no list=Zoom
add address=193.122.21.96/27 disabled=no list=Zoom
add address=193.122.32.0/21 disabled=no list=Zoom
add address=193.122.40.0/22 disabled=no list=Zoom
add address=193.122.44.0/24 disabled=no list=Zoom
add address=193.122.45.32/27 disabled=no list=Zoom
add address=193.122.45.64/26 disabled=no list=Zoom
add address=193.122.45.128/25 disabled=no list=Zoom
add address=193.122.46.0/23 disabled=no list=Zoom
add address=193.122.208.96/27 disabled=no list=Zoom
add address=193.122.216.32/27 disabled=no list=Zoom
add address=193.122.222.0/27 disabled=no list=Zoom
add address=193.122.223.128/27 disabled=no list=Zoom
add address=193.122.226.160/27 disabled=no list=Zoom
add address=193.122.231.192/27 disabled=no list=Zoom
add address=193.122.232.160/27 disabled=no list=Zoom
add address=193.122.237.64/27 disabled=no list=Zoom
add address=193.122.244.160/27 disabled=no list=Zoom
add address=193.122.244.224/27 disabled=no list=Zoom
add address=193.122.245.0/27 disabled=no list=Zoom
add address=193.122.247.96/27 disabled=no list=Zoom
add address=193.122.252.192/27 disabled=no list=Zoom
add address=193.123.0.0/19 disabled=no list=Zoom
add address=193.123.40.0/21 disabled=no list=Zoom
add address=193.123.128.0/19 disabled=no list=Zoom
add address=193.123.168.0/21 disabled=no list=Zoom
add address=193.123.192.224/27 disabled=no list=Zoom
add address=193.123.193.0/27 disabled=no list=Zoom
add address=193.123.193.96/27 disabled=no list=Zoom
add address=193.123.194.96/27 disabled=no list=Zoom
add address=193.123.194.128/27 disabled=no list=Zoom
add address=193.123.194.224/27 disabled=no list=Zoom
add address=193.123.195.0/27 disabled=no list=Zoom
add address=193.123.196.0/27 disabled=no list=Zoom
add address=193.123.196.192/27 disabled=no list=Zoom
add address=193.123.197.0/27 disabled=no list=Zoom
add address=193.123.197.64/27 disabled=no list=Zoom
add address=193.123.198.64/27 disabled=no list=Zoom
add address=193.123.198.160/27 disabled=no list=Zoom
add address=193.123.199.64/27 disabled=no list=Zoom
add address=193.123.200.128/27 disabled=no list=Zoom
add address=193.123.201.32/27 disabled=no list=Zoom
add address=193.123.201.224/27 disabled=no list=Zoom
add address=193.123.202.64/27 disabled=no list=Zoom
add address=193.123.202.128/26 disabled=no list=Zoom
add address=193.123.203.0/27 disabled=no list=Zoom
add address=193.123.203.160/27 disabled=no list=Zoom
add address=193.123.203.192/27 disabled=no list=Zoom
add address=193.123.204.0/27 disabled=no list=Zoom
add address=193.123.204.64/27 disabled=no list=Zoom
add address=193.123.205.64/26 disabled=no list=Zoom
add address=193.123.205.128/27 disabled=no list=Zoom
add address=193.123.206.32/27 disabled=no list=Zoom
add address=193.123.206.128/27 disabled=no list=Zoom
add address=193.123.207.32/27 disabled=no list=Zoom
add address=193.123.208.160/27 disabled=no list=Zoom
add address=193.123.209.0/27 disabled=no list=Zoom
add address=193.123.209.96/27 disabled=no list=Zoom
add address=193.123.210.64/27 disabled=no list=Zoom
add address=193.123.211.224/27 disabled=no list=Zoom
add address=193.123.212.128/27 disabled=no list=Zoom
add address=193.123.215.192/26 disabled=no list=Zoom
add address=193.123.216.64/27 disabled=no list=Zoom
add address=193.123.216.128/27 disabled=no list=Zoom
add address=193.123.217.160/27 disabled=no list=Zoom
add address=193.123.219.64/27 disabled=no list=Zoom
add address=193.123.220.224/27 disabled=no list=Zoom
add address=193.123.222.64/27 disabled=no list=Zoom
add address=193.123.222.224/27 disabled=no list=Zoom
add address=198.251.128.0/17 disabled=no list=Zoom
add address=202.177.207.128/27 disabled=no list=Zoom
add address=204.80.104.0/21 disabled=no list=Zoom
add address=204.141.28.0/22 disabled=no list=Zoom
add address=206.247.0.0/16 disabled=no list=Zoom
add address=207.226.132.0/24 disabled=no list=Zoom
add address=209.9.211.0/24 disabled=no list=Zoom
add address=209.9.215.0/24 disabled=no list=Zoom
add address=213.19.144.0/24 disabled=no list=Zoom
add address=213.19.153.0/24 disabled=no list=Zoom
add address=213.244.140.0/24 disabled=no list=Zoom
add address=221.122.63.0/24 disabled=no list=Zoom
add address=221.122.64.0/24 disabled=no list=Zoom
add address=221.122.88.64/27 disabled=no list=Zoom
add address=221.122.88.128/25 disabled=no list=Zoom
add address=221.122.89.128/25 disabled=no list=Zoom
add address=221.123.139.192/27 disabled=no list=Zoom
add address=202.3.210.209 disabled=no list="VPN MRA Telkomsel"
add address=202.3.210.0/24 disabled=no list="VPN MRA Telkomsel"
add address=202.3.210.223 disabled=no list="Remote Desktop Visa"
add address=103.247.9.132 disabled=no list="Nun Corp"
/ip firewall filter
# inactive time
add action=drop chain=forward comment=\
    "Block Games Online in Office Hours (09:00-12:00)" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    src-address-list=Games-Online !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss time=9h-12h,mon,tue,wed,thu !tls-host !ttl
# inactive time
add action=drop chain=forward comment=\
    "Block Games Online in Office Hours (13:00-17:00)" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    src-address-list=Games-Online !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss time=13h-17h,mon,tue,wed,thu !tls-host !ttl
# inactive time
add action=drop chain=forward comment=\
    "Block Games Online in Office Hours (Friday 09:00-11:30)" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=Games-Online \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss time=\
    9h-11h30m,fri !tls-host !ttl
# inactive time
add action=drop chain=forward comment=\
    "Block Games Online in Office Hours (Friday 13:30-16:00)" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=Games-Online \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss time=\
    13h30m-16h,fri !tls-host !ttl
add action=accept chain=forward comment="DL BRIDGE-LAN" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list out-interface=bridge-lan \
    !out-interface-list !packet-mark !packet-size !per-connection-classifier \
    !port !priority !protocol !psd !random !routing-mark !routing-table \
    !src-address !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=accept chain=forward comment="UL BRIDGE-LAN" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    in-interface=bridge-lan !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    !nth !out-bridge-port !out-bridge-port-list !out-interface \
    !out-interface-list !packet-mark !packet-size !per-connection-classifier \
    !port !priority !protocol !psd !random !routing-mark !routing-table \
    !src-address !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=accept chain=forward comment="General Ports on Internet " \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=yes !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit dst-port=\
    21,22,23,53,80,81,88,182,443,843,853,5050,5353 !fragment !hotspot \
    !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority protocol=tcp !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=drop chain=forward comment="Block Social Media Action: drop" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=yes !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=\
    Social-Media-Lists !src-address-type !src-mac-address !src-port \
    !tcp-flags !tcp-mss !time !tls-host !ttl
add action=reject chain=forward comment="Block Social Media Action: reject" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=yes !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    reject-with=icmp-network-unreachable !routing-mark !routing-table \
    !src-address src-address-list=Social-Media-Lists !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=drop chain=output comment="Block Social Media Chain: output" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=yes !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=\
    Social-Media-Lists !src-address-type !src-mac-address !src-port \
    !tcp-flags !tcp-mss !time !tls-host !ttl
add action=reject chain=output comment="Block Social Media Chain: output" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=yes !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    reject-with=icmp-network-unreachable !routing-mark !routing-table \
    !src-address src-address-list=Social-Media-Lists !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=jump chain=input comment="To prevent external attacks from entering\
    \_the router six times in a row, please wait for one minute before attempt\
    ing to reconnect once the limit is reached." !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    connection-state=new !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit dst-port=\
    2022,8081 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options jump-target=brute_force !layer7-protocol \
    !limit log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=drop chain=brute_force comment=\
    "Wait for one minute untill can reconnect" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    connection-state=new !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit dst-port=\
    2022,8081 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    !nth !out-bridge-port !out-bridge-port-list !out-interface \
    !out-interface-list !packet-mark !packet-size !per-connection-classifier \
    !port !priority protocol=tcp !psd !random !routing-mark !routing-table \
    !src-address src-address-list=ssh_web_blacklist !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-src-to-address-list address-list=ssh_web_blacklist \
    address-list-timeout=1m chain=brute_force !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    connection-state=new !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit dst-port=\
    2022,8081 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    !nth !out-bridge-port !out-bridge-port-list !out-interface \
    !out-interface-list !packet-mark !packet-size !per-connection-classifier \
    !port !priority protocol=tcp !psd !random !routing-mark !routing-table \
    !src-address !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=accept chain=ssh_brute_force connection-state=new dst-port=2022 \
    protocol=tcp
/ip firewall mangle
add action=accept chain=prerouting comment="ALL ISP Connections are Accept" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address dst-address-list=ISP+CLIENT \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-connection chain=input comment="ISP 1 CONNECTION (INDIHOME)" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list in-interface=ether1-isp1-indihome \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" new-connection-mark=\
    ISP1-Connection !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    yes !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-connection chain=input comment="ISP 2 CONNECTION (ASTINET)" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list in-interface=ether2-isp2-astinet \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" new-connection-mark=\
    ISP2-Connection !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    yes !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-routing chain=output !connection-bytes !connection-limit \
    connection-mark=ISP1-Connection !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-routing-mark=Route-ISP1 !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    no !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-routing chain=output !connection-bytes !connection-limit \
    connection-mark=ISP2-Connection !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-routing-mark=Route-ISP2 !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    no !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-connection chain=prerouting !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address dst-address-list=!ISP+CLIENT dst-address-type=!local \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-connection-mark=ISP1-Connection !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size passthrough=yes per-connection-classifier=\
    both-addresses-and-ports:2/0 !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=ISP+CLIENT \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-connection chain=prerouting !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address dst-address-list=!ISP+CLIENT dst-address-type=!local \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-connection-mark=ISP2-Connection !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size passthrough=yes per-connection-classifier=\
    both-addresses-and-ports:2/1 !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=ISP+CLIENT \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-routing chain=prerouting !connection-bytes !connection-limit \
    connection-mark=ISP1-Connection !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address dst-address-list=!ISP+CLIENT !dst-address-type !dst-limit \
    !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-routing-mark=Route-ISP1 !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    yes !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=ISP+CLIENT \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-routing chain=prerouting !connection-bytes !connection-limit \
    connection-mark=ISP2-Connection !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address dst-address-list=!ISP+CLIENT !dst-address-type !dst-limit \
    !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-routing-mark=Route-ISP2 !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    yes !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=ISP+CLIENT \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=accept chain=prerouting comment="LAN Connection" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address dst-address-list=IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    !nth !out-bridge-port !out-bridge-port-list !out-interface \
    !out-interface-list !packet-mark !packet-size !per-connection-classifier \
    !port !priority !protocol !psd !random !routing-mark !routing-table \
    !src-address !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=accept chain=output !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    dst-address-list=IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=mark-connection chain=prerouting comment=\
    "Social Media (Facebook, Instagram, Twitter, TikTok, YouTube)" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address dst-address-list=\
    Social-Media-Lists !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" new-connection-mark=\
    Social-Media-Connection !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    yes !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=mark-packet chain=forward !connection-bytes !connection-limit \
    connection-mark=Social-Media-Connection !connection-nat-state \
    !connection-rate !connection-state !connection-type !content disabled=no \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-packet-mark=Social-Media-Packet !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size passthrough=no !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=mark-connection chain=prerouting comment="High Priority (Microsoft \
    Teams, Remote Desktop Visa, Google Meet, WhatsApp & Telegram)" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address dst-address-list=High-Priority \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" new-connection-mark=High-Priority-Connection !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size passthrough=yes !per-connection-classifier \
    !port !priority !protocol !psd !random !routing-mark !routing-table \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=mark-packet chain=forward !connection-bytes !connection-limit \
    connection-mark=High-Priority-Connection !connection-nat-state \
    !connection-rate !connection-state !connection-type !content disabled=no \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-packet-mark=High-Priority-Packet !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size passthrough=no !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=mark-connection chain=prerouting comment="Games Online (Mobile Lege\
    nd, Free Fire, PUBG Mobile, Call of Duty Mobile, Arena of Valor, Stumble G\
    uys, Genshin Impact, Clash of Clans, Clash Royale, League of Legends Mobil\
    e, DOTA2, Fifa Online, Point Blank Mobile, LINE Let's Get Rich, Dream Leag\
    ue Soccer, & Among Us)" !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    dst-address-list=Games-Online !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-connection-mark=Games-Online-Connection !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size passthrough=yes !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    src-address-list=IP-Local-Client !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=mark-packet chain=forward !connection-bytes !connection-limit \
    connection-mark=Games-Online-Connection !connection-nat-state \
    !connection-rate !connection-state !connection-type !content disabled=no \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-packet-mark=Games-Online-Packet !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size passthrough=no !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Zoom address-list-timeout=6h \
    chain=prerouting comment=Zoom !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    dst-address-list=!Zoom !dst-address-type !dst-limit dst-port=\
    3478,3479,5090,5091,8801-8810 !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=add-dst-to-address-list address-list=Zoom address-list-timeout=6h \
    chain=prerouting dst-address-list=!Zoom dst-port=\
    3478,3479,5090,5091,8801-8810 protocol=udp
add action=mark-connection chain=prerouting dst-port=\
    3478,3479,5090,5091,8801-8810 new-connection-mark=Zoom-Connection \
    passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    3478,3479,5090,5091,8801-8810 new-connection-mark=Zoom-Connection \
    passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-address-list=Zoom-List \
    dst-port=80,443 new-connection-mark=Zoom-Connection passthrough=yes \
    protocol=tcp
add action=mark-packet chain=forward connection-mark=Zoom-Connection \
    new-packet-mark=Zoom-Packet passthrough=no
add action=add-dst-to-address-list address-list="VPN MRA Telkomsel" \
    address-list-timeout=4h10m chain=prerouting comment="VPN MRA " \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address dst-address-list=!ISP+CLIENT \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options layer7-protocol=\
    "VPN MRA Telkomsel" !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table !src-address src-address-list=\
    ISP+CLIENT !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=mark-routing chain=prerouting !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    dst-address-list="VPN MRA Telkomsel" !dst-address-type !dst-limit \
    !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-routing-mark=Through-ISP1 !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    no !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=ISP+CLIENT \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=add-dst-to-address-list address-list="Nun Corp" \
    address-list-timeout=8h30m chain=prerouting comment="NUN CORP" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address dst-address-list=!ISP+CLIENT \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options layer7-protocol="NUN CORP" \
    !limit log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=ISP+CLIENT \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=mark-routing chain=prerouting !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    dst-address-list="Nun Corp" !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    new-routing-mark=Through-ISP2 !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size passthrough=\
    no !per-connection-classifier !port !priority !protocol !psd !random \
    !routing-mark !routing-table !src-address src-address-list=ISP+CLIENT \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
/ip firewall nat
add action=masquerade chain=srcnat comment="INDIHOME (MAIN CONNECTION)" \
    !connection-bytes !connection-limit !connection-mark !connection-rate \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list out-interface=ether1-isp1-indihome \
    !out-interface-list !packet-mark !packet-size !per-connection-classifier \
    !port !priority !protocol !psd !random !routing-mark !routing-table \
    !src-address !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-mss !time !tls-host !to-addresses !to-ports !ttl
add action=masquerade chain=srcnat comment="ASTINET BACKUP" !connection-bytes \
    !connection-limit !connection-mark !connection-rate !connection-type \
    !content disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    out-interface=ether2-isp2-astinet !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-mss !time !tls-host \
    !to-addresses !to-ports !ttl
add action=dst-nat chain=dstnat comment="Port Forward TL-WR940N" \
    !connection-bytes !connection-limit !connection-mark !connection-rate \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit dst-port=1025 !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority protocol=tcp !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-mss !time !tls-host \
    to-addresses=192.168.10.254 to-ports=80 !ttl
add action=dst-nat chain=dstnat comment="Port Forward TL-ArcerC54" \
    !connection-bytes !connection-limit !connection-mark !connection-rate \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit dst-port=1026 !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority protocol=tcp !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-mss !time !tls-host \
    to-addresses=192.168.10.6 to-ports=80 !ttl
/ip firewall raw
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting comment=Facebook content=\
    .facebook.com disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.facebook.net disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.fbcdn.net disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.fbsbx.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=fb.com disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=fb.gg disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=fbwat.ch disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=messenger.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=m.me disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting comment=Instagram content=\
    .instagram.com disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.cdninstagram.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting comment=Twitter content=t.co \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.twitter.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=twitter.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.twimg.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting comment=TikTok content=\
    .tiktok.com disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.tiktokv.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.tiktokcdn.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.byteoversea.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.ibyteimg.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.ibytedtos.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.ttwstatic.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.ttlivecdn.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.tiktokcdn-us.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.tiktokcdn-in.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=bytedance.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.myqcloud.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting comment=YouTube content=\
    .youtube.com disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=youtu.be disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=yt3.ggpht.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=youtubei.googleapis.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.ytimg.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Social-Media-Lists \
    address-list-timeout=1h chain=prerouting content=.googlevideo.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Microsoft Teams" \
    content=*.lync.com disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=*.teams.microsoft.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=teams.microsoft.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Microsoft Teams Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=3478-3481 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment=WhatsApp content=\
    .whatsapp.com disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.whatsapp.net disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=wa.me disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="WhatsApp Business" \
    content=g.whatsapp.net disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=v.whatsapp.net disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=mmg.whatsapp.net \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=graph.facebook.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=static.whatsapp.net \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment=\
    "WhatsApp Docker Container" content=docker.whatsapp.biz disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=dl.bintray.com disabled=\
    no !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=akamai.bintray.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Whatsapp TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Whatsapp UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment=Telegram content=\
    telegram.org disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=api.telegram.org \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=core.telegram.org \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=web.telegram.org \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=t.me disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=telesco.pe disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Google Meet" content=\
    .google.com disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.googleapis.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.gstatic.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.googleusercontent.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.googlevideo.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.googlevideo.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.youtube-nocookie.com \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=.ytimg.com disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Remote Desktop Visa" \
    content=rdweb.wvd.microsoft.com disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    rdweb.privatelink-global.wvd.microsoft.com. disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    azit1-desk-305.telkomsel.co.id disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    rdgateway-host-blue-c102-seas-r1.wvd.microsoft.com disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    waws-prod-sg1-d3cbe525.sip.p.azurewebsites.windows.net disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    mrs-seasr1c106-rdweb-prod.wvd-ase-seasr1c106-prod.p.azurewebsites.net \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content="mrs-seasr1c102-rdgateway\
    -host-blue-prod.wvd-ase-seasr1c102-prod.p.azurewebsites.net" disabled=no \
    !dscp !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    waws-prod-sg1-81255959.sip.p.azurewebsites.windows.net disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    rdweb-prod-geo.trafficmanager.net disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    rdweb.privatelink.wvd.microsoft.com disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    rdweb.privatelink-global.wvd.microsoft.com disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting content=\
    waws-prod-sg1-d3cbe525.cloudapp.net disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="VPN MRA Telkomsel" \
    address-list-timeout=4h10m chain=prerouting comment="VPN MRA Telkomsel" \
    content=mra.telkomsel.co.id disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="VPN MRA Telkomsel" \
    address-list-timeout=4h10m chain=prerouting content=\
    india1.telkomsel.co.id disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Google Meet TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=19302-19309 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=High-Priority \
    address-list-timeout=1h chain=prerouting comment="Google Meet UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=19302-19309 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Mobile Legend TCP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port="5\
    000-5221,5224-5227,5229-5241,5243-5287,5289-5352,5354-5509,5517,5520-5529" \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Mobile Legend TCP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    5551-5559,5601-5700,8443,9000-9010,9443,10003,30000-30900 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Mobile Legend UDP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    2702,3702,4001-4009,5000-5221,5224-5241,5243-5287,5289-5352,5354-5509 \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Mobile Legend UDP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    5517-5529,5551-5559,5601-5700,8001,8130 !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority protocol=udp !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Mobile Legend UDP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    8443,9000-9010,9120,9992,10003,30000-30900 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Free Fire TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    6006,6008,6674,7000-7999,8001-8012,9006,9137,10000-10015,11000-11019 \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Free Fire TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    12006,12008,13006,15006,20561,39003,39006,39698,39779,39800 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Free Fire UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    6006,6008,6674,7000-7999,8008,8001-8012,8130,8443,9008,9120 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Free Fire UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    10000-10015,10100,11000-11019,12008,13008 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="PUBG Mobile TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    7889,10012,13004,14000,17000,17500,18081,20000-20002,20371 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="PUBG Mobile UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    8011,9030,10491,10612,12235,13004,13748,17000,17500,20000-20002 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Call of Duty TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    3013,10000-10019,18082,50000,65010,65050 !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority protocol=tcp !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Call of Duty UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    7085-7995,8700,9030,10010-10019,17000-20100 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Arena of Valor UDP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    10001-10094 !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Arena of Valor UDP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    10101-10201,10080-10110,17000-18000 !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority protocol=udp !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Stumble Guys TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=5055-5058 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Stumble Guys UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=5055-5058 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Genshin TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=42472 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Genshin UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=42472,22101-22102 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Clash of Clans &  Clash Royale TCP Ports" !content disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit dst-port=9330-9340 !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority protocol=tcp !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Clash of Clans &  Clash Royale UDP Ports" !content disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit dst-port=9330-9340 !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority protocol=udp !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "League of Legends Mobile TCP Ports" !content disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit dst-port=2080-2099 !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority protocol=tcp !psd !random !src-address src-address-list=\
    IP-Local-Client !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "League of Legends Mobile UDP Ports" !content disabled=no !dscp \
    !dst-address dst-address-list=!IP-Local-Client !dst-address-type \
    !dst-limit dst-port=5100 !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="DOTA TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=\
    9100-9200,8230-8250,8110-8120,27000-28998 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="DOTA UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=27000-28998,39000 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Fifa Online TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=7770-7790 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Fifa Online UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=16300-16350 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Point Blank Mobile TCP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    44590-44610 !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Point Blank Mobile UDP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    40000-40010 !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "LINE Let\92s Get Rich TCP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    10500-10515 !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment=\
    "Dream League Soccer UDP Ports" !content disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit dst-port=\
    60970-60980 !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Among Us TCP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=27015-27030,27036-27037 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list=Games-Online \
    address-list-timeout=1h chain=prerouting comment="Among Us UDP Ports" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=4380,27000-27031,27036 !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="Nun Corp" \
    address-list-timeout=1h chain=prerouting comment="NUN CORP" content=\
    .nuncorp.id disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="Nun Corp" \
    address-list-timeout=1h chain=prerouting comment="NUN CORP" content=\
    nuncorp.id disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="Nun Corp" \
    address-list-timeout=1h chain=prerouting comment="Sub Domain NUN CORP" \
    content=absen.nuncorp.id disabled=no !dscp !dst-address dst-address-list=\
    !IP-Local-Client !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="Nun Corp" \
    address-list-timeout=1h chain=prerouting comment="Sub Domain NUN CORP" \
    content=lowongan-pekerjaan.nuncorp.id disabled=no !dscp !dst-address \
    dst-address-list=!IP-Local-Client !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !limit log=no log-prefix="" \
    !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="Nun Corp" \
    address-list-timeout=1h chain=prerouting comment="NUN CORP TCP PORT" \
    !content disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=2096,2083 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=add-dst-to-address-list address-list="Nun Corp" \
    address-list-timeout=1h chain=prerouting comment="NUN CORP UDP" !content \
    disabled=no !dscp !dst-address dst-address-list=!IP-Local-Client \
    !dst-address-type !dst-limit dst-port=2096,2083 !fragment !hotspot \
    !icmp-options !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !limit log=no log-prefix="" !nth \
    !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority protocol=udp !psd !random \
    !src-address src-address-list=IP-Local-Client !src-address-type \
    !src-mac-address !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
/ip firewall service-port
set ftp disabled=no ports=21
set tftp disabled=no ports=69
set irc disabled=no ports=6667
set h323 disabled=no
set sip disabled=no ports=5060,5061 sip-direct-media=yes sip-timeout=1h
set pptp disabled=no
set udplite disabled=no
set dccp disabled=no
set sctp disabled=no
/ip hotspot service-port
set ftp disabled=no ports=21
/ip hotspot user
set [ find default=yes ] comment="counters and limits for trial users" \
    disabled=no name=default-trial
/ip ipsec policy
set 0 disabled=no dst-address=::/0 group=default proposal=default protocol=\
    all src-address=::/0 template=yes
/ip ipsec settings
set accounting=yes interim-update=0s xauth-use-radius=no
/ip proxy
set always-from-cache=no anonymous=no cache-administrator=webmaster \
    cache-hit-dscp=4 cache-on-disk=no cache-path=web-proxy enabled=no \
    max-cache-object-size=2048KiB max-cache-size=unlimited \
    max-client-connections=600 max-fresh-time=3d max-server-connections=600 \
    parent-proxy=:: parent-proxy-port=0 port=8080 serialize-connections=no \
    src-address=::
/ip route
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "TO ISP 1 INDIHOME" disabled=no distance=1 dst-address=0.0.0.0/0 gateway=\
    192.168.1.1 !route-tag routing-mark=Route-ISP1 scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "TO ISP 2 ASTINET" disabled=no distance=1 dst-address=0.0.0.0/0 gateway=\
    36.64.20.150 !route-tag routing-mark=Route-ISP2 scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "Route to ISP 1 (Mobile Remote Access Telkomsel)" disabled=no distance=1 \
    dst-address=0.0.0.0/0 gateway=192.168.1.1 !route-tag routing-mark=\
    Through-ISP1 scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "Backup Route to ISP 2 (Mobile Remote Access Telkomsel)" disabled=no \
    distance=2 dst-address=0.0.0.0/0 gateway=36.64.20.150 !route-tag \
    routing-mark=Through-ISP1 scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "Route to ISP 2 (NUN CORP)" disabled=no distance=1 dst-address=0.0.0.0/0 \
    gateway=36.64.20.150 !route-tag routing-mark=Through-ISP2 scope=30 \
    target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "Route to ISP 1 (NUN CORP)" disabled=no distance=2 dst-address=0.0.0.0/0 \
    gateway=192.168.1.1 !route-tag routing-mark=Through-ISP2 scope=30 \
    target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "ISP 1 (INDIHOME)" disabled=no distance=1 dst-address=0.0.0.0/0 gateway=\
    192.168.1.1 !route-tag !routing-mark scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "Recrusive ISP1 (Main Connection)" disabled=yes distance=1 dst-address=\
    0.0.0.0/0 gateway=1.1.1.1 !route-tag !routing-mark scope=30 target-scope=\
    30
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "Recrusive ISP2 (Backup Connection)" disabled=yes distance=2 dst-address=\
    0.0.0.0/0 gateway=1.1.1.2 !route-tag !routing-mark scope=30 target-scope=\
    30
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "ISP 2 (ASTINET)" disabled=yes distance=2 dst-address=0.0.0.0/0 gateway=\
    36.64.20.150 !route-tag !routing-mark scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend !check-gateway comment=\
    "Check to ISP 1 (INDIHOME)" disabled=no distance=1 dst-address=1.1.1.1/32 \
    gateway=192.168.1.1 !route-tag !routing-mark scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "CHECK ISP 1 INDIHOME (MAIN CONNETION)" disabled=yes distance=1 \
    dst-address=1.1.1.1/32 gateway=192.168.1.1 !route-tag !routing-mark \
    scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend !check-gateway comment=\
    "Check to ISP 2 (ASTINET)" disabled=no distance=1 dst-address=1.1.1.2/32 \
    gateway=36.64.20.150 !route-tag !routing-mark scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend check-gateway=ping comment=\
    "CHECK ISP 2 ASTINET (BACKUP CONNECTION)" disabled=yes distance=2 \
    dst-address=1.1.1.2/32 gateway=36.64.20.150 !route-tag !routing-mark \
    scope=30 target-scope=10
/ip service
set telnet address="" disabled=yes port=23
set ftp address="" disabled=yes port=2121
set www address="" disabled=no port=8081
set ssh address="" disabled=no port=2022
set www-ssl address="" certificate=none disabled=yes port=443 tls-version=any
set api address="" disabled=yes port=8728
set winbox address="" disabled=no port=8291
set api-ssl address="" certificate=none disabled=yes port=8729 tls-version=\
    any
/ip smb
set allow-guests=yes comment=MikrotikSMB domain=MSHOME enabled=no interfaces=\
    all
/ip smb shares
set [ find default=yes ] comment="default share" directory=/flash/pub \
    disabled=no max-sessions=10 name=pub
/ip smb users
set [ find default=yes ] disabled=no name=guest password="" read-only=yes
/ip socks
set auth-method=none connection-idle-timeout=2m enabled=no max-connections=\
    200 port=1080 version=4
/ip ssh
set allow-none-crypto=no always-allow-password-login=no forwarding-enabled=no \
    host-key-size=2048 strong-crypto=no
/ip tftp settings
set max-block-size=4096
/ip traffic-flow
set active-flow-timeout=30m cache-entries=64k enabled=no \
    inactive-flow-timeout=15s interfaces=all packet-sampling=no \
    sampling-interval=0 sampling-space=0
/ip traffic-flow ipfix
set bytes=yes dst-address=yes dst-address-mask=yes dst-mac-address=yes \
    dst-port=yes first-forwarded=yes gateway=yes icmp-code=yes icmp-type=yes \
    igmp-type=yes in-interface=yes ip-header-length=yes ip-total-length=yes \
    ipv6-flow-label=yes is-multicast=yes last-forwarded=yes nat-dst-address=\
    yes nat-dst-port=yes nat-events=no nat-src-address=yes nat-src-port=yes \
    out-interface=yes packets=yes protocol=yes src-address=yes \
    src-address-mask=yes src-mac-address=yes src-port=yes sys-init-time=yes \
    tcp-ack-num=yes tcp-flags=yes tcp-seq-num=yes tcp-window-size=yes tos=yes \
    ttl=yes udp-length=yes
/ip upnp
set allow-disable-external-interface=no enabled=no show-dummy-rule=yes
/mpls
set allow-fast-path=yes dynamic-label-range=16-1048575 propagate-ttl=yes
/mpls interface
set [ find default=yes ] disabled=no interface=all mpls-mtu=1508
/mpls ldp
set distribute-for-default-route=no enabled=no hop-limit=255 loop-detect=no \
    lsr-id=0.0.0.0 path-vector-limit=255 transport-address=0.0.0.0 \
    use-explicit-null=no
/port firmware
set directory=firmware ignore-directip-modem=no
/ppp aaa
set accounting=yes interim-update=0s use-circuit-id-in-nas-port-id=no \
    use-radius=no
/radius incoming
set accept=no port=3799
/routing bfd interface
set [ find default=yes ] disabled=no interface=all interval=0.2s min-rx=0.2s \
    multiplier=5
/routing mme
set bidirectional-timeout=2 gateway-class=none gateway-keepalive=1m \
    gateway-selection=no-gateway origination-interval=5s preferred-gateway=\
    0.0.0.0 timeout=1m ttl=50
/routing rip
set distribute-default=never garbage-timer=2m metric-bgp=1 metric-connected=1 \
    metric-default=1 metric-ospf=1 metric-static=1 redistribute-bgp=no \
    redistribute-connected=no redistribute-ospf=no redistribute-static=no \
    routing-table=main timeout-timer=3m update-timer=30s
/snmp
set contact="" enabled=no engine-id="" location="" trap-community=public \
    trap-generators=temp-exception trap-target="" trap-version=1
/system clock
set time-zone-autodetect=yes time-zone-name=Asia/Jakarta
/system clock manual
set dst-delta=+00:00 dst-end="jan/01/1970 00:00:00" dst-start=\
    "jan/01/1970 00:00:00" time-zone=+00:00
/system identity
set name=NUN
/system leds settings
set all-leds-off=never
/system logging
set 0 action=memory disabled=no prefix="" topics=info
set 1 action=memory disabled=no prefix="" topics=error
set 2 action=memory disabled=no prefix="" topics=warning
set 3 action=echo disabled=no prefix="" topics=critical
/system note
set note="" show-at-login=yes
/system ntp client
set enabled=yes primary-ntp=103.28.56.14 secondary-ntp=103.123.108.224 \
    server-dns-names=""
/system resource irq
set 0 cpu=auto
set 1 cpu=auto
set 2 cpu=auto
/system resource irq rps
set ether1-isp1-indihome disabled=yes
set ether2-isp2-astinet disabled=yes
set ether3 disabled=yes
set ether4 disabled=yes
set ether5 disabled=yes
/system routerboard settings
set auto-upgrade=no boot-device=nand-if-fail-then-ethernet boot-protocol=\
    bootp disable-pci=no force-backup-booter=no protected-routerboot=disabled \
    reformat-hold-button=20s reformat-hold-button-max=10m silent-boot=no
/system routerboard mode-button
set enabled=no hold-time=0s..1m on-event=""
/system routerboard reset-button
set enabled=no hold-time=0s..1m on-event=""
/system upgrade mirror
set check-interval=1d enabled=no primary-server=0.0.0.0 secondary-server=\
    0.0.0.0 user=""
/system watchdog
set auto-send-supout=no automatic-supout=yes ping-start-after-boot=5m \
    ping-timeout=1m watch-address=none watchdog-timer=yes
/tool bandwidth-server
set allocate-udp-ports-from=2000 authenticate=yes enabled=yes max-sessions=\
    100
/tool e-mail
set address=0.0.0.0 from=<> password="" port=25 start-tls=no user=""
/tool graphing
set page-refresh=300 store-every=5min
/tool mac-server
set allowed-interface-list=all
/tool mac-server mac-winbox
set allowed-interface-list=all
/tool mac-server ping
set enabled=yes
/tool netwatch
add comment="Failover Ping to Check ISP 1 (INDIHOME)" disabled=no \
    down-script="/ip route disable [find comment=\"ISP 1 (INDIHOME)\"]" host=\
    1.1.1.1 interval=3s timeout=1s up-script=\
    "/ip route enable [find comment=\"ISP 1 (INDIHOME)\"]"
add comment="Failover Ping to Check ISP 2 (ASTINET)" disabled=no down-script=\
    "/ip route disable [find comment=\"ISP 2 (ASTINET)\"]" host=1.1.1.2 \
    interval=3s timeout=1s up-script=\
    "/ip route enable [find comment=\"ISP 2 (INDIHOME)\"]"
/tool romon
set enabled=yes id=00:00:00:00:00:00 secrets=nun062022
/tool romon port
set [ find default=yes ] cost=100 disabled=no forbid=no interface=all \
    secrets=""
/tool sms
set allowed-number="" auto-erase=no channel=0 port=none receive-enabled=no \
    secret="" sim-pin=""
/tool sniffer
set file-limit=1000KiB file-name="" filter-cpu="" filter-direction=any \
    filter-interface="" filter-ip-address="" filter-ip-protocol="" \
    filter-ipv6-address="" filter-mac-address="" filter-mac-protocol="" \
    filter-operator-between-entries=or filter-port="" filter-size="" \
    filter-stream=no memory-limit=100KiB memory-scroll=yes only-headers=no \
    streaming-enabled=no streaming-server=0.0.0.0:37008
/tool traffic-generator
set latency-distribution-max=100us measure-out-of-order=no \
    stats-samples-to-keep=100 test-id=0
/user aaa
set accounting=yes default-group=read exclude-groups="" interim-update=0s \
    use-radius=no
