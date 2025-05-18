
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"
.global vdd vss
.subckt inv in out
Mp0 out in vdd vdd pmos W=3u L=0.065u
Mn0 out in vss vss nmos W=3u L=0.065u
.ends

.subckt SRAM Q QB WL BL BLB
Xinv1 Q QB inv
Xinv2 QB Q inv
Mn1 Q WL BL vss nmos W=3u L=0.065u
Mn2 QB WL BLB vss nmos W=3u L=0.065u
.ends

XSRAM1 Qi QBi WL SL SLB SRAM
XSRAM2 Qj QBj WL DL DLB SRAM

Mn3 node1 Qi SL vss nmos W=3u L=0.065u
Mn4 node1 QBi SLB vss nmos W=3u L=0.065u
Mn5 ML node1 vss vss nmos W=3u L=0.065u
Mn6 ML Qj vss vss nmos W=3u L=0.065u
Mn7 ML Pre vdd vss nmos W=3u L=0.065u

Vss vss 0 0
Vdd vdd 0 1
Vw WL 0 pwl(0n 0 0.1n 1 1n 1 1.1n 0)
Vs1 SL 0 pwl(0n 0 0.1n 1 1n 1 1.1n 0 4n 0 4.1n 1 5n 1 5.1n 0 6n 0 6.1n 1 7n 1 7.1n 0)
Vs2 SLB 0 pwl(0n 0 2n 0 2.1n 1 3n 1 3.1n 0 6n 0 6.1n 1 7n 1 7.1n 0)
Vd1 DL vss 0
Vd2 DLB 0 pwl(0n 0 0.1n 1 1n 1 1.1n 0)
Vp Pre 0 pulse(0 1 1n 0.1n 0.1n 0.8n 2n)

.ic V(Qi)=0 V(QBi)=1 V(Qj)=1 V(QBi)=0 $
.tran 0.01n 8n
.option post
.end