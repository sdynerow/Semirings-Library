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

def bellmanR(G, s):
    # Solving R = R*A + I
    # Computing the s-th row vector of R*
    n = G.order()
    pi = RoutingMatrix.unit(G.type, n, row = s)
    # Next-hop vector
    nh = n * [0]

    k = 0
    while (k < n):
        q = 0
        while (q < n):
            d = 0
            while (d < n):
                alt = pi[q] * G(q,d)
                if (alt < pi[d]):
                    pi[d] = alt
                    nh[d] = q
                d += 1
            q += 1
        k += 1
    return (pi, nh)

def bellmanL(G, d):
    # Solving L = A*L + I
    # Computing the d-th column vector of L*
    n = G.order()
    pi = RoutingMatrix.unit(G.type, n, row = d)
    # Previous-hop vector
    ph = n * [0]

    k = 0
    while (k < n):
        q = 0
        while (q < n):
            s = 0
            while (s < n):
                alt = G(s,q) * pi[q]
                if (alt < pi[s]):
                    pi[s] = alt
                    ph[s] = q
                s += 1
            q += 1
        k += 1
    return (pi, ph)

bellman = bellmanR
