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

from Metarouting.Algebra.Matrix import *
from Metarouting.Algebra.RoutingMatrix import *
from Metarouting.Algebra.MappingMatrix import *

from Metarouting.Policy.Routing.ShortestR import *
from Metarouting.Policy.Mapping.ShortestM import *

from Metarouting.Algorithms.APSP import *
from Metarouting.Algorithms.Mohri import *
from Metarouting.Algorithms.Bellman import *
from Metarouting.Algorithms.Dijkstra import *

R0 = ShortestR.zeroElt
R1 = ShortestR.unitElt
FI = ShortestM.zeroElt

m1 = RoutingMatrix(4, 4, [ R0, 1, 2, 4
                         , 1, R0, 2, 4
                         , 2,  2,R0, 1
                         , 4,  4, 1,R0], cast=ShortestR)

m2 = RoutingMatrix(5, 5, [ R0, 2, 1, 6, R0
                         , 2, R0, 5, R0, 4
                         , 1, 5, R0, 4, 3
                         , 6, R0, 4, R0, R0
                         , R0, 4, 3, R0, R0], cast=ShortestR)

mAsub = RoutingMatrix(4, 4, [ R0, 2, R0, 4
                            , 2, R0, 1, 3
                            , R0, 1, R0, 1
                            , 4, 3, 1, R0], cast=ShortestR)

mAsubstar = RoutingMatrix(5, 5, [ R1, 2, 3, 4, R0
                                , 2, R1, 1, 2, R0
                                , 3, 1, R1, 1, 1
                                , 4, 2, 1, R1, 3
                                , R0, R0, 1, 3, R0], cast=ShortestR)

mA = RoutingMatrix(5, 5, [ R0, 2, R0, 4, R0
                         , 2, R0, 1, 3, R0
                         , R0, 1, R0, 1, 1
                         , 4, 3, 1, R0, 3
                         , R0, R0, 1, 3, R0], cast=ShortestR)

print "Mohri's Way"

print str(mohri(mA, 1)) + "\n"
print str(mA.leftLocalOptimum()) + "\n"
print str(mA.rightLocalOptimum())

exit(0)

print "mAsub :\n" + str(mAsub)

llo = mAsub.leftLocalOptimum()
rlo = mAsub.rightLocalOptimum()

print "LLO (solution to L = (A ⊗ L) ⊕ I):\n" + str(llo)
print "RLO (solution to R = (R ⊗ A) ⊕ I):\n" + str(rlo)

print "mAsub* :\n" + str(mAsubstar)

llo = mAsubstar.leftLocalOptimum()
rlo = mAsubstar.rightLocalOptimum()

print "LLO (solution to L = (A ⊗ L) ⊕ I):\n" + str(llo)
print "RLO (solution to R = (R ⊗ A) ⊕ I):\n" + str(rlo)

exit(0)

print "Support network\n" + str(mA) +"\n"

llo = mA.leftLocalOptimum()
rlo = mA.rightLocalOptimum()

print "LLO (solution to L = (A ⊗ L) ⊕ I):\n" + str(llo) + "\n"
print "RLO (solution to R = (R ⊗ A) ⊕ I):\n" + str(rlo) + "\n"

exit(0)

solveAPSP(dijkstraL, "DijkstraL (D)", mA)
print
solveAPSP(dijkstraR, "DijkstraR (D)", mA)
print
solveAPSP(dijkstraND, "DijkstraL (ND)", mA)

f = MappingMatrix(5, 2, [ FI, FI
                        ,  3, FI
                        , FI, FI
                        , FI, 1
                        ,  2, 3], cast=ShortestM)

print "Input matrix:\n" + str(m2) + "\n"

print "Mapping matrix:\n" + str(f) + "\n"

llo = m2.leftLocalOptimum()
rlo = m2.rightLocalOptimum()

print "LLO (solution to L = (A ⊗ L) ⊕ I):\n" + str(llo) + "\n"
print "RLO (solution to R = (R ⊗ A) ⊕ I):\n" + str(rlo) + "\n"

print "LLO ⊠ F:\n" + str(llo * f) + "\n"
print "F ⊠ LLO:\n" + str(f.transpose() * llo) + "\n"

solveAPSP(dijkstraR, "DijkstraR ( D)", m2)
#print

#solveAPSP(dijkstraND, "DijkstraR (ND)", m3)
#print

#solveAPSP(bellman, "Bellman   ( D)", 4)
