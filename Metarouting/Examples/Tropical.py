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

from Metarouting.Algebra.Matrix import *

from Metarouting.Policy.Tropical import *

from Metarouting.Algorithms.Dijkstra import *
from Metarouting.Algorithms.Bellman import *

from Metarouting.Utils.GraphViz import *

I = Tropical.INF

m = Matrix(4, 4, [I,1,2,4,
                  1,I,2,4,
                  2,2,I,1,
                  4,4,1,I], cast=Tropical)

m2 = Matrix(4, 4, [I,1,2,4,
                   1,I,2,4,
                   2,2,I,1,
                   4,4,1,I], cast=Tropical)

print "Input matrix:\n" + str(m) + "\n"

llo = m.leftLocalOptimum()
rlo = m.rightLocalOptimum()

print "LLO:\n" + str(llo) + "\n"
print "RLO:\n" + str(rlo) + "\n"

(pi1,nh1) = dijkstra(m, 1)
(pi2,nh2) = dijkstra(m, 2)
(pi3,nh3) = dijkstra(m, 3)
(pi4,nh4) = dijkstra(m, 4)

print "Dijkstra [s=1]: pi: " + str(pi1) + " nh: " + nhStr(nh1)
print "Dijkstra [s=2]: pi: " + str(pi2) + " nh: " + nhStr(nh2)
print "Dijkstra [s=3]: pi: " + str(pi3) + " nh: " + nhStr(nh3)
print "Dijkstra [s=4]: pi: " + str(pi4) + " nh: " + nhStr(nh4) + "\n"

#generateDotCode("tropical-dijkstra-n4", m, 1, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])
#generateDotCode("tropical-dijkstra-n4", m, 2, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])
#generateDotCode("tropical-dijkstra-n4", m, 3, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])
#generateDotCode("tropical-dijkstra-n4", m, 4, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])

(pi1,nh1) = bellman(m, 1)
(pi2,nh2) = bellman(m, 2)
(pi3,nh3) = bellman(m, 3)
(pi4,nh4) = bellman(m, 4)

print "Bellman  [s=1]: pi: " + str(pi1) + " nh: " + nhStr(nh1)
print "Bellman  [s=2]: pi: " + str(pi2) + " nh: " + nhStr(nh2)
print "Bellman  [s=3]: pi: " + str(pi3) + " nh: " + nhStr(nh3)
print "Bellman  [s=4]: pi: " + str(pi4) + " nh: " + nhStr(nh4)

#generateDotCode("tropical-bellman-n4", m, 1, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])
#generateDotCode("tropical-bellman-n4", m, 2, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])
#generateDotCode("tropical-bellman-n4", m, 3, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])
#generateDotCode("tropical-bellman-n4", m, 4, [(pi1,nh1),(pi2,nh2),(pi3,nh3),(pi4,nh4)])

