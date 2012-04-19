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

def checkPrebimonoid(S, v = 1):
    am = checkAddMonoid(S, v)
    mi = checkMulIdentity(S, v)
    ma = checkMulAbsorbant(S, v)
    answer = am and mi and ma
    if(v>0):
        print str(S) + " is " + ("" if answer else "not ") + "a prebimonoid"
    return answer

def checkBimonoid(S, v = 1):
    am = checkPrebimonoid(S, v-1)
    ma = checkMulAssociativity(S, v)
    answer = am and ma
    if(v>0):
        print str(S) + " is " + ("" if answer else "not ") + "a bimonoid"
    return answer

def checkSemiring(S, v = 1):
    am = checkAddMonoid(S, v)
    mm = checkMulMonoid(S, v)
    ma = checkMulAbsorbant(S, v)
    ld = checkLeftDistributivity(S, v)
    rd = checkRightDistributivity(S, v)
    answer = am and mm and ma and ld and rd
    if(v>0):
        print str(S) + " is " + ("" if answer else "not ") + "a semiring"
    return answer

# Additive structure properties
def checkAddMonoid(S, v = 2):
    caa = checkAddAssociativity(S, v)
    cai = checkAddIdentity(S, v)
    cac = checkAddCommutativity(S, v)
    return caa and cai and cac

def checkAddAssociativity(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    i = 0
    while (i < n):
        a = groundSet[i]
        j = 0
        while (j < n):
            b = groundSet[j]
            k = 0
            while (k < n):
                c = groundSet[k]
                if( ( (a + (b + c)) != (a + b) + c) ):
                    if(v>2):
                        print(str(a) + "+(" + str(b) + "+" + str(c) + ") != " +
                              "(" + str(a) + "+" + str(b) + ")+" + str(c)
                              )
                    answer = False
                k += 1
            j += 1
        i += 1
    if(v>1):
        print "+ of " + str(S) + " is " + ("not " if not answer else "") + "assocative"
    return answer

def checkAddCommutativity(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    i = 0
    while (i < n):
        a = groundSet[i]
        j = 0
        while (j < n):
            b = groundSet[j]
            if( (a + b) != (b + a)):
                if(v>2):
                    print str(a) + "+" + str(b) + " != " + str(b) + "+" + str(a)
                answer = False
            j += 1
        i += 1
    if(v>1):
        print "+ of " + str(S) + " is " + ("not " if not answer else "") + "commutative"
    return answer

def checkAddIdentity(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    z = S.zero()
    i = 0
    while (i < n):
        a = groundSet[i]
        if(a + z != a):
            if(v>2):
                print str(a) + " + " + str(z) + "!=" + str(a)
            answer = False
        i += 1
    if(v>1):
        print "'" + str(z) + "' of " + str(S) + " is " + ("not " if not answer else "") + "an identity element for +"
    return answer

def checkAddAbsorbant(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    u = S.unit()
    i = 0
    while (i < n):
        a = groundSet[i]
        if(a + u != u):
            if(v>2):
                print str(a) + " + " + str(u) + "!=" + str(u)
            answer = False
        i += 1
    if(v>1):
        print "'" + str(u) + "' of " + str(S) + " is " + ("not " if not answer else "") + "an absorbing element for +"
    return answer

def checkAddIdempotency(S):
    return (S.unit() + S.unit) == S.unit()

# Multiplicative structure properties
def checkMulMonoid(S, v = 2):
    cma = checkMulAssociativity(S, v)
    cmi = checkMulIdentity(S, v)
    return cma and cmi

def checkMulAssociativity(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    i = 0
    while (i < n):
        a = groundSet[i]
        j = 0
        while (j < n):
            b = groundSet[j]
            k = 0
            while (k < n):
                c = groundSet[k]
                if( ( (a * (b * c)) != (a * b) * c) ):
                    if(v>2):
                        print(str(a) + "*(" + str(b) + "*" + str(c) + ") != " +
                              "(" + str(a) + "*" + str(b) + ")*" + str(c)
                              )
                    answer = False
                k += 1
            j += 1
        i += 1
    if(v>1):
        print "* of " + str(S) + " is " + ("not " if not answer else "") + "assocative"
    return answer

def checkMulIdentity(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    u = S.unit()
    i = 0
    while (i < n):
        a = groundSet[i]
        if(a * u != a):
            if(v>2):
                print str(a) + " * " + str(u) + "!=" + str(a)
            answer = False
        i += 1
    if(v>1):
        print "'" + str(u) + "' of " + str(S) + " is " + ("not " if not answer else "") + "an identity element for *"
    return answer

def checkMulAbsorbant(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    z = S.zero()
    i = 0
    while (i < n):
        a = groundSet[i]
        if(a * z != z):
            if(v>2):
                print str(a) + " * " + str(z) + "!=" + str(z)
            answer = False
        i += 1
    if(v>1):
        print "'" + str(z) + "' of " + str(S) + " is " + ("not " if not answer else "") + "an absorbing element for *"
    return answer
    
def checkMulIdempotency(S):
    # No idea how to test this
    pass

def checkLeftDistributivity(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    i = 0
    while (i < n):
        a = groundSet[i]
        j = 0
        while (j < n):
            b = groundSet[j]
            k = 0
            while (k < n):
                c = groundSet[k]
                if( (a * (b + c)) != (a * b) + (a * c) ):
                    if(v>2):
                        print(str(a) + "*(" + str(b) + "+" + str(c) + ") != " +
                              "(" + str(a) + "*" + str(b) + ")+(" + str(a) + "*" + str(c) + ")"
                              )
                    answer = False
                k += 1
            j += 1
        i += 1
    if(v>1):
        print "* of " + str(S) + " is " + ("not " if not answer else "") + "left-distributive over +"
    return answer

def checkRightDistributivity(S, v = 2):
    groundSet = S.groundSet()
    n = len(groundSet)
    answer = True
    i = 0
    while (i < n):
        a = groundSet[i]
        j = 0
        while (j < n):
            b = groundSet[j]
            k = 0
            while (k < n):
                c = groundSet[k]
                if( ((a + b) * c ) != (a * c) + (b * c) ):
                    if(v>2):
                        print("(" + str(a) + "+" + str(b) + ")*" + str(c) + " != " +
                              "(" + str(a) + "*" + str(c) + ")+(" + str(b) + "*" + str(c) + ")"
                              )
                    answer = False
                k += 1
            j += 1
        i += 1
    if(v>1):
        print "* of " + str(S) + " is " + ("not " if not answer else "") + "right-distributive over +"
    return answer

props = [
    dict(name = "+ assoc.", fct = checkAddAssociativity),
    dict(name = "+ ident.", fct = checkAddIdentity),
    dict(name = "+ absor.", fct = checkAddAbsorbant),
    dict(name = "+ commu.", fct = checkAddCommutativity),
    dict(name = "* assoc.", fct = checkMulAssociativity),
    dict(name = "* ident.", fct = checkMulIdentity),
    dict(name = "* absor.", fct = checkMulAbsorbant),
    dict(name = "* LD +  ", fct = checkLeftDistributivity),
    dict(name = "* RD +  ", fct = checkRightDistributivity)
]

def properties(S, v = 1):
    i = 0
    n = len(props)
    while (i < n):
        entry = props[i]
        print entry['name'] + " " + ("YES" if entry['fct'](S, v) else "NO")
        i += 1
