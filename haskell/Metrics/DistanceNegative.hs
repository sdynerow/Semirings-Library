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

module Metrics.DistanceNegative
( ShortestPathNeg(..)
) where

import LaTeX

import Algebra.Semiring

data ShortestPathNeg = SPN Int | Inf
  deriving (Eq)

instance Show ShortestPathNeg where
  show (SPN x) = show x
  show Inf = "∞"

instance LaTeX ShortestPathNeg where
  toLaTeX (SPN x) = "\\mpzc{" ++ show x ++ "}"
  toLaTeX Inf = "\\infty"

instance Semiring (ShortestPathNeg) where
  add Inf x = x
  add x Inf = x
  add (SPN x) (SPN y) = SPN (min x y)
  zero = Inf

  mul (SPN x) (SPN y) = SPN (x + y)
  mul _ _ = Inf
  unit = (SPN 0)
