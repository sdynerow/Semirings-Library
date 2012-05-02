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
from Metarouting.Algorithms.Bellman import *
from Metarouting.Algorithms.Dijkstra import *

RI = ShortestR.zeroElt
FI = ShortestM.zeroElt

m1 = RoutingMatrix(4, 4, [ RI, 1, 2, 4
                         , 1, RI, 2, 4
                         , 2,  2,RI, 1
                         , 4,  4, 1,RI], cast=ShortestR)

m2 = RoutingMatrix(5, 5, [ RI, 2, 1, 6, RI
                         , 2, RI, 5, RI, 4
                         , 1, 5, RI, 4, 3
                         , 6, RI, 4, RI, RI
                         , RI, 4, 3, RI, RI], cast=ShortestR)

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
