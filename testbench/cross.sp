* Here we use HfOx, which has 1e8 HRS and 1e4 LRS
* 1 is HRS, 0 is LRS
.include 'subckt/crossbar.sp'
.option post=ASCII

.param th_var = AGAUSS(0, 0.2, 3)
.param glovar = AGAUSS(0, 0.25, 3)
.param c_global = 'glovar'
.param c_local = AGAUSS(0, 0.25, 3)

.tran
    + 10n 80n sweep monte=8
.print tran 
    + i(VCOL0) i(VCOL1) i(VCOL2) i(VCOL3)
    + i(VCOL4) i(VCOL5) i(VCOL6) i(VCOL7)

xCROSS_ARRAY
    + VR0 VR1 VR2 VR3 VR4 VR5 VR6 VR7
    + IC0 IC1 IC2 IC3 IC4 IC5 IC6 IC7
    + CROSSBAR
    + W0_0=1 W0_1=1 W0_2=0 W0_3=0 W0_4=1 W0_5=1 W0_6=0 W0_7=1
    + W1_0=0 W1_1=0 W1_2=0 W1_3=1 W1_4=1 W1_5=1 W1_6=0 W1_7=1
    + W2_0=0 W2_1=1 W2_2=0 W2_3=1 W2_4=0 W2_5=0 W2_6=1 W2_7=0
    + W3_0=1 W3_1=0 W3_2=1 W3_3=1 W3_4=0 W3_5=0 W3_6=0 W3_7=1
    + W4_0=0 W4_1=1 W4_2=0 W4_3=1 W4_4=1 W4_5=1 W4_6=0 W4_7=1
    + W5_0=1 W5_1=0 W5_2=0 W5_3=0 W5_4=0 W5_5=0 W5_6=1 W5_7=1
    + W6_0=1 W6_1=0 W6_2=0 W6_3=0 W6_4=1 W6_5=0 W6_6=1 W6_7=0
    + W7_0=1 W7_1=0 W7_2=1 W7_3=0 W7_4=1 W7_5=0 W7_6=1 W7_7=0

VCOL0 IC0 0 dc=0
VCOL1 IC1 0 dc=0
VCOL2 IC2 0 dc=0
VCOL3 IC3 0 dc=0
VCOL4 IC4 0 dc=0
VCOL5 IC5 0 dc=0
VCOL6 IC6 0 dc=0
VCOL7 IC7 0 dc=0

V0 VR0 0 pwl
    + 00n 1v, 09n 1v,
    + 10n 0v, 19n 0v,
    + 20n 0v, 29n 0v,
    + 30n 1v, 39n 1v,
    + 40n 1v, 49n 1v,
    + 50n 0v, 59n 0v,
    + 60n 1v, 69n 1v,
    + 70n 0v, 79n 0v

V1 VR1 0 pwl
    + 00n 0v, 09n 0v,
    + 10n 1v, 19n 1v,
    + 20n 0v, 29n 0v,
    + 30n 1v, 39n 1v,
    + 40n 0v, 49n 0v,
    + 50n 0v, 59n 0v,
    + 60n 1v, 69n 1v,
    + 70n 0v, 79n 0v

V2 VR2 0 pwl
    + 00n 1v, 09n 1v,
    + 10n 1v, 19n 1v,
    + 20n 1v, 29n 1v,
    + 30n 0v, 39n 0v,
    + 40n 0v, 49n 0v,
    + 50n 1v, 59n 1v,
    + 60n 1v, 69n 1v,
    + 70n 0v, 79n 0v

V3 VR3 0 pwl
    + 00n 1v, 09n 1v,
    + 10n 0v, 19n 0v,
    + 20n 1v, 29n 1v,
    + 30n 0v, 39n 0v,
    + 40n 0v, 49n 0v,
    + 50n 0v, 59n 0v,
    + 60n 1v, 69n 1v,
    + 70n 0v, 79n 0v

V4 VR4 0 pwl
    + 00n 0v, 09n 0v,
    + 10n 1v, 19n 1v,
    + 20n 0v, 29n 0v,
    + 30n 1v, 39n 1v,
    + 40n 1v, 49n 1v,
    + 50n 0v, 59n 0v,
    + 60n 1v, 69n 1v,
    + 70n 0v, 79n 0v

V5 VR5 0 pwl
    + 00n 0v, 09n 0v,
    + 10n 0v, 19n 0v,
    + 20n 0v, 29n 0v,
    + 30n 1v, 39n 1v,
    + 40n 0v, 49n 0v,
    + 50n 1v, 59n 1v,
    + 60n 1v, 69n 1v,
    + 70n 0v, 79n 0v
    
V6 VR6 0 pwl
    + 00n 1v, 09n 1v,
    + 10n 0v, 19n 0v,
    + 20n 1v, 29n 1v,
    + 30n 0v, 39n 0v,
    + 40n 0v, 49n 0v,
    + 50n 1v, 59n 1v,
    + 60n 0v, 69n 0v,
    + 70n 0v, 79n 0v

V7 VR7 0 pwl
    + 00n 0v, 09n 0v,
    + 10n 0v, 19n 0v,
    + 20n 0v, 29n 0v,
    + 30n 1v, 39n 1v,
    + 40n 1v, 49n 1v,
    + 50n 1v, 59n 1v,
    + 60n 0v, 69n 0v,
    + 70n 0v, 79n 0v

.end
