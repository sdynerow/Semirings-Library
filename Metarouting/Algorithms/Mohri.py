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

from Metarouting.Algebra.Semiring import *
from Metarouting.Algebra.RoutingMatrix import *
from Metarouting.Utils.Utilities import *

def neighbors(G, n, i):
    neigh = list()
    for j in range(1,n+1):
        if (not G(i,j).isZero()):
            neigh.append(j)
    return neigh

# Algorithm from the Mohri Paper (2002), Semiring Frameworks and Algorithms
# for Shortest-Paths Distance Problems.
def mohri(G, s):
    n = G.order()
    w = r = RoutingMatrix.unit(G.type, n, row = s)
    S = [s]
    while (S != []):
        q = argmax(G.type, S, w)
        S.remove(q)
        rTmp = r[q]
        r[q] = G.type.zero()
        for d in neighbors(G, n, q):
            if (w[d] != w[d] + (rTmp * G(q,d))):
                w[d] = w[d] + (rTmp * G(q,d))
                r[d] = r[d] + (rTmp * G(q,d))
                if d in S:
                    S.append(d)
    return w
