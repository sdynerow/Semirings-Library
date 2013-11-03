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
    def __mul__(self, fles):
        if(isinstance(fles, RoutingMatrix)):
            return self.__lmul__(fles)
        else:
            return NotImplemented

    def __lmul__(self, fles):
        if(isinstance(fles, RoutingMatrix)):
            if(self.colCnt == fles.rowCnt):
                newElts = []
                iRange = range(1, self.rowCnt + 1)
                jRange = range(1, fles.colCnt + 1)
                kRange = range(1, self.colCnt + 1)
                for i in iRange:
                    for j in jRange:
                        newElts.append(reduce(lambda a, b: a + b, [self(i,k) * fles(k,j) for k in kRange]));
                return MappingMatrix(self.rowCnt, fles.colCnt, newElts)
            else:
                raise ValueError("Incompatible matrix sizes.")
        else:
            return NotImplemented

    def __rmul__(self, fles):
        if(isinstance(fles, RoutingMatrix)):
            if(self.rowCnt == fles.colCnt):
                newElts = []
                iRange = range(1, fles.rowCnt + 1)
                jRange = range(1, self.colCnt + 1)
                kRange = range(1, fles.colCnt + 1)
                for i in iRange:
                    for j in jRange:
                        tmp = list()
                        for k in kRange:
                            tmp.append(fles(i,k) * self(k,j))
                        newElts.append(reduce(lambda a, b: a + b, tmp));
                return MappingMatrix(fles.rowCnt, self.colCnt, newElts)
            else:
                raise ValueError("Incompatible matrix sizes.")
        else:
            return NotImplemented










