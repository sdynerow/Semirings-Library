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

class Semiring:
    zeroElt = None
    unitElt = None

    def __init__(self, val):
        self.elt = val

    def __add__(self, other):
        raise NotImplementedError("Additive law not implemented.")

    def __mul__(self, other):
        raise NotImplementedError("Multiplicative law not implemented.")

    def __le__(self, other): # <=
        raise NotImplementedError("Canonical preorder relation not specified.")        

    def __lt__(self, other): # <
        return (self <= other and self != other)

    def __ge__(self, other):
        return (other <= self)

    def __gt__(self, other):
        return (other < self)

    def __eq__(self, other):
        return (self.elt == other.elt)

    def __ne__(self, other):
        return (not self.elt == other.elt)

    # Representation related stuff
    def __repr__(self):
        raise NotImplementedError("Representation not specified.")

    # Power operator (not square-and-multiply)
    def __pow__(self, p):
        rPow = p
        res = self.unit()
        while(rPow > 0):
            res = res * self
            rPow -= 1
        return res

    def isZero(self):
        return self.elt == self.zeroElt

    def isUnit(self):
        return self.elt == self.unitElt

    @classmethod
    def zero(cls):
        return cls(cls.zeroElt)

    @classmethod
    def unit(cls):
        return cls(cls.unitElt)

