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

class WidestShortest(Semiring):
    BINF = 1 << 8
    DINF = 1 << 16

    def __init__(self, val):
        (b, d) = val
        self.elt = (min(b, WidestShortest.BINF), min(d, WidestShortest.DINF))

    def __add__(self, other):
        (b1, d1) = self.elt
        (b2, d2) = other.elt
        if (b1 == b2):
            return WidestShortest( (b1, min(d1, d2)) )
        elif (b1 > b2):
            return self
        else:
            return other

    def __mul__(self, other):
        (b1, d1) = self.elt
        (b2, d2) = other.elt
        return WidestShortest( (min(b1, b2), min(d1 + d2, WidestShortest.DINF)) )

    def __le__(self, other):
        (b1, d1) = self.elt
        (b2, d2) = other.elt
        return (b1 < b2) or (b1 == b2 and d1 <= d2)

    def __repr__(self):
        (b, d) = self.elt
        return "(" + (str(b) if b < WidestShortest.BINF else "I") + "," + (str(d) if d < WidestShortest.DINF else "I") + ")"

    @staticmethod
    def zero():
        return WidestShortest( (0, WidestShortest.DINF) )

    @staticmethod
    def unit():
        return WidestShortest( (WidestShortest.BINF, 0) )

    @staticmethod
    def groundSet():
        return NotImplemented
        gs = list()
        i = 0
        while (i < WidestShortest.BINF):
            j = 0
            while (j < WidestShortest.DINF):
                gs.append(WidestShortest( (i, j) ))
                j += 1
            i += 1
        return gs
