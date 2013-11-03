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
from Metarouting.Algebra.ForwardingMatrix import *

from Metarouting.Policy.Routing.ShortestR import *
from Metarouting.Policy.Routing.Bottleneck import *
from Metarouting.Policy.Forwarding.OSPF import *

from Metarouting.Algorithms.Dijkstra import *
from Metarouting.Algorithms.APSP import *

def toOSPF(v):
    return OSPF( v, squeeze=Bottleneck )

SI = ShortestR.zeroElt
BI = Bottleneck.unitElt

a = RoutingMatrix(5, 5, [ SI,  2,  1,  6, SI
                        ,  2, SI,  5, SI,  4
                        ,  1,  5, SI,  4,  3
                        ,  6, SI,  4, SI, SI
                        , SI,  4,  3, SI, SI], cast=ShortestR)

m0 = ForwardingMatrix(5, 2, [ None, None
                            , None, None
                            , None, None
                            , None, None
                            , ((0,BI),2), None], cast=toOSPF)

m1 = ForwardingMatrix(5, 2, [ None, None
                            , ((1,BI),3), None
                            , None, None
                            , None, None
                            , ((1,BI),17), None], cast=toOSPF)

m2 = ForwardingMatrix(5, 2, [ None, None
                            , ((2,40),0), None
                            , None, None
                            , None, ((2,10),0)
                            , ((2,10),0), ((2,20),0)], cast=toOSPF)

f = m0 + m1 + m2

print "Input matrix:\n" + str(a) + "\n"

print "Mapping matrix:\n" + str(f) + "\n"

rlo = a.rightLocalOptimum()

print "RLO (solution to R = (R ⊗ A) ⊕ I):\n" + str(rlo) + "\n"

print "RLO ⊠ F:\n" + str(rlo * f)
