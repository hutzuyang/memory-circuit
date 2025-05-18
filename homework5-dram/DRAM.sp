
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"
.global vdd vss
.subckt inv in out
Mp0 out in vdd vdd pmos W=3u L=0.065u
Mn0 out in vss vss nmos W=3u L=0.065u
.ends

.subckt row WL BL1 BL2 BL3 BL4
Mn1 BL1 WL SN1 vss nmos W=3u L=0.065u
Mn2 BL2 WL SN2 vss nmos W=3u L=0.065u
Mn3 BL3 WL SN3 vss nmos W=3u L=0.065u
Mn4 BL4 WL SN4 vss nmos W=3u L=0.065u
C1 SN1 vss 1p
C2 SN2 vss 1p
C3 SN3 vss 1p
C4 SN4 vss 1p
.ends

Xrow1 WL1 BL1 BL2 BL3 BL4 row
Xrow2 WL2 BL1 BL2 BL3 BL4 row
Xrow3 WL3 BL1 BL2 BL3 BL4 row
Xrow4 WL4 BL1 BL2 BL3 BL4 row

.subckt and A B YB
Mp5 Y A vdd vdd pmos W=3u L=0.065u
Mp6 Y B vdd vdd pmos W=3u L=0.065u
Mn5 Y A node vss nmos W=3u L=0.065u
Mn6 node B vss vss nmos W=3u L=0.065u
Xinv0 Y YB inv
.ends

.subckt decoder D1 D0 Y1 Y2 Y3 Y4
Xinv1 D1 DB1 inv
Xinv2 D0 DB0 inv
Xand1 DB1 DB0 Y1 and
Xand2 DB1 D0 Y2 and
Xand3 D1 DB0 Y3 and
Xand4 D1 D0 Y4 and
.ends

Xdecoder1 J1 J0 WL1 WL2 WL3 WL4 decoder
Xdecoder2 I1 I0 C1 C2 C3 C4 decoder

.subckt switch in EN out
Xinv3 EN ENB inv
Mp3 out ENB in vdd pmos W=3u L=0.065u
Mn3 out EN in vss nmos W=3u L=0.065u
.ends

.subckt mux S1 S0 A B C D Y
Xinv4 S1 SB1 inv
Xinv5 S0 SB0 inv
Xswitch1 A S1 node1 switch
Xswitch2 node1 S0 Y switch
Xswitch3 B S1 node2 switch
Xswitch4 node2 SB0 Y switch
Xswitch5 C SB1 node3 switch
Xswitch6 node3 S0 Y switch
Xswitch7 D SB1 node4 switch
Xswitch8 node4 SB0 Y switch
.ends

Xmux1 C1 SA BL W vss vss BL1 mux
Xmux2 C2 SA BL W vss vss BL2 mux
Xmux3 C3 SA BL W vss vss BL3 mux
Xmux4 C4 SA BL W vss vss BL4 mux

Mp7 BL BLB SAP vdd pmos W=3u L=0.065u
Mp8 BLB BL SAP vdd pmos W=3u L=0.065u
Mn7 BL BLB SAN vss nmos W=3u L=0.065u
Mn8 BLB BL SAN vss nmos W=3u L=0.065u

Xinv6 SA SAB inv
Mp9 SAP SAB vdd vdd pmos W=3u L=0.065u
Mn9 SAN SA vss vss nmos W=3u L=0.065u

Mn10 BL EQ BLB vss nmos W=3u L=0.065u
Mn11 BL EQ vhd vss nmos W=3u L=0.065u
Mn12 BLB EQ vhd vss nmos W=3u L=0.065u

Mn13 BLB WLB SNB vss nmos W=3u L=0.065u
C13 SNB vss 1p

Vss vss 0 0
Vdd vdd 0 1
Vhd vhd 0 0.5

Vi1 I1 vdd 0
Vi0 I0 vdd 0
Vj1 J1 vdd 0
Vj0 J0 vss 0
Vsa SA 0 pwl(0n 0 4.9n 0 5n 1.5)
Vwb WLB 0 pwl(0n 0 4.9n 0 5n 1)
Veq EQ 0 pwl(0n 1 4.9n 1 5n 0) 
Vw W 0 pwl(0n 1 4.9n 1 5n 0) $ W vss 0 for Write 0

.ic V(SNB)=0
.tran 0.1p 10ns
.option post=1
.end