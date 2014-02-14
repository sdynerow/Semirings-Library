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

DVALUES = { 0.0 : "P" , 0.2 : "U" , 0.5 : "V" , 0.8 : "W" , 1.0 : "Q" }

class Diamond(Semiring):
    zeroElt = 0.0
    unitElt = 1.0

    def __add__(self, other):
        if(self.elt == Diamond.unitElt or other.elt == Diamond.unitElt):
            return Diamond(Diamond.unitElt)
        if(self.elt == Diamond.zeroElt or other.elt == Diamond.zeroElt):
            return Diamond(max(self.elt, other.elt))
        if(self.elt == other.elt):
            return Diamond(self.elt)
        if(self.elt != other.elt):
            return Diamond(Diamond.zeroElt)

    def __mul__(self, other):
        if(self.elt == Diamond.unitElt or other.elt == Diamond.unitElt):
            return Diamond(min(self.elt, other.elt))
        if(self.elt == Diamond.zeroElt or other.elt == Diamond.zeroElt):
            return Diamond(Diamond.zeroElt)
        if(self.elt == other.elt):
            return Diamond(self.elt)
        if(self.elt != other.elt):
            return Diamond(Diamond.unitElt)

    def __lmul__(self, other):
        # Do something with self.elt and other.elt
        return NotImplemented

    def __rmul__(self, other):
        # Do something with self.elt and other.elt
        return NotImplemented

    def __le__(self, other):
        # Test something using self.elt and other.elt
        return NotImplemented

    def __repr__(self):
        return str(DVALUES[self.elt])
