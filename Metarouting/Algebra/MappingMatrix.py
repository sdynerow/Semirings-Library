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
from Metarouting.Algebra.RoutingMatrix import *

class MappingMatrix(Matrix):
    def __mul__(self, other):
        if(isinstance(other, RoutingMatrix)):
            return self.__lmul__(other)
        else:
            return NotImplemented

    def __lmul__(self, other):
        if(isinstance(other, RoutingMatrix)):
            if(self.colCnt == other.rowCnt):
                newElts = []
                iRange = range(self.rowCnt)
                jRange = range(other.colCnt)
                kRange = range(self.colCnt)
                for i in iRange:
                    for j in jRange:
                        newElts.append(reduce(lambda a, b: a + b, [self(i,k) * other(k,j) for k in kRange]));
                return MappingMatrix(self.rowCnt, other.colCnt, newElts)
            else:
                raise ValueError("Incompatible matrix sizes.")
        else:
            return NotImplemented

    def __rmul__(self, other):
        if(isinstance(other, RoutingMatrix)):
            if(self.rowCnt == other.colCnt):
                newElts = []
                iRange = range(other.rowCnt)
                jRange = range(self.colCnt)
                kRange = range(other.colCnt)
                for i in iRange:
                    for j in jRange:
                        tmp = list()
                        for k in kRange:
                            tmp.append(other(i,k) * self(k,j))
                        newElts.append(reduce(lambda a, b: a + b, tmp));
                return MappingMatrix(other.rowCnt, self.colCnt, newElts)
            else:
                raise ValueError("Incompatible matrix sizes.")
        else:
            return NotImplemented




