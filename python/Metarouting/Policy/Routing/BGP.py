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

from functools import partial

class mixedmethod(object):
    def __init__(self, func):
        self.func = func
    def __get__(self, instance, cls):
        return partial(self.func, instance, cls)

# Two types of the BGP customer-peer-provider policy

STRING = ['1', 'C', 'R', 'P', '-']

class BGP(Semiring):
    unitElt = 0
    CUST = 1
    PEER = 2
    PROV = 3
    zeroElt = 4

    def __add__(self, other):
        # Do something with self.elt and other.elt
        return NotImplemented

    @mixedmethod
    def __mul__(self, cls, other):

        if (self.elt == BGP.unitElt or other.elt == BGP.zeroElt):
            return other
        if(self.elt == BGP.zeroElt or other.elt == BGP.unitElt):
            return self

        if(other.elt == BGP.CUST):
            return self
        else:
            if(self.elt == BGP.PROV):
                return self
            else:
                return cls.zero()

    def __le__(self, other):
        return (self.elt >= other.elt)

    def __repr__(self):
        return STRING[self.elt]

class BGPt1(BGP):
    #   | C R P
    # --+------
    # C | C C C
    # R | C R R
    # P | C R P
    def __add__(self, other):
        # Prefer PEER routes over PROVIDER routes
        if (self.elt == BGP.unitElt or other.elt == BGP.zeroElt):
            return self
        if(self.elt == BGP.zeroElt or other.elt == BGP.unitElt):
            return other

        if (self.elt == BGP.CUST or other.elt == BGP.CUST):
            return BGPt1(BGP.CUST)
        elif (self.elt == BGP.PEER or other.elt == BGP.PEER):
            return BGPt1(BGP.PEER)
        else:
            return BGPt1(BGP.PROV)

class BGPt2(BGP):
    #   | C R P
    # --+------
    # C | C C C
    # R | C R P
    # P | C P P
    def __add__(self, other):
        # Prefer PROVIDER routes over PEER routes
        if (self.elt == BGP.unitElt or other.elt == BGP.zeroElt):
            return self
        if(self.elt == BGP.zeroElt or other.elt == BGP.unitElt):
            return other

        if (self.elt == BGP.CUST or other.elt == BGP.CUST):
            return BGPt2(BGP.CUST)
        elif (self.elt == BGP.PROV or other.elt == BGP.PROV):
            return BGPt2(BGP.PROV)
        else:
            return BGPt2(BGP.PEER)
