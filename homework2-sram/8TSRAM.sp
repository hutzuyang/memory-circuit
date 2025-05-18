
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"
.global vdd vss

Mp0 Q QB vdd vdd pmos W=3u L=0.065u
Mn0 Q QB vss vss nmos W=3u L=0.065u
Mn1 QB WL BLB vss nmos W=3u L=0.065u
Mn2 RDBL RDWL node vss nmos W=3u L=0.065u
Mn3 node QB vss vss nmos W=3u L=0.065u
C1 BLB vss 0.1p

Vss vss 0 0
Vdd vdd 0 0.8

Vw WL 0 pulse(0 0.8 2n 0.1n 0.1n 2n 4.2n)
Vb BLB vdd 0

Vrb RDBL vss 0
Vrw RDWL Vss 0

.ic V(Q)=0.8 V(QB)=0
.tran 0.01n 5n
.option post
.print v(QB)
.print pw='-V(Vdd)*I(Vb)*2'
.end