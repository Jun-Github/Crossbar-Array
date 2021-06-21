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
# Inputs
## Column Inputs

![Ait text](/data/input/column_input.png)

1D1R Block을 8개를 묶어 만든 Column의 설계에 문제가 없는지 확인하기 위하여 이 Column에 인가한 Input입니다. No Variation의 경우에 이 Input이 실제 Valid Output을 보여줄 수 있는지 확인할 수 있도록 Python으로 행렬 연산 testbench를 작성하여 교차 검증하였습니다. 해당 코드는 data/testbench/testColumn.py에서 확인하실 수 있습니다.


## Crossbar Array Inputs

![Ait text](/data/input/cross_input.png)

Colmnn Subcircuit 8개를 묶어 만든 Crossbar Array의 설계에 문제가 없는지 확인하기 위하여 이 Crossbar Array에 인가한 Input입니다. No Variation의 경우에 이 Input이 실제 Valid Output을 보여줄 수 있는지 확인할 수 있도록 Python으로 행렬 연산 testbench를 작성하여 교차 검증하였습니다. 해당 코드는 data/testbench/testCross.py에서 확인하실 수 있습니다.




# Diode
# Diode IV Curve

![Ait text](/data/diode.png)

Diode의 IV Curve 입니다. 0 ~ 0.8 [V] DC Voltage Sweep을 한 IV Curve입니다.
단일 소자 Diode의 output보다 Diode가 저항과 직렬 연결되어있을 때의 curve가 더 중요합니다. Waveviewer가 semilog scale로 plotting을 지원하지 않아 아쉽습니다.




# 1D1R Block
# No Variation

0 ~ 1 [V] Voltage sweep을 한 결과입니다. 아래 IV Curve에서 Voltage와 Current가 linear한 관계를 보이는 구간을 linear fitting하여 이 line과 x축이 만나는 곳을 Threshold로 설정하였습니다.

![Ait text](/data/no_var/rram.png)

## RRAM Variation

RRAM의 Variation만 있을 때의 Output입니다. Threshold의 변화는 없지만 conductance의 분포가 존재하고, 따라서 Output Current의 분산이 존재하는 것을 확인할 수 있습니다.

![Ait text](/data/r_var/rram.png)

## RRAM & Vth Variation

RRAM과 Vth의 Variation이 모두 존재할 때의 Output입니다. Threshold와 conductance의 분포가 존재하는 것을 볼 수 있고, 따라서 RRAM Variation만 존재할 때 보다 Output Current의 분산이 더 커진 것을 확인할 수 있습니다.

![Ait text](/data/r_th_var/rram.png)


# No Variation Outputs

## Column Output

Digital Input을 인가하여 Transition Analysis를 진행한 Output입니다. 아래 Value들은 Python으로 교차검증 되었습니다. Digital Input에 Binary Weight를 인가하였지만 이 두 값의 곱들의 합은 Quantized된 Analog Output이 출력된 것을 볼 수 있습니다.

![Ait text](/data/no_var/column.png)

## Crossbar Array Output

마찬가지로 Output들이 Analog Voltage가 출력되는 것을 볼 수 있습니다. 위 값들은 역시 Python으로 교차검증 되었습니다.

![Ait text](/data/no_var/cross.png)
