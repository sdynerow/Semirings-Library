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

module Algebra.Constructs.Direct
( Direct(..)
, direct
) where

import LaTeX

import Algebra.Matrix
import Algebra.Semiring

data Direct s t = Dir (s,t)
  deriving (Eq)

instance (Show s, Show t) => Show (Direct s t) where
  show (Dir d) = show d

instance (Semiring s, Semiring t) => Semiring (Direct s t) where
  zero = Dir (zero, zero)
  unit = Dir (unit, unit)
  add (Dir (s1, t1)) (Dir (s2, t2)) = Dir (add s1 s2, add t1 t2)
  mul (Dir (s1, t1)) (Dir (s2, t2)) = Dir (mul s1 s2, mul t1 t2)

direct :: (Semiring s, Semiring t) => Matrix s -> Matrix t -> Matrix (Direct s t)
direct as bs
   | (order as) == (order bs)
     = pointwise as bs zipD
   | otherwise
     = error "Incompatibles matrice sizes"

zipD :: s -> t -> Direct s t
zipD s t = Dir (s, t)

-- Because I want to put nice matrices from the SP policy in LaTeX files :)
instance (LaTeX s, LaTeX t) => LaTeX (Direct s t) where
  toLaTeX (Dir (s, t)) = "(" ++ toLaTeX s ++ "," ++ toLaTeX t ++ ")"
