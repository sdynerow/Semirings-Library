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

-- Definition of an ORIGIN-PREF policy

module Policy.OriginPreference
( OriginPreference(..)
) where

import Algebra.Semiring

data OriginPreference = OP Int | Infinity | NA
       deriving(Eq, Show)

instance Semiring (OriginPreference) where
  add (OP a) (OP b) = OP (min a b)
  addId = Infinity
  mul _ b = b
  mulId = NA
