* Here we use HfOx, which has 1e8 HRS and 1e4 LRS
* 1 is HRS, 0 is LRS
.include 'subckt/rram.sp'
.option post=ASCII

.param th_var=AGAUSS(0, 0.2, 3)
.param globalvar = AGAUSS(0, 0.25, 3)
.param c_global = 'globalvar'
.param c_local = AGAUSS(0, 0.25, 3)

.dc VDC
    + start=0 stop=1.0 step=0.01 sweep monte=8

.print DC
    + i(VDC)

VDC
    + VDC 0 dc=1
xRRAM
    + VDC 0 RRAM state=1

.end
