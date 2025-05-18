
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"

Mp1 outS1 inS1 vdd vdd pmos W=3u L=0.065u
Mn1 outS1 inS1 vss vss nmos W=3u L=0.065u

Mp0 outS0 inS0 vdd vdd pmos W=3u L=0.065u
Mn0 outS0 inS0 vss vss nmos W=3u L=0.065u

.subckt switch in inEN out
Mp2 outEN inEN vdd vdd pmos W=3u L=0.065u
Mn2 outEN inEN vss vss nmos W=3u L=0.065u
Mp3 out outEN in vdd pmos W=3u L=0.065u
Mn3 out inEN in vss nmos W=3u L=0.065u
.ends

Xswitch1 inA inS1 node1 switch
Xswitch2 node1 inS0 outY switch
Xswitch3 inB inS1 node2 switch
Xswitch4 node2 outS0 outY switch
Xswitch5 inC outS1 node3 switch
Xswitch6 node3 inS0 outY switch
Xswitch7 inD outS1 node4 switch
Xswitch8 node4 outS0 outY switch

Vss vss 0 0
Vdd vdd 0 1

Vins1 inS1 0 pulse(0 1 4.5n 0.5n 0.5n 4.5n 10n)
Vins0 inS0 0 pulse(0 1 2n 0.5n 0.5n 2n 5n)
Vina inA 0 pulse(0 1 9.5n 0.5n 0.5n 9.5n 20n)
Vinb inB 0 pulse(0 1 0n 0.5n 0.5n 9n 20n)
Vinc inC 0 pulse(0 1 9.5n 0.5n 0.5n 9.5n 20n)
Vind inD 0 pulse(0 1 0n 0.5n 0.5n 9n 20n)

.tran 0.1p 20ns
.option post=1

.print v(inS1)
.print v(inS0)
.print v(inA)
.print v(inB)
.print v(inC)
.print v(inD)
.print v(outY)
.end