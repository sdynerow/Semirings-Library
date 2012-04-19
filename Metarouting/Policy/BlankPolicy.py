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

from Algebra.Semiring import *

class BlankPolicy(Semiring):
    def __add__(self, other):
        # Do something with self.elt and other.elt
        return NotImplemented

    def __mul__(self, other):
        # Do something with self.elt and other.elt
        return NotImplemented

    def __le__(self, other):
        # Test something using self.elt and other.elt
        return NotImplemented

    def __repr__(self):
        # Return some string using self.elt
        return NotImplemented

    @staticmethod
    def zero():
        # Return the additive identity
        return NotImplemented

    @staticmethod
    def unit():
        # Return the multiplicative identity
        return NotImplemented
