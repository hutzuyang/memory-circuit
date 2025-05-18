
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"
.global vdd vss
.subckt inv in out
Mp0 out in vdd vdd pmos W=3u L=0.065u
Mn0 out in vss vss nmos W=3u L=0.065u
.ends

.subckt and S2 S1 S0 EN D
Mp1 node0 S2 vdd vdd pmos W=3u L=0.065u
Mp2 node0 S1 vdd vdd pmos W=3u L=0.065u
Mp3 node0 S0 vdd vdd pmos W=3u L=0.065u
Mp4 node0 EN vdd vdd pmos W=3u L=0.065u
Mn1 node0 S2 node1 vss nmos W=3u L=0.065u
Mn2 node1 S1 node2 vss nmos W=3u L=0.065u
Mn3 node2 S0 node3 vss nmos W=3u L=0.065u
Mn4 node3 EN vss vss nmos W=3u L=0.065u
Xinv4 node0 D inv
.ends

Xinv0 inC outC inv
Xinv1 inB outB inv
Xinv2 inA outA inv

Xand0 outA outB outC enable D0 and
Xand1 outA outB inC enable D1 and
Xand2 outA inB outC enable D2 and
Xand3 outA inB inC enable D3 and
Xand4 inA outB outC enable D4 and
Xand5 inA outB inC enable D5 and
Xand6 inA inB outC enable D6 and
Xand7 inA inB inC enable D7 and

Vss vss 0 0
Vdd vdd 0 1


Vina inA 0 pulse(0 1 9.5n 0.5n 0.5n 9.5n 20n)
Vinb inB 0 pulse(0 1 4.5n 0.5n 0.5n 4.5n 10n)
Vinc inC 0 pulse(0 1 2n 0.5n 0.5n 2n 5n)
Vine enable 0 pulse(0 1 0n 0.5n 0.5n 19.5n 40n)

.tran 0.1p 40ns
.option post=1

.print v(inA)
.print v(inB)
.print v(inC)
.print v(enable)
.print v(D0)
.print v(D1)
.print v(D2)
.print v(D3)
.print v(D4)
.print v(D5)
.print v(D6)
.print v(D7)
.end