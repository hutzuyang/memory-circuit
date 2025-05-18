
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"

Mp1 outEN inEN vdd vdd pmos W=3u L=0.065u
Mn1 outEN inEN vss vss nmos W=3u L=0.065u

Mp2 out outEN in vdd pmos W=3u L=0.065u
Mn2 out inEN in vss nmos W=3u L=0.065u

Vss vss 0 0
Vdd vdd 0 1

Vin in 0 pulse(0 1 4.5n 0.5n 0.5n 4.5n 10n)
Vinen inEN 0 pulse(0 1 2n 0.5n 0.5n 2n 5n)

.tran 0.1p 10ns
.option post=1

.print v(in)
.print v(inEN)
.print v(out)
.end