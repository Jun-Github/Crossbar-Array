* Here we use HfOx, which has 1e8 HRS and 1e4 LRS
* 1 is HRS, 0 is LRS
.include 'subckt/rram.sp'

.param th_var = 0 AGAUSS(0, 0.2, 3)
.param globalvar = AGAUSS(0, 0.25, 3)
.param r_global = 'globalvar'
.param r_local = AGAUSS(0, 0.25, 3)

.option post=ASCII
.tran
    + 10n 80n sweep monte=8
.print tran
    + i(COL0) 

VCOL0 COL0 0 dc=0

xCross_C0
    + VR0 VR1 VR2 VR3 VR4 VR5 VR6 VR7
    + COL0
    + CROSS_COLUMN
    + W0=1 W1=0 W2=1 W3=1 W4=0 W5=0 W6=1 W7=0

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
