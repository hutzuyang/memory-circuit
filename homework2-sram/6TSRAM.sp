
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"
.global vdd vss

Mp0 QB Q vdd vdd pmos W=3u L=0.065u $ Q QB for write
Mn0 QB Q vss vss nmos W=3u L=0.065u $ Q QB for write
Mn1 QB WL BLB vss nmos W=3u L=0.065u
C1 BLB vss 0.1p

Vss vss 0 dc 0
Vdd vdd 0 0.8
Vw WL 0 pulse(0 0.8 2n 0.1n 0.1n 2n 4.2n)
Vb BLB vss 0

.ic V(Q)=0 V(QB)=0.8
.tran 0.01n 5n
.option post
.print v(QB)
.print pw='-V(Vdd)*I(Vb)*2'
.end