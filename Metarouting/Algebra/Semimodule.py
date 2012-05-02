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

class Semimodule:
    zeroElt = None

    def __init__(self, val):
        self.elt = val

    def __add__(self, other):
        raise NotImplementedError("Additive law not implemented.")

    def __mul__(self, other):
        if(issubclass(other.__class__, Semiring)):
            return self.__lmul__(other)
        else:
            return NotImplemented

    def __lmul__(self, other):
        raise NotImplementedError("Scalar left-multiplicative law not implemented.")

    def __rmul__(self, other):
        raise NotImplementedError("Scalar right-multiplicative law not implemented.")

    # Representation related stuff
    def __repr__(self):
        raise NotImplementedError("Representation not specified.")

    @classmethod
    def zero(cls):
        return cls(cls.zeroElt)
