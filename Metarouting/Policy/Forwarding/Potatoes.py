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

from Metarouting.Algebra.Products import *
from Metarouting.Algebra.Semimodule import *

from functools import partial

class mixedmethod(object):
    def __init__(self, func):
        self.func = func
    def __get__(self, instance, cls):
        return partial(self.func, instance, cls)

class Potato(Semimodule):
    zeroElt = None

    @mixedmethod
    def __add__(self, cls, other):
        if(self.elt is None):
            return cls(other.elt)
        elif(other.elt is None):
            return cls(self.elt)
        else:
            return cls(self.elt + other.elt)

    @mixedmethod
    def __lmul__(self, cls, other):
        if(self.elt is None):
            return cls(None)
        else:
            s = self.elt[0]
            t = self.elt[1]
            return cls( self.elt.__class__((s*other,t)) )

    @mixedmethod
    def __rmul__(self, cls, other):
        if(self.elt is None):
            return cls(None)
        else:
            s = self.elt[0]
            t = self.elt[1]
            return cls( self.elt.__class__((other*s,t)) )

    def __repr__(self):
        if(self.elt is None):
            return "  I  "
        else:
            s = self.elt[0]
            t = self.elt[1]
            return "(" + str(s) + "," + str(t) + ")"

class HotPotato(Potato):
    def __init__(self, val, castS = None, castT = None):
        if(val is not None and castS is not None and castT is not None):
            (s,t) = val
            self.elt = LeftLexicographic( (castS(s), castT(t)) )
        else:
            self.elt = val

class ColdPotato(Potato):
    def __init__(self, val, castS = None, castT = None):
        if(val is not None and castS is not None and castT is not None):
            (s,t) = val
            self.elt = RightLexicographic( (castS(s), castT(t)) )
        else:
            self.elt = val
