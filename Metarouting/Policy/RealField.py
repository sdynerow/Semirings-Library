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

class RealField(Semiring):
    def __add__(self, other):
        return RealField(self.elt + other.elt)

    def __mul__(self, other):
        return RealField(self.elt * other.elt)

    def __le__(self, other):
        return True

    def __repr__(self):
        return self.elt.__repr__()
 
    @staticmethod
    def unit():
        return RealField(1)

    @staticmethod
    def zero():
        return RealField(0)
