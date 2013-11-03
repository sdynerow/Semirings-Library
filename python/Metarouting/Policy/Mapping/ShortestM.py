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

from Metarouting.Algebra.Semimodule import *

from Metarouting.Policy.Routing.ShortestR import *

class ShortestM(Semimodule):
    zeroElt = 1 << 16
    unitElt = 0

    def __init__(self, val):
        self.elt = min(val, ShortestM.zeroElt)
    
    def __add__(self, other):
        return ShortestM( min(self.elt, other.elt) )

    def __lmul__(self, other):
        if(other.__class__ == ShortestR):
            return ShortestM( min(self.elt + other.elt, ShortestM.zeroElt) )
        else:
            return NotImplemented

    def __rmul__(self, other):
        if(other.__class__ == ShortestR):
            return ShortestM( min(self.elt + other.elt, ShortestM.zeroElt) )
        else:
            return NotImplemented

    def __le__(self, other):
        return (self.elt >= other.elt)

    def __repr__(self):
        if(self.elt == ShortestM.zeroElt):
            return "I"
        else:
            return self.elt.__repr__()
