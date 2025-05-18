
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"
.global vdd vss
.subckt inv in out SP SN
Mp0 out in SP vdd pmos W=3u L=0.065u
Mn0 out in SN vss nmos W=3u L=0.065u
.ends

Mn1 BL WL SN vss nmos W=3u L=0.065u
Mn2 BLB WL SNB vss nmos W=3u L=0.065u
C1 SN vss 1p
C2 SNB vss 1p

Xinv1 BL BLB SAP SAN inv
Xinv2 BLB BL SAP SAN inv

Mn3 BL EQ vhd vss nmos W=3u L=0.065u
Mn4 BLB EQ vhd vss nmos W=3u L=0.065u
Mn5 BL EQ BLB vss nmos W=3u L=0.065u

Mn6 BL CSL outA vss nmos W=3u L=0.065u
Mn7 BLB CSL outB vss nmos W=3u L=0.065u
Mn8 outA WE nodeA vss nmos W=3u L=0.065u
Mn9 outB WE nodeB vss nmos W=3u L=0.065u
Xinv3 nodeC nodeA vdd vss inv
Xinv4 inA nodeC vdd vss inv
Xinv5 nodeD nodeB vdd vss inv
Xinv6 inB nodeD vdd vss inv

Vss vss 0 0
Vdd vdd 0 1
Vhd vhd 0 0.5

Veq EQ 0 pwl(0n 1 3.5n 1 4n 0)
Vwl WL 0 pwl(0n 0 4n 0 7.5n 1.4)
Vsap SAP 0 pwl(0n 0.5 12n 0.5 14n 1)
Vsan SAN 0 pwl(0n 0.5 9.5n 0.5 13n 0)
Vcsl CSL 0 pwl(0n 0 15n 0 16n 1)
Vwe WE 0 pwl(0n 0 15n 0 16n 1)

Vina inA vdd 0 $ vss for write 0
Vinb inB vss 0 $ vdd for write 0

.ic V(SN)=1 V(SNB)=0 $ V(SN)=0 V(SNB)=1 for read 0
.tran 0.1p 20ns
.option post=1
.end
