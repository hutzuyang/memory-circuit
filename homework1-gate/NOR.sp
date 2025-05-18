
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"

Mp1 node1 inA vdd vdd pmos W=3u L=0.065u
Mp2 out inB node1 vdd pmos W=3u L=0.065u

Mn1 out inA vss vss nmos W=3u L=0.065u
Mn2 out inB vss vss nmos W=3u L=0.065u

Vss vss 0 0
Vdd vdd 0 1

Vina inA 0 pulse(0 1 4.5n 0.5n 0.5n 4.5n 10n)
Vinb inB 0 pulse(0 1 2n 0.5n 0.5n 2n 5n)

.tran 0.1p 10ns
.option post=1

.print v(inA)
.print v(inB)
.print v(out)
.end