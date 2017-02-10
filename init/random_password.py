#!/usr/local/bin/python3
#
# -d : no '-' in pwd
#

import random
import sys

pwdStrPool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
poolSize = len(pwdStrPool)

def create_password(has_dash, pwd_len):
    pwd = ''
    for i in range(0, pwd_len):
        if has_dash and i > 0 and i % 4 == 3:
            pwd += '-'
        else:
            index = random.randint(0, poolSize)
            pwd += pwdStrPool[index:index+1]
    return pwd


if __name__ == '__main__':
    optionArgv = sys.argv[1:]
    has_dash = True
    pwd_len = 0

    for arg in optionArgv:
        if arg == '-d':
            has_dash = False
        else:
            pwd_len = int(arg)

    if pwd_len < 12:
        print('the target length is too short, please set to or bigger than 12 !!!')
    else:
        if pwd_len > 0:
            print(create_password(has_dash, pwd_len));
        else:
            print(create_password(has_dash, 19));
            print(create_password(has_dash, 31));
