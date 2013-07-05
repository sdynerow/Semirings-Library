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
from Metarouting.Algebra.Products import *

from Metarouting.Policy.Routing.ShortestR import *

class ShortestOnShortest(Tunnel):
    zeroElt = (ShortestR.zeroElt, ShortestR.zeroElt)
    unitElt = (ShortestR.unitElt, ShortestR.unitElt)

    def __init__(self, val):
        (s,t) = val
        if(s.__class__ != ShortestR):
            s = ShortestR(s)
        if(t.__class__ != ShortestR):
            t = ShortestR(t)
        self.elt = (s,t)

    def __repr__(self):
        return self.elt.__repr__()
