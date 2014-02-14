#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Copyright (c) 2012 - Seweryn Dynerowicz, FUNDP.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# imitations under the License.

import sys

from Metarouting.Algebra.RoutingMatrix import *

from Metarouting.Policy.Routing.Diamond import *
from Metarouting.Policy.Routing.WidestShortest import *

B = RoutingMatrix(1, 4, [1.0, 0.0, 0.0, 0.0], cast=Diamond)

def statusString():
    global count, total
    sstr = str(round(100.0 * (count/total),1)).rjust(6) + "% (" + str(int(count)) + "/" + str(int(total)) + ")"
    sys.stdout.write("\r" + sstr)
    sys.stdout.flush()

def createA(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12):
    return RoutingMatrix(4, 4, [Diamond.zeroElt, a1, a2, a3, a4, Diamond.zeroElt, a5, a6, a7, a8, Diamond.zeroElt, a9, a10, a11, a12, Diamond.zeroElt], cast=Diamond)

dvalues0 = [ 0.0, 0.2, 0.5, 0.8 ]

vcount = 0
count = 0.0
total = len(dvalues0)**12

for a1 in dvalues0:
    for a2 in dvalues0:
        for a3 in dvalues0:
            for a4 in dvalues0:
                for a5 in dvalues0:
                    for a6 in dvalues0:
                        for a7 in dvalues0:
                            for a8 in dvalues0:
                                for a9 in dvalues0:
                                    for a10 in dvalues0:
                                        for a11 in dvalues0:
                                            for a12 in dvalues0:
                                                A = createA(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12)
                                                R = A.rightLocalOptimum()
                                                X = RoutingMatrix(1, 4, [R(1,1), R(1,2), R(1,3), R(1,4)])
                                                if(X == X*A + B):
                                                    for y1 in dvalues0:
                                                        for y2 in dvalues0:
                                                            for y3 in dvalues0:
                                                                for y4 in dvalues0:
                                                                    Y = RoutingMatrix(1, 4, [y1, y2, y3, y4], cast=Diamond)
                                                                    if (Y == Y*A + B and (X+Y) != (X+Y)*A + B):
                                                                        print
                                                                        print("A\n" + str(A))
                                                                        print
                                                                        print("X\n" + str(X))
                                                                        print
                                                                        print("Y\n" + str(Y))
                                                                        print
                                                                        vcount += 1
                                                count += 1
                                                statusString()

print("\nViolation count : " + str(vcount))
