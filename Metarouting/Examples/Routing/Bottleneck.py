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

from Metarouting.Algebra.RoutingMatrix import *

from Metarouting.Policy.Routing.Bottleneck import *

from Metarouting.Algorithms.Dijkstra import *
from Metarouting.Algorithms.APSP import *

m = RoutingMatrix(4, 4, [ 0, 1, 2, 3
                        , 1, 0, 2, 3
                        , 2, 2, 0, 1
                        , 3, 3, 1, 0], cast=Bottleneck)

print "Input matrix:\n" + str(m) + "\n"

llo = m.leftLocalOptimum()
rlo = m.rightLocalOptimum()

print "LLO:\n" + str(llo) + "\n"
print "RLO:\n" + str(rlo) + "\n"

solveAPSP(dijkstraR, "DijkstraR", m)
