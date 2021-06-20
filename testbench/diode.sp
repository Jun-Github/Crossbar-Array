* Here we use HfOx, which has 1e8 HRS and 1e4 LRS
* 1 is HRS, 0 is LRS
.include 'subckt/rram.sp'

.param th_var = AGAUSS(0, 0.2, 3)
.param globalvar = AGAUSS(0, 0,25, 3)
.param r_global = 'globalvar'
.param r_local = AGAUSS(0, 0.25, 3)

.option post=ASCII
.dc VDC
    + start=0 stop=0.9 step=0.01

.print DC
    + i(VDC)

VDC
    + VDC 0 dc=1
D1
    + VDC 0 diode1

.model
    + diode1 D

.end
