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

module Metrics.Distance
( Distance(..)
) where

import LaTeX

import Algebra.Semiring

data Distance = D Int | Inft
  deriving (Eq)

instance Show Distance where
  show (D x) = show x
  show Inft = "∞"

instance Semiring (Distance) where
  add (D x) (D y) = D (min x y)
  add  Inft  (D b) = D b
  add (D a)  Inft  = D a
  add  Inft   Inft  = Inft
  zero = Inft

  mul (D x) (D y) = D (x + y)
  mul (D _)  Inft  = Inft
  mul  Inft  (D _) = Inft
  mul  Inft   Inft  = Inft
  unit = (D 0)

-- Because I want to put nice matrices from the D policy in LaTeX files :)
instance LaTeX (Distance) where
  toLaTeX (D x) = "\\mpzc{" ++ show x ++ "}"
  toLaTeX  Inft  = "\\infty"
