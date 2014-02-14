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

bdcart = [ (b,d) for b in [0,5,10] for d in [1,2,3,4,5,6] ]

Z = WidestShortest.zeroElt
U = WidestShortest.unitElt
B = RoutingMatrix(1, 5, [Z, Z, Z, U, Z], cast=WidestShortest)

def statusString():
    global count, total
    sstr = str(round(100.0 * (count/total),1)).rjust(6) + "% (" + str(int(count)) + "/" + str(int(total)) + ")"
    sys.stdout.write("\r" + sstr)
    sys.stdout.flush()

vcount = 0
count = 0.0
total = len(bdcart)**5

A = RoutingMatrix(5, 5, [   Z  , (1,1),   Z  ,   Z  ,   Z
                        ,   Z  ,   Z  ,   Z  ,   Z  ,   Z
                        ,   Z  , (1,4),   Z  , (1,1),   Z
                        , (1,1),   Z  ,   Z  ,   Z  , (2,1)
                        , (2,5),   Z  , (1,1),   Z  ,   Z  ], cast=WidestShortest)

R = A.rightLocalOptimum()
X = RoutingMatrix(1, 5, [ R(4,1), R(4,2), R(4,3), R(4,4), R(4,5) ])
for y1 in bdcart:
    for y2 in bdcart:
        for y3 in bdcart:
            for y4 in bdcart:
                for y5 in bdcart:
                    Y = RoutingMatrix(1, 5, [y1, y2, y3, y4, y5], cast=WidestShortest)
                    if (Y == Y*A + B and X != Y):
                        print("Y\n" + str(Y))
                        if ((X+Y) != (X+Y)*A + B):
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
