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

def bellman(G, s):
    n = G.order()
    pi = Matrix.unit(G.type, n, row = s)
    nh = n * [0]

    cnt = 0
    iRange = range(1, n+1)
    jRange = range(1, n+1)
    while(cnt < n):
        for i in iRange:
            for j in jRange:
                alt = pi[i] * G(i,j)
                if (alt < pi[j]):
                    pi[j] = alt
                    nh[j-1] = i
        cnt += 1
    for i in iRange:
        for j in jRange:
            if(pi[i] * G(i,j) < pi[j]):
                print "Graph contains a negative-weighted cycle"
    return (pi, nh)
