* Here we use HfOx, which has 1e8 HRS and 1e4 LRS

.subckt RRAM ru rd state=0
    V_thvar
        + ru vd dc='th_var'
    D1
        + vd DR diode1
    
    R1
        + DR rd r='state>0 ? 1e4/(1+c_global+c_local) : 1e8/(1+c_global+c_local)'

    .model diode1 d
.ends

.subckt CROSS_COLUMN
+ V0 V1 V2 V3 V4 V5 V6 V7
+ COL
+ W0=0 W1=0 W2=0 W3=0 W4=0 W5=0 W6=0 W7=0
    XC0 v0 COL RRAM state=W0
    XC1 v1 COL RRAM state=W1
    XC2 v2 COL RRAM state=W2
    XC3 v3 COL RRAM state=W3
    XC4 v4 COL RRAM state=W4
    XC5 v5 COL RRAM state=W5
    XC6 v6 COL RRAM state=W6
    XC7 v7 COL RRAM state=W7
.ends
