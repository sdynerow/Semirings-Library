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

class Direct(Semiring):
    def __add__(self, other):
        (s1, t1) = self.elt
        (s2, t2) = other.elt
        return Direct( (s1+s2,t1+t2) )

    def __mul__(self, other):
        (s1, t1) = self.elt
        (s2, t2) = other.elt
        return Direct( (s1*s2,t1*t2) )

    def __le__(self, other):
        (s1, t1) = self.elt
        (s2, t2) = other.elt
        return (s1 <= s2 and t1 <= t2)

    def __repr__(self):
        (s,t) = self.elt
        return "(" + s.__repr__() + "," + t.__repr__() + ")"        

class Lexicographic(Semiring):
    @mixedmethod
    def __mul__(self, cls, other):
        (s1, t1) = self.elt
        (s2, t2) = other.elt
        return cls( (s1*s2, t1*t2) )

    def __le__(self, other):
        (s1, t1) = self.elt
        (s2, t2) = other.elt
        return (s1 < s2 or (s1 == s2 and t1 <= t2))

    def __getitem__(self, i):
        return self.elt[i]

    def __repr__(self):
        (s,t) = self.elt
        return "(" + s.__repr__() + "," + t.__repr__() + ")"

class LeftLexicographic(Lexicographic):
    @mixedmethod
    def __add__(self, cls, other):
        (s1, t1) = self.elt
        (s2, t2) = other.elt
        sSum = s1 + s2
        if (s1 == sSum and sSum == s2):
            return cls( (sSum, t1 + t2) )
        elif (s1 == sSum and sSum != s2):
            return cls( (s1, t1) )
        elif (s1 != sSum and sSum == s2):
            return cls( (s2, t2))
        else: #(s1 != sSum and sSum != s2)
            return cls( (sSum, t1.__class__.zero()) )

class RightLexicographic(Lexicographic):
    def __add__(self, other):
        (s1, t1) = self.elt
        (s2, t2) = other.elt
        tSum = t1 + t2
        if (t1 == tSum and tSum == t2):
            return RightLexicographic( (s1+s2, tSum) )
        elif (t1 == tSum and tSum != t2):
            return RightLexicographic( (s1, t1) )
        elif (t1 != tSum and tSum == t2):
            return RightLexicographic( (s2, t2) )
        else: #(t1 != tSum and tSum != t2)
            return RightLexicographic( (s1.__class__.zero(), tSum) )

class Scoped(Semiring):
    INT = 0
    EXT = 1

    def __add__(self, other):
        (t1,s1,u1) = self.elt
        (t2,s2,u2) = other.elt
        if(t1 == Scoped.INT and t2 == Scoped.INT):
            return Scoped( (Scoped.INT, s1+s2, t1+t2) )
        elif(t1 == Scoped.INT and t2 == Scoped.EXT):
            sSum = s1+s2
            if(s1 != sSum and sSum == s2 and t1.isZero() and not t2.isZero()):
                return Scoped( (Scoped.EXT, s2, t2) )
            else:
                return Scoped( (Scoped.INT, s1, t1) )
        elif(t1 == Scoped.EXT and t2 == Scoped.INT):
            sSum = s1+s2
            if(s1 == sSum and sSum != s2 and not t1.isZero() and t2.isZero()):
                return Scoped( (Scoped.EXT, s1, t1) )
            else:
                return Scoped( (Scoped.INT, s2, t2) )
        else: #(t1 == Scoped.EXT and t2 == Scoped.EXT):
            # To be completed
            return Scoped( (Scoped.EXT, s1, t1) )

    def __mul__(self, other):
        (t1,s1,u1) = self.elt
        (t2,s2,u2) = other.elt
        if (t1 == Scoped.INT and t2 == Scoped.INT):
            return Scoped( (Scoped.INT, s1*s2, t1*t2) )
        elif(t1 == Scoped.INT and t2 == Scoped.EXT):
            return Scoped( (Scoped.EXT, s1*s2, t1*t2) )
        else:# (t1 == Scoped.EXT and t2 == Scoped.INT) or (t1 == Scoped.EXT and t2 == Scoped.EXT)
            return Scoped( (Scoped.EXT, s1*s2, t2 if t2.isZero() else t1) )

    def __le__(self, other):
        pass

    def __repr__(self, other):
        pass

class Tunnel(Semiring):
    # (s,o) with s (resp. o) the weight in the support (resp. overlay) network.

    def __add__(self, other):
        (o1, s1) = self.elt
        (o2, s2) = other.elt
        return Tunnel( (o1+o2, s1+s2) )

    def __mul__(self, other):
        (o1, s1) = self.elt
        (o2, s2) = other.elt
        sMul = s1 * s2
        if(sMul.isZero()):
            return Tunnel( (o1.__class__.zero(), sMul) )
        else:
            return Tunnel( (o1 * o2, sMul) )

    def __le__(self, other):
        pass

    def __repr__(self):
        (o,s) = self.elt
        return "(" + o.__repr__() + "," + s.__repr__() + ")"
