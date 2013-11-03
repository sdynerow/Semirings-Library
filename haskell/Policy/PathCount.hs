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

-- A definition of the AS-PATH policy of BGP

module Policy.PathCount
( PathCount(..)
) where

import Algebra.Semiring

data PathCount = PC Int
            deriving (Eq,Ord)

instance Show (PathCount) where
  show (PC a) = show a

instance Semiring (PathCount) where
  add (PC as) (PC bs) = PC (as + bs)
  zero = PC 0

  mul (PC as) (PC bs) = PC (as * bs)
  unit = PC 1





