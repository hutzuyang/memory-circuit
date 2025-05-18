
.inc "/home/joey/cad/memory-circuit/65nm_bulk.pm"

Mp1 out1 in vdd1 vdd1 pmos W=3u L=0.065u
Mn1 out1 in vss vss nmos W=3u L=0.065u

Mp2 out2 in vdd2 vdd2 pmos W=3u L=0.065u
Mn2 out2 in vss vss nmos W=3u L=0.065u

Mp3 out3 in vdd3 vdd3 pmos W=3u L=0.065u
Mn3 out3 in vss vss nmos W=3u L=0.065u

Mp4 out4 in vdd4 vdd4 pmos W=3u L=0.065u
Mn4 out4 in vss vss nmos W=3u L=0.065u

Vss vss 0 0
Vdd1 vdd1 0 1
Vdd2 vdd2 0 0.8
Vdd3 vdd3 0 0.6
Vdd4 vdd4 0 0.4

Vin in 0 pulse(0v 1v 0ns 10ns 10ns 10ns 40ns)

.tran 0.1p 10ns
.option post=1

.print v(in)
.print v(out1)
.print v(out2)
.print v(out3)
.print v(out4)
.print p='v(out1)*-i(vdd1)'
.end