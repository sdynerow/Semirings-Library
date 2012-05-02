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

from Metarouting.Algebra.RoutingMatrix import *

from Metarouting.Policy.Routing.BGP import *

from Metarouting.Algorithms.Dijkstra import *
from Metarouting.Algorithms.Bellman import *

def solveAPSP(algo, algoName, matrix):
    i = 0
    n = matrix.order()
    while(i < n):
        (pi, nh) = algo(matrix, i)
        print algoName + " [s=" + str(i) + "]: pi: " + str(pi) + " nh: " + nhStr(nh)
        i += 1

Z = BGP.zeroElt
U = BGP.unitElt
C = BGP.CUST
R = BGP.PEER
P = BGP.PROV

bRoutingMatrix = [ Z, R, P, Z, Z 
                 , R, Z, Z, Z, Z
                 , C, Z, Z, R, P
                 , Z, Z, R, Z, Z
                 , Z, Z, C, Z, Z]

m = RoutingMatrix (5, 5, bRoutingMatrix, cast=BGPt1)

print "Input matrix:\n" + str(m) + "\n"

llo = m.leftLocalOptimum()
rlo = m.rightLocalOptimum()

print "LLO:\n" + str(llo) + "\n"
print "RLO:\n" + str(rlo) + "\n"

solveAPSP(dijkstraR, "DijkstraR", m)
