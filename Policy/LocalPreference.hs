-- Copyright (c) 2010 - Seweryn Dynerowicz
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
-- http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- imitations under the License.

-- Definition of the LOCAL-PREF policy of BGP

module Policy.LocalPreference
( LocalPreference(..)
) where

import LaTeX

import Algebra.Semiring

data LocalPreference = LP Int | Infinity | NA
       deriving(Eq, Show)

instance Semiring (LocalPreference) where
  add (LP a) (LP b) = LP (min a b)
  addId = Infinity
  mul a _ = a
  mulId = NA

instance LaTeX (LocalPreference) where
  toLaTeX (LP x) = show x
  toLaTeX Infinity = "\\infty"
  toLaTeX NA = "NA"