
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"
.global vdd vss ML
.subckt inv in out
Mp0 out in vdd vdd pmos W=3u L=0.065u
Mn0 out in vss vss nmos W=3u L=0.065u
.ends

.subckt SRAM Q QB WL BL
Xinv1 Q QB inv
Xinv2 QB Q inv
Mn1 Q WL BL vss nmos W=3u L=0.065u
Mn2 ML QB node vss nmos W=3u L=0.065u
Mn3 node BL vss vss nmos W=3u L=0.065u
.ends

XSRAM1 Qi QBi WL SL SRAM
XSRAM2 Qj QBj WL SLB SRAM

Mn4 ML Pre vdd vss nmos W=3u L=0.065u

Vss vss 0 0
Vdd vdd 0 1
Vw WL 0 pwl(0n 0 0.1n 1 1n 1 1.1n 0)
Vs1 SL 0 pwl(0n 0 4n 0 4.1n 1 5n 1 5.1n 0 6n 0)
Vs2 SLB 0 pwl(0n 0 0.1n 1 1n 1 1.1n 0 2n 0 2.1n 1 3n 1 3.1n 0 6n 0)
Vp Pre 0 pulse(0 1 1n 0.1n 0.1n 0.8n 2n)

.tran 0.01n 8n
.option post
.end