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

class Matrix(Semiring):
    def __init__(self, rc, cc, es, cast = None):
        if(rc > 0 and cc > 0 and (rc * cc == len(es))):
            self.rowCnt = rc # row count is the col dimension
            self.colCnt = cc # col count is the row dimension
            if (cast == None):
                self.elts = es
                self.type = es[0].__class__
            else:
                self.elts = map(cast, es)
                self.type = cast
        else:
            raise ValueError("Invalid matrix elements array.")

    def __add__(self, other):
        if (self.rowCnt == other.rowCnt and self.colCnt == other.colCnt):
            return Matrix(self.rowCnt, self.colCnt, map(lambda a,b: a + b, self.elts, other.elts))
        else:
            raise ValueError("Incompatible matrix sizes.")

    #    A         B         C
    # +-   -+   +-   -+   +-   -+
    # | --- |   | --- |   | --- |    Lin. comb. of rows of B using components of rows of A as coefficients
    # |     | x | --- | = |     | => More visible why successive powers of adjacency matrix is the way to go
    # |     |   | --- |   |     |    
    # +-   -+   +-   -+   +-   -+
    def __mul__(self, other):
        if(other.__class__ == Matrix):
            if(self.colCnt == other.rowCnt):
                newElts = []
                iRange = range(1, self.rowCnt+1)
                jRange = range(1, other.colCnt+1)
                kRange = range(1, self.colCnt+1)
                for i in iRange:
                    for j in jRange:
                        newElts.append(reduce(lambda a, b: a + b, [self(i,k) * other(k,j) for k in kRange]));
                return Matrix(self.rowCnt, other.colCnt, newElts)
            else:
                raise ValueError("Incompatible matrix sizes.")
        elif (self.type == other.__class__):
            return Matrix(self.rowCnt, self.colCnt, map(lambda a: a * other, self.elts))
        else:
            return NotImplemented

    def __rmul__(self, other):
        if(self.type == other.__class__):
            return Matrix(self.rowCnt, self.colCnt, map(lambda a: other * a, self.elts))
        else:
            return NotImplemented

    def __le__(self, other):
        raise NotImplementedError("Canonical preorder relation not specified.")        

    def __lt__(self, other):
        return (self <= other and self != other)

    def __ge__(self, other):
        return (other <= self)

    def __gt__(self, other):
        return (other < self)

    def __eq__(self, other):
        return (self.type == other.type and
                self.rowCnt == other.rowCnt and
                self.colCnt == self.colCnt and
                self.elts == other.elts)

    def __ne__(self, other):
        return (not self.elts == other.elts)

    def __repr__(self):
        result = ""
        iRange = range(1, self.rowCnt+1)
        jRange = range(1, self.colCnt+1)
        if(self.rowCnt > 1):
            hdr = "|"
            ftr = "|"
        else:
            hdr = "["
            ftr = "]"
        for i in iRange:
            result += hdr
            for j in jRange:
                result += str(self(i,j))
                if(j < self.colCnt):
                    result += " "
                else:
                    result += ftr
            if (i < self.rowCnt):
                result += "\n"
        return result

    def __getitem__(self, i):
        if ((self.rowCnt == 1 and 1 <= i and i <= self.colCnt) or (self.colCnt == 1 and 1 <= i and i <= self.rowCnt)):
            return self.elts[i-1]
        else:
            raise ValueError("Computer says 'no'")

    def __setitem__(self, i, v):
        if ((self.rowCnt == 1 and 1 <= i and i <= self.colCnt) or (self.colCnt == 1 and 1 <= i and i <= self.rowCnt)):
            self.elts[i-1] = v
        else:
            raise ValueError("Computer says 'no'")

    def __call__(self, i, j):
        if (1 <= i and i <= self.rowCnt and 1 <= j and j <= self.colCnt):
            return self.elts[(i-1) * self.colCnt + (j-1)]

    def order(self):
        if(self.rowCnt == self.colCnt):
            return self.rowCnt
        else:
            raise ValueError("Matrix is not square")

    def transpose(self):
        es = []
        iRange = range(self.rowCnt)
        jRange = range(self.colCnt)
        for j in jRange:
            for i in iRange:
                es.append(self.elts[i * self.colCnt + j])
        return Matrix(self.colCnt, self.rowCnt, es)

    def __pow__(self, p):
        rPow = p
        res = Matrix.unit(self.eltype, self.order())
        while(rPow > 0):
            res = res * self
            rPow -= 1
        return res

    def leftLocalOptimum(self, iterBnd = None, row = None):
        # Solving X = AX + I
        n = self.order()
        initX = Matrix.unit(self.type, n, row = row)
        prevX = initX
        currX = (self * initX) + initX
        iterCnt = 0
        if(iterBnd == None):
            iterBnd = 2 * n
        while(currX != prevX and iterCnt < iterBnd):
            prevX = currX
            currX = (self * currX) + initX
            iterCnt += 1
        return currX

    def rightLocalOptimum(self, iterBnd = None, row = None):
        # Solving Y = YA + I
        n = self.order()
        initY = Matrix.unit(self.type, n, row = row).transpose()
        prevY = initY
        currY = (initY * self) + initY
        iterCnt = 0
        if(iterBnd == None):
            iterBnd = 2 * n
        while(currY != prevY and iterCnt < iterBnd):
            prevY = currY
            currY = (currY * self) + initY
            iterCnt += 1
        return currY

    @staticmethod
    def unit(eltype, n, row = None):
        if(n > 0):
            iRange = range(1, n+1)
            jRange = range(1, n+1)
            if(row == None):
                es = []
                for i in iRange:
                    for j in jRange:
                        if(i != j):
                            es.append(eltype.zero())
                        else:
                            es.append(eltype.unit())
                return Matrix(n, n, es)
            elif (1 <= row and row <= n):
                es = []
                for i in iRange:
                    if(i != row):
                        es.append(eltype.zero())
                    else:
                        es.append(eltype.unit())
                return Matrix(1, n, es)

    @staticmethod
    def zero(eltype, n):
        return Matrix(n, n, (n*n)*[eltype.zero()])
