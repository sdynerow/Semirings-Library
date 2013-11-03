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

def neighbors(G, T, i):
    neigh = list()
    for j in T:
        print G(i,j)
        if (not G(i,j).isZero()):
            neigh.append(j)
    return neigh

def predecessors(G, T, i):
    pred = list()
    for j in T:
        if (not G(j,i).isZero()):
            pred.append(j)
    return pred
    
def dijkstraR(G, s):
    # Solving R = RA + R
    # Computing the s-th row vector of R*
    n = G.order()
    pi = RoutingMatrix.unit(G.type, n, row = s)
    nh = n * [0]
    T = range(1,n+1)
    while(len(T) > 0):
        q = argmax(G.type, T, pi)
        if(q == -1):
            break
        T.remove(q)
        for d in range(1,n+1):#neighbors(G, T, q):
            alt = pi[q] * G(q,d)
            if (pi[d] < alt):
                pi[d] = alt
                nh[d-1] = q
    return (pi, nh)

def dijkstraL(G, d):
    # Solving L = AL + L
    # Computing the d-th column vector of L*
    n = G.order()
    pi = RoutingMatrix.unit(G.type, n, row = d)
    ph = n * [0]
    T = range(n)
    while(len(T) > 0):
        q = argmax(G.type, T, pi)
        if(q == -1):
            break
        T.remove(q)
        for s in predecessors(G, T, q):
            alt = G(s,q) * pi[q]
            if (pi[s] < alt):
                pi[s] = alt
                ph[s] = q+1
    return (pi, ph)

# Source-based forwarding (list of hops stored at the source)
def dijkstraNDR(G, s):
    # Solving R = R*A + I
    n = G.order()
    pi = RoutingMatrix.unit(G.type, n, row = s)
    nh = list()
    i = 0
    while (i < n):
        nh.append(list())
        i += 1
    nh[s].append(s+1)
    T = range(n)
    while(len(T) > 0):
        q = argmax(G.type, T, pi)
        if(q == -1):
            break
        T.remove(q)
        for d in neighbors(G, T, q):
            alt = pi[q] * G(q,d)
            if (pi[d] < alt):
                pi[d] = alt
                nh[d] = list(nh[q])
                nh[d].append(d+1)
    return (pi, nh)

# Source-based forwarding (list of hops stored at the source)
def dijkstraNDL(G, s):
    # Solving L = A*L + I
    n = G.order()
    pi = RoutingMatrix.unit(G.type, n, row = s)
    ph = list()
    i = 0
    while (i < n):
        ph.append(list())
        i += 1
    ph[s].append(s+1)
    T = range(n)
    while(len(T) > 0):
        q = argmax(G.type, T, pi)
        if(q == -1):
            break
        T.remove(q)
        for s in predecessors(G, T, q):
            alt = G(s,q) * pi[q]
            if (pi[s] < alt):
                pi[s] = alt
                ph[s] = list(ph[q])
                ph[s].append(s+1)
    return (pi, ph)

dijkstra = dijkstraR
dijkstraND = dijkstraNDR

# Endpoints-based forwarding (forwarding table with previous-hop consideration)
def dijkstraPHD(G, s):
    # Solving R = R*A + I
    n = G.order()
    pi = RoutingMatrix.unit(G.type, n, row = s)
    nRange = range(n)
    nh = list()
    for i in nRange:
        nh.append(list())
    nh[s].append(s)
    T = nRange
    while(len(T) > 0):
        q = argmax(G.type, T, pi)
        if(q == -1):
            break
        T.remove(q)
        for d in neighbors(G, T, q):
            alt = pi[q] * G(q,d)
            if (pi[d] < alt):
                pi[d] = alt
                nh[d] = list(nh[q])
                nh[d].append(d)
    return (pi, nh)
