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

# Two types of the BGP customer-peer-provider policy

STRING = ['1', 'C', 'R', 'P', '-']

class BGP(Semiring):
    UNIT = 0
    CUST = 1
    PEER = 2
    PROV = 3
    ZERO = 4

    def __add__(self, other):
        # Do something with self.elt and other.elt
        return NotImplemented

    def __mul__(self, other):

        if (self.elt == BGP.UNIT or other.elt == BGP.ZERO):
            return other
        if(self.elt == BGP.ZERO or other.elt == BGP.UNIT):
            return self

        if(other.elt == BGP.CUST):
            return self
        else:
            if(self.elt == BGP.PROV):
                return self
            else:
                return self.__class__.zero()

    def __le__(self, other):
        # Test something using self.elt and other.elt
        return NotImplemented

    def __repr__(self):
        # Return some string using self.elt
        return STRING[self.elt]

    @staticmethod
    def zero():
        # Return the additive identity
        return BGP(BGP.ZERO)

    @staticmethod
    def unit():
        # Return the multiplicative identity
        return BGP(BGP.UNIT)

    @staticmethod
    def groundSet():
        return map(BGP, range(5))

class BGPt1(BGP):
    #   | C R P
    # --+------
    # C | C C C
    # R | C R R
    # P | C R P
    def __add__(self, other):
        # Prefer PEER routes over PROVIDER routes
        if (self.elt == BGP.UNIT or other.elt == BGP.ZERO):
            return self
        if(self.elt == BGP.ZERO or other.elt == BGP.UNIT):
            return other

        if (self.elt == BGP.CUST or other.elt == BGP.CUST):
            return BGPt1(BGP.CUST)
        elif (self.elt == BGP.PEER or other.elt == BGP.PEER):
            return BGPt1(BGP.PEER)
        else:
            return BGPt1(BGP.PROV)

    @staticmethod
    def zero():
        # Return the additive identity
        return BGPt1(BGP.ZERO)

    @staticmethod
    def unit():
        # Return the multiplicative identity
        return BGPt1(BGP.UNIT)

    @staticmethod
    def groundSet():
        return map(BGPt1, range(5))

class BGPt2(BGP):
    #   | C R P
    # --+------
    # C | C C C
    # R | C R P
    # P | C P P
    def __add__(self, other):
        # Prefer PROVIDER routes over PEER routes
        if (self.elt == BGP.UNIT or other.elt == BGP.ZERO):
            return self
        if(self.elt == BGP.ZERO or other.elt == BGP.UNIT):
            return other

        if (self.elt == BGP.CUST or other.elt == BGP.CUST):
            return BGPt2(BGP.CUST)
        elif (self.elt == BGP.PROV or other.elt == BGP.PROV):
            return BGPt2(BGP.PROV)
        else:
            return BGPt2(BGP.PEER)

    @staticmethod
    def zero():
        # Return the additive identity
        return BGPt2(BGP.ZERO)

    @staticmethod
    def unit():
        # Return the multiplicative identity
        return BGPt2(BGP.UNIT)

    @staticmethod
    def groundSet():
        return map(BGPt2, range(5))
