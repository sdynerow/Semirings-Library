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

from collections import deque

def updateColor(Sols, i, j):
    for s in Sols:
        if((s['src'] == i and s['dst'] == j) or (s['src'] == j and s['dst'] == i)):
            s['color'] = "red"
            return

def generateDotCode(fileprefix, M, src, Sols):
    # M: input adjacency matrix
    # S: rows of solution matrix along with next-hop information
    outFile = open(fileprefix + "-s" + str(src) + ".dot", 'w')
    outFile.write("graph network {\n")
    outFile.write("  node [ shape=circle ]\n")
    n = M.order()
    iRange = range(1, n+1)
    jRange = deque(iRange)
    solutions = list()
    for i in iRange:
        if(i != src):
            outFile.write("  node" + str(i) + "  [label=" + str(i) + "]\n")
        else:
            outFile.write("  node" + str(i) + "  [label=" + str(i) + ", shape=doublecircle]\n")
        for j in jRange:
            if(not M(i,j).isZero()):
                solutions.append(dict(src=i, dst=j, label=M(i,j), color="gray"))
        jRange.popleft()

    # Update color of selected edges
    ws = deque([src])
    ar = deque([])
    while(len(ws) > 0):
        cNode = ws.popleft()
        ar.append(cNode)
        (cPi, cNh) = Sols[cNode-1]
        for i in range(1, n+1):
            if(i != cNode and not i in ar):
                if (cNh[i-1] != 0 and cNh[i-1] != cNode):
                    updateColor(solutions, cNode, cNh[i-1])
                    #print str(cNode) + " -> " + str(i) + " via " + str(cNh[i-1])
                    ws.append(cNh[i-1])
                else:
                    updateColor(solutions, cNode, i)
                    #print str(cNode) + " -> " + str(i) + " neighbor"
                    ar.append(i)

    # Print out .dot file
    cnt = 0
    for s in solutions:
        outFile.write("  node" + str(s['src']) + " -- node" + str(s['dst']) + " [label=" + str(s['label']) + ", color=" + str(s['color']) + "]")
        if(cnt <= n):
            outFile.write("\n")
        cnt += 1
    outFile.write("}\n")
    outFile.close()
