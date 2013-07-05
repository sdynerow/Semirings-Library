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

from Metarouting.Policy.Routing.ShortestR import *
from Metarouting.Policy.Routing.Bottleneck import *
from Metarouting.Policy.Routing.WidestShortest import *

class TappingSP(Semiring):
    zeroElt = (ShortestR.zeroElt, '-')
    unitElt = (ShortestR.unitElt, '-')

    def __init__(self, val):
        (w,r) = val
        self.elt = (ShortestR(w), r)

    def __repr__(self):
        (w,r) = self.elt
        return "(" + str(w) + ", " + str(r) + ")"

    def __le__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        return (w1 <= w2)

    def __add__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        if (w1 <= w2): # Remember, <= is actually >= (or the other way around ...)
            return TappingSP( (w2.elt, r2) )
        else:
            return TappingSP( (w1.elt, r1) )

    def __mul__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        return TappingSP ( (w1.elt+w2.elt, r2) )

class TappingNH(Semiring):
    zeroElt = (ShortestR.zeroElt, '-')
    unitElt = (ShortestR.unitElt, '-')

    def __init__(self, val):
        (w,r) = val
        self.elt = (ShortestR(w), r)

    def __repr__(self):
        (w,r) = self.elt
        return "(" + str(w) + ", " + str(r) + ")"

    def __le__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        return (w1 >= w2)

    def __add__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        if (w1 <= w2): # Remember, <= is actually >= (or the other way around ...)
            return TappingNH( (w2.elt, r2) )
        else:
            return TappingNH( (w1.elt, r1) )

    def __mul__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        if(w1.isUnit()):
            return TappingNH ( (w2.elt, r2) )
        else:
            return TappingNH ( (w1.elt+w2.elt, r1) )

class TappingWSP(Semiring):
    zeroElt = (WidestShortest.zeroElt, '-')
    unitElt = (WidestShortest.unitElt, '-')

    def __init__(self, val):
        (w,r) = val
        self.elt = (WidestShortest(w), r)

    def __repr__(self):
        (w,r) = self.elt
        return "(" + str(w) + ", " + str(r) + ")"

    def __le__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        return (w1 <= w2)

    def __add__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        wSum = w1 + w2
        if (w2 == wSum): # Remember, <= is actually >= (or the other way around ...)
            return TappingWSP( (w2.elt, r2) )
        else:
            return TappingWSP( (w1.elt, r1) )

    def __mul__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        return TappingWSP ( ((w1*w2).elt, r2) )

class TappingWSPNH(Semiring):
    zeroElt = (WidestShortest.zeroElt, '-')
    unitElt = (WidestShortest.unitElt, '-')

    def __init__(self, val):
        (w,r) = val
        self.elt = (WidestShortest(w), r)

    def __repr__(self):
        (w,r) = self.elt
        return "(" + str(w) + ", " + str(r) + ")"

    def __le__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        return (w1 <= w2)

    def __add__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        wSum = w1 + w2
        if (w2 == wSum): # Remember, <= is actually >= (or the other way around ...)
            return TappingWSPNH( (w2.elt, r2) )
        else:
            return TappingWSPNH( (w1.elt, r1) )

    def __mul__(self, other):
        (w1, r1) = self.elt
        (w2, r2) = other.elt
        (w1w, w1s) = w1.elt
        if(w1w.elt == Bottleneck.unitElt and w1s.elt == ShortestR.unitElt):
            return TappingWSPNH ( (w2.elt, r2) )
        else:
            return TappingWSPNH ( ((w1*w2).elt, r1) )
