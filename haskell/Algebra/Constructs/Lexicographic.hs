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

module Algebra.Constructs.Lexicographic
( Lexicographic(..)
, lexicographic
) where

import LaTeX

import Algebra.Matrix
import Algebra.Semiring

data Lexicographic s t = Lex (s,t)
  deriving (Eq)

instance (Show s, Show t) => Show (Lexicographic s t) where
  show (Lex l) = show l

instance (LaTeX s, LaTeX t) => LaTeX (Lexicographic s t) where
  toLaTeX (Lex p) = toLaTeX p

instance (Semiring s, Semiring t) => Semiring (Lexicographic s t) where
  zero = Lex (zero, zero)
  unit = Lex (unit, unit)
  add (Lex (s1,t1)) (Lex (s2,t2))
      | (addS == s1 && addS == s2) = Lex (addS,add t1 t2)
      | (addS == s1) = Lex (s1,t1)
      | (addS == s2) = Lex (s2,t2)
      | otherwise    = Lex (addS, zero)
          where addS = add s1 s2
  mul (Lex (s1, t1)) (Lex (s2, t2)) = Lex (mul s1 s2, mul t1 t2)
  lub (Lex (s1, t1)) (Lex (s2, t2)) = Lex (lub s1 s2, lub t1 t2)

lexicographic :: (Semiring s, Semiring t) => Matrix s -> Matrix t -> Matrix (Lexicographic s t)
lexicographic as bs | (order as) == (order bs) = pointwise as bs zipL
             | otherwise = error "Incompatibles matrice sizes"

zipL :: s -> t -> Lexicographic s t
zipL s t = Lex (s, t)


