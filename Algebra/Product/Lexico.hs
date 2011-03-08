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

module Algebra.Product.Lexico
( Lexico(..)
, lexico
) where

import Algebra.Matrix
import Algebra.Semiring

data Lexico s t = Lex (s,t)
  deriving (Eq)

instance (Show s, Show t) => Show (Lexico s t) where
  show (Lex l) = show l

instance (Semiring s, Semiring t) => Semiring (Lexico s t) where
  addId = Lex (addId, addId)
  mulId = Lex (mulId, mulId)
  add (Lex (s1,t1)) (Lex (s2,t2))
      | (addS == s1 && addS == s2) = Lex (addS,add t1 t2)
      | (addS == s1) = Lex (s1,t1)
      | (addS == s2) = Lex (s2,t2)
      | otherwise    = Lex (addS, addId)
          where addS = add s1 s2
  mul (Lex (s1, t1)) (Lex (s2, t2)) = Lex (mul s1 s2, mul t1 t2)

lexico :: (Semiring s, Semiring t) => Matrix s -> Matrix t -> Matrix (Lexico s t)
lexico as bs | (order as) == (order bs) = pointwise as bs zipL
             | otherwise = error "Incompatibles matrice sizes"

zipL :: s -> t -> Lexico s t
zipL s t = Lex (s, t)
