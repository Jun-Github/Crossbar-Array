# RRAM has threshold of 0.3131 V

import numpy as np
import math

def eng_string(x, format='%s', si=False):
    '''
    Returns float/int value <x> formatted in a simplified
    format using an exponent that is multiple of 3.

    format: printf-style used to format the value
    before exponent.

    si : if true, use SI suffix for exponent,
    e.g. k instead of e3, n instead of e-9 etc.

    E.g. with format='%.2f':
       1.23e-08 => 12.30e-9
            123 => 123.00
         1230.0 => 1.23e3
     -1230000.0 => -1.23e6

    and with si=True:
          1230.0 =>  1.23k
      -1230000.0 => -1.23M
    '''
    sign = ''
    if x < 0:
        x = -x
        sign = '-'
    elif x == 0:
        exp = 0
        exp3 = 0

    if x == 0:
        exp = 0
        exp3 = 0
    else:
        exp = int(math.floor(math.log10(x)))
        exp3 = exp - (exp % 3)

    x3 = x / (10 ** exp3)
    x3 = round(x3, 2)

    if si and exp >= -24 and exp3 <= 24:
        exp3_text = 'yzafpnum kMGTPEZY'[exp3 // 3 + 8]
    elif exp == 0:
        exp_text = ''
    else:
        exp3_text = 'e%r' % exp3

    return ('%s'+format+'%s') % (sign, x3, exp3_text)

# HfOx configuration
R_LRS = 1e4
R_HRS = 1e8

g_LRS = 1/R_LRS
g_HRS = 1/R_HRS

Vth = 0.57

weight = np.array([g_LRS, g_HRS, g_LRS, g_LRS,
                    g_HRS, g_HRS, g_LRS, g_HRS])
input = np.array([[1, 0, 1, 1, 0, 0, 1, 0],
                [0, 1, 1, 0, 1, 0, 0, 0],
                [0, 0, 1, 1, 0, 0, 1, 0],
                [1, 1, 0, 0, 1, 1, 0, 1],
                [1, 0, 0, 0, 1, 0, 0, 1],
                [0, 0, 1, 0, 0, 1, 1, 1],
                [1, 1, 1, 1, 1, 1, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0]])

for i in range(8):
    input_th = input[i] * (1 - Vth)
    output = np.dot(weight, input_th)

    print('{0} : The output of {1} is {2}'
            .format(i, input[i], eng_string(output, si=True)))

