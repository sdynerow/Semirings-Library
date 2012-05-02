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

class RoutingMatrix(Matrix):
    def __add__(self, other):
        if (self.rowCnt == other.rowCnt and self.colCnt == other.colCnt):
            return RoutingMatrix(self.rowCnt, self.colCnt, map(lambda a,b: a + b, self.elts, other.elts))
        else:
            raise ValueError("Incompatible matrix sizes.")

    #    A         B         C
    # +-   -+   +-   -+   +-   -+
    # | --- |   | --- |   | --- |    Lin. comb. of rows of B using components of rows of A as coefficients
    # |     | x | --- | = |     | => More visible why successive powers of adjacency matrix is the way to go
    # |     |   | --- |   |     |    
    # +-   -+   +-   -+   +-   -+
    def __mul__(self, other):
        if(other.__class__ == RoutingMatrix):
            if(self.colCnt == other.rowCnt):
                newElts = []
                iRange = range(self.rowCnt)
                jRange = range(other.colCnt)
                kRange = range(self.colCnt)
                for i in iRange:
                    for j in jRange:
                        newElts.append(reduce(lambda a, b: a + b, [self(i,k) * other(k,j) for k in kRange]));
                return RoutingMatrix(self.rowCnt, other.colCnt, newElts)
            else:
                raise ValueError("Incompatible matrix sizes.")
        elif (self.type == other.__class__):
            return RoutingMatrix(self.rowCnt, self.colCnt, map(lambda a: a * other, self.elts))
        else:
            return NotImplemented

    def leftLocalOptimum(self, iterBnd = None, row = None, initL = None):
        # Solving L = AL + I
        n = self.order()
        if (initL == None):
            initL = RoutingMatrix.unit(self.type, n, row = row)
        prevL = initL
        currL = (self * initL) + initL
        iterCnt = 0
        if (iterBnd == None):
            iterBnd = 2 * n
        while (currL != prevL and iterCnt < iterBnd):
            prevL = currL
            currL = (self * currL) + initL
            iterCnt += 1
        return currL

    def rightLocalOptimum(self, iterBnd = None, row = None, initR = None):
        # Solving R = RA + I
        n = self.order()
        if (initR == None):
            initR = RoutingMatrix.unit(self.type, n, row = row)
        prevR = initR
        currR = (initR * self) + initR
        iterCnt = 0
        if (iterBnd == None):
            iterBnd = 2 * n
        while(currR != prevR and iterCnt < iterBnd):
            prevR = currR
            currR = (currR * self) + initR
            iterCnt += 1
        return currR

    @staticmethod
    def unit(eltype, n, row = None):
        if(n > 0):
            ijRange = range(n)
            if(row == None):
                es = []
                for i in ijRange:
                    for j in ijRange:
                        if(i != j):
                            es.append(eltype.zero())
                        else:
                            es.append(eltype.unit())
                return RoutingMatrix(n, n, es)
            elif (0 <= row and row < n):
                es = []
                for i in ijRange:
                    if(i != row):
                        es.append(eltype.zero())
                    else:
                        es.append(eltype.unit())
                return RoutingMatrix(1, n, es)
