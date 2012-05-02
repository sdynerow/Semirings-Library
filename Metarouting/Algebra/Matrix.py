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
from functools import partial

class mixedmethod(object):
    def __init__(self, func):
        self.func = func
    def __get__(self, instance, cls):
        return partial(self.func, instance, cls)
        
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

    @mixedmethod
    def __add__(self, cls, other):
        if (self.rowCnt == other.rowCnt and self.colCnt == other.colCnt):
            return cls(self.rowCnt, self.colCnt, map(lambda a,b: a + b, self.elts, other.elts))
        else:
            raise ValueError("Incompatible matrix sizes.")

    def __le__(self, other):
        raise NotImplementedError("Canonical preorder relation not specified.")        

    def __eq__(self, other):
        return (self.type == other.type and
                self.rowCnt == other.rowCnt and
                self.colCnt == self.colCnt and
                self.elts == other.elts)

    def __ne__(self, other):
        return (not self == other)

    def __repr__(self):
        result = ""
        iRange = range(self.rowCnt)
        jRange = range(self.colCnt)
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
                if(j < self.colCnt-1):
                    result += " "
                else:
                    result += ftr
            if (i < self.rowCnt-1):
                result += "\n"
        return result

    def __getitem__(self, i):
        if ((self.rowCnt == 1 and 0 <= i and i < self.colCnt) or (self.colCnt == 1 and 0 <= i and i < self.rowCnt)):
            return self.elts[i]
        else:
            raise ValueError("Computer says 'no'")

    def __setitem__(self, i, v):
        if ((self.rowCnt == 1 and 0 <= i and i < self.colCnt) or (self.colCnt == 1 and 0 <= i and i < self.rowCnt)):
            self.elts[i] = v
        else:
            raise ValueError("Computer says 'no'")

    def __call__(self, i, j):
        if (0 <= i and i < self.rowCnt and 0 <= j and j < self.colCnt):
            return self.elts[i * self.colCnt + j]

    def order(self):
        if(self.rowCnt == self.colCnt):
            return self.rowCnt
        else:
            raise ValueError("Matrix is not square")

    @mixedmethod
    def transpose(self, cls):
        es = []
        iRange = range(self.rowCnt)
        jRange = range(self.colCnt)
        for j in jRange:
            for i in iRange:
                es.append(self.elts[i * self.colCnt + j])
        return cls(self.colCnt, self.rowCnt, es)

    @mixedmethod
    def __pow__(self, p):
        rPow = p
        res = cls.unit(self.eltype, self.order())
        while(rPow > 0):
            res = res * self
            rPow -= 1
        return res

    @classmethod
    def zero(eltype, r, c):
        return cls(r, c, (r*c)*[eltype.zero()])
