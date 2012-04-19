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

def nhStr(ls):
    result = "["
    n = len(ls)
    for i in range(n):
        if(ls[i] != 0):
            result += str(ls[i])
        else:
            result += '-'
        if(i < n-1):
            result += " "
        else:
            result += "]"
    return result

def argmax(eltype, S, ls):
    mIdx = -1
    mFnd = eltype.zero()
    for i in S:
        if (ls[i] < mFnd):
            mFnd = ls[i]
            mIdx = i
    return (mIdx, mFnd)
