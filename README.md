# 1. Directory Overview
subckt    : HSPICE subcircuit 파일들을 포함하고 있는 디렉토리 입니다.
testbench : subckt에 포함된 회로들을 test해 볼 수 있는 testbench
            파일들이 포함되어 있습니다. DIODE와 RRAM testbench는
            구성이 간단하기 때문에 HSPICE sp 파일로 구성되어 있고,
            Column과 Cross (Crossbar Array) testbench는
            (1) python과 variation을 없앤 HSPICE sp 파일과의 비교로 
                해당 회로가 정상 작동하는지 알 수 있고
            (2) HSPICE sp 파일에 variation을 설정하여 process variation
                이 존재할 때의 output들의 분포를 볼 수 있도록 하였습니다.
![Ait text](/data/input/column_input.png)
