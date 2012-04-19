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
from Metarouting.Algebra.Matrix import *
from Metarouting.Utils.Utilities import *

def neighbors(G, T, i):
    neigh = list()
    for j in T:
        if (not G(i,j).isZero()):
            neigh.append(j)
    return neigh

def dijkstra(G, s):
    n = G.order()
    pi = Matrix.unit(G.type, n, row = s)
    nh = n * [0]
    T = range(1,n+1)
    while(len(T) > 0):
        (i, select) = argmax(G.type, T, pi)
        T.remove(i)
        for j in neighbors(G, T, i):
            alt = G(j,i) * pi[i]
            if (alt < pi[j]):
                pi[j] = alt
                nh[j-1] = i
    return (pi, nh)
