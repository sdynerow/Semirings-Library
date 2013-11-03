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

class ASPATH(Semiring):
    ASNMAX = 65535

    def __add__(self, other):
        s1 = self.elt
        s2 = other.elt
        if(s1 == None):
            return ASPATH(s2)
        elif (s2 == None):
            return ASPATH(s1)
        n1 = len(s1)
        n2 = len(s2)
        if (n1 <= n2):
            return ASPATH(s1)
        else:
            return ASPATH(s2)

    def __mul__(self, other):
        s1 = self.elt
        s2 = other.elt
        if(s1 == None or s2 == None):
            return ASPATH(None)
        else:
            return ASPATH(s1 ++ s2)

#class ASPATH(Semiring):
#    ASNMAX = 65535
#
#    def __disjoint(sq, bl):
#        n = len(bl)
#        i = 0
#        while (i < n):
#            i += 1
#        return True
#
#    def __add__(self, other):
#        (s1, b1) = self.elt
#        (s2, b2) = other.elt
#
#        if(s1 == None):
#            return other
#        elif (s2 == None):
#            return self
#
#        n1 = len(s1)
#        n2 = len(s2)
#        if (n1 <= n2):
#            return self
#        else:
#            return other
#
#    def __mul__(self, other):
#        (s1, b1) = self.elt
#        (s2, b2) = other.elt
#        if(ASPATH.__disjoint(s2, b1)):
#            return ASPATH(s1 + s2, [])
#        else:
#            ASPATH.zero()
