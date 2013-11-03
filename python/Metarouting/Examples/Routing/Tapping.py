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

from Metarouting.Policy.Routing.ShortestR import *
from Metarouting.Policy.Routing.WidestShortest import *
from Metarouting.Policy.Routing.Tapping import *

from Metarouting.Algorithms.APSP import *
from Metarouting.Algorithms.Bellman import *
from Metarouting.Algorithms.Dijkstra import *

R0 = ShortestR.zeroElt

mSP = RoutingMatrix(5, 5, [ (R0, 'a'), ( 1, 'a'), (R0, 'a'), ( 2, 'a'), ( 6, 'a')
                          , ( 1, 'b'), (R0, 'b'), ( 3, 'b'), ( 5, 'b'), ( 4, 'b')
                          , (R0, 'c'), ( 3, 'c'), (R0, 'c'), ( 4, 'c'), (R0, 'c')
                          , ( 2, 'd'), ( 5, 'd'), ( 4, 'd'), (R0, 'd'), (R0, 'd')
                          , ( 6, 'e'), ( 4, 'e'), (R0, 'e'), (R0, 'e'), (R0, 'e')], cast=TappingSP)

W0 = WidestShortest.zeroElt
mWS = RoutingMatrix(5, 5, [ (( 0,W0), '1'), ((5, 1), '1'), ((0,W0), '1'), ((0,W0), '1'), (( 0,W0), '1')
                          , (( 0,W0), '2'), ((0,W0), '2'), ((0,W0), '2'), ((0,W0), '2'), (( 0,W0), '2')
                          , (( 0,W0), '3'), ((5, 4), '3'), ((0,W0), '3'), ((5, 1), '3'), (( 0,W0), '3')
                          , (( 5, 1), '4'), ((0,W0), '4'), ((0,W0), '4'), ((0,W0), '4'), ((10, 1), '4')
                          , ((10, 5), '5'), ((0,W0), '5'), ((5, 1), '5'), ((0,W0), '5'), (( 0,W0), '5')], cast=TappingWSP)

mNH = RoutingMatrix(5, 5, [ (R0, 'a'), ( 1, 'b'), (R0, 'c'), ( 2, 'd'), ( 6, 'e')
                          , ( 1, 'a'), (R0, 'b'), ( 3, 'c'), ( 5, 'd'), ( 4, 'e')
                          , (R0, 'a'), ( 3, 'b'), (R0, 'c'), ( 4, 'd'), (R0, 'e')
                          , ( 2, 'a'), ( 5, 'b'), ( 4, 'c'), (R0, 'd'), (R0, 'e')
                          , ( 6, 'a'), ( 4, 'b'), (R0, 'c'), (R0, 'd'), (R0, 'e')], cast=TappingNH)

mWSNH = RoutingMatrix(5, 5, [ (( 0,W0), '1'), ((5, 1), '2'), ((0,W0), '3'), ((0,W0), '4'), (( 0,W0), '5')
                            , (( 0,W0), '1'), ((0,W0), '2'), ((0,W0), '3'), ((0,W0), '4'), (( 0,W0), '5')
                            , (( 0,W0), '1'), ((5, 4), '2'), ((0,W0), '3'), ((5, 1), '4'), (( 0,W0), '5')
                            , (( 5, 1), '1'), ((0,W0), '2'), ((0,W0), '3'), ((0,W0), '4'), ((10, 1), '5')
                            , ((10, 5), '1'), ((0,W0), '2'), ((5, 1), '3'), ((0,W0), '4'), (( 0,W0), '5')], cast=TappingWSPNH)

print "A :\n" + str(mSP) + "\n"

llo = mSP.leftLocalOptimum()
rlo = mSP.rightLocalOptimum()

print "LLO (solution to L = (A ⊗ L) ⊕ I):\n" + str(llo)
print "RLO (solution to R = (R ⊗ A) ⊕ I):\n" + str(rlo)

exit(0)

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
