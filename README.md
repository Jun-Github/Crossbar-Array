# Directory Overview
```
subckt    : HSPICE subcircuit 파일들을 포함하고 있는 디렉토리 입니다.
testbench : subckt에 포함된 회로들을 test해 볼 수 있는 testbench
            파일들이 포함되어 있습니다. DIODE와 RRAM testbench는
            구성이 간단하기 때문에 HSPICE sp 파일로 구성되어 있고,
            Column과 Cross (Crossbar Array) testbench는
            (1) python과 variation을 없앤 HSPICE sp 파일과의 비교로 
                해당 회로가 정상 작동하는지 알 수 있고
            (2) HSPICE sp 파일에 variation을 설정하여 process variation
                이 존재할 때의 output들의 분포를 볼 수 있도록 하였습니다.
output    : testbench의 raw output을 모아놓은 디렉토리 입니다.
data      : output의 wave data를 그림 파일로 모아놓은 디렉토리 입니다.
            input은 input waveform을 plotting한 것이고, no_var/r_var/
            r_th_var은 순서대로 variation이 없을 때의 output / rram 
            variation만 있을 때의 output / rram variation과 threshold
            variaton이 존재할 때의 output입니다.
```
# No Variation Outputs
## Diode IV Curve
```
Diode의 IV Curve 입니다. 단일 소자 Diode의 output보다 Diode가 저항
직렬 연결되어있을 때의 curve가 더 중요합니다. Waveviewer가 semilog 
scale로 plotting을 지원하지 않아 아쉽습니다.
```
![Ait text](/data/input/column_input.png)
