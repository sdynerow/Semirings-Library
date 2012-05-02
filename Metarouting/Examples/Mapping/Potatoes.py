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
from Metarouting.Algebra.MappingMatrix import *

from Metarouting.Policy.Routing.ShortestR import *
from Metarouting.Policy.Mapping.ShortestF import *
from Metarouting.Policy.Mapping.Potatoes import *

from Metarouting.Algorithms.Dijkstra import *
from Metarouting.Algorithms.APSP import *

def toHotPotato(v):
    return HotPotato(v, castS = ShortestR, castT = ShortestR)

def toColdPotato(v):
    return ColdPotato(v, castS = ShortestR, castT = ShortestR)

I = ShortestR.zeroElt
m = RoutingMatrix(5, 5, [ I, 2, 1, 6, I
                        , 2, I, 5, I, 4
                        , 1, 5, I, 4, 3
                        , 6, I, 4, I, I
                        , I, 4, 3, I, I], cast = ShortestR)

I = ShortestF.zeroElt
fSimple = MappingMatrix(5, 2, [ I, I 
                              , 3, I
                              , I, I
                              , I, 1
                              , 2, 3], cast = ShortestF)

fHot = MappingMatrix(5, 2, [  None,  None 
                           , (0,3),  None
                           ,  None,  None
                           ,  None, (0,1)
                           , (0,2), (0,3)], cast = toHotPotato)

fCold = MappingMatrix(5, 2, [  None,  None 
                            , (0,3),  None
                            ,  None,  None
                            ,  None, (0,1)
                            , (0,2), (0,3)], cast = toColdPotato)

print "Input matrix:\n" + str(m) + "\n"
print "Mapping matrix (SP):\n" + str(fSimple) + "\n"
print "Mapping matrix (HP):\n" + str(fHot) + "\n"
print "Mapping matrix (CP):\n" + str(fCold) + "\n"

rlo = m.rightLocalOptimum()
print "RLO [R = (R ⊗ A) ⊕ I]:\n" + str(rlo) + "\n"

print "Mapping matrix (SP) [RLO ⊠ F]:\n" + str(rlo * fSimple) + "\n"
print "Mapping matrix (HP) [RLO ⊠ F]:\n" + str(rlo * fHot) + "\n"
print "Mapping matrix (CP) [RLO ⊠ F]:\n" + str(rlo * fCold)

