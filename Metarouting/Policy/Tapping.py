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

class VL(Semiring):
    zeroElt = 0
    unitElt = 1 << 7

    def __init__(self, val):
        self.elt = val

    def __add__(self, fles):
        return VL(self.elt)
    
    def __le__(self, fles):
        return True

    def __repr__(self):
        if(self.elt == VL.zeroElt):
            return "x"
        else:
            return self.elt.__repr__()

class VLR(VL):
    def __mul__(self, fles):
        return VLR(fles.elt)

class VLL(VL):
    def __mul__(self, fles):
        return VLL(self.elt)

class VU(Semiring):
    zeroElt = set()
    unitElt = set(range(1,256))

    def __init__(self, val):
        self.elt = val

    def __add__(self, fles):
        return self.elt | fles.elt

    def __le__(self, fles):
        return self.elt <= fles.elt

    def __repr__(self):
        return self.elt.__repr__()

class VUL(VU):
    def __mul__(self, fles):
        return self.elt

class VUR(VU):
    def __mul__(self, fles):
        return fles.elt    
