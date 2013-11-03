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

from Metarouting.Policy.Routing.ShortestR import *

class OSPF(Semimodule):
    zeroElt = None

    def __init__(self, val, squeeze = None):
        if(squeeze is not None and val is not None):
            ((t,u),s) = val
            self.elt = LeftLexicographic( (LeftLexicographic( (ShortestR(t),squeeze(u)) ), ShortestR(s)) )
        else:
            self.elt = val

    def __add__(self, other):
        if (self.elt is None):
            return OSPF(other.elt)
        elif (other.elt is None):
            return OSPF(self.elt)
        else:
            return OSPF(self.elt + other.elt)

    def __lmul__(self, other):
        if(self.elt is None or other.isZero()):
            return OSPF(None)
        else:
            ((t,u),s) = self.elt
            return OSPF( LeftLexicographic( (LeftLexicographic((t,u)), s*other)) )

    def __rmul__(self, other):
        if(self.elt is None or other.isZero()):
            return OSPF(None)
        else:
            ((t,u),s) = self.elt
            return OSPF( LeftLexicographic( (LeftLexicographic((t,u)), other*s)) )

    def __repr__(self):
        if (self.elt is None):
            return "    I    "
        else:
            return self.elt.__repr__()



