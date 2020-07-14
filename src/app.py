#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys
import random


def num():
    return random.randint(1, 65535)


def op():
    return random.choice(['+', '-', '*', '/'])


def calc():
    tmp = "%d" % num()
    for i in range(8):
        tmp += " %s %d" % (op(), num())
    res = eval(tmp)
    return res, tmp


def serve():
    sys.stdout.write('Welcome to CTFHub\n')
    # while True:
    res, tmp = calc()
    ip = input('Plz calc: \n> %s\n$ ' % tmp)
    flag = 'error'
    if ip == str(res):
        flag = 'Flag{awfcwaefewefwfcew}'
    sys.stdout.write('%s\n' % flag)


if __name__ == "__main__":
    serve()
