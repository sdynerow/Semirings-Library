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

module Metrics.Reliability
( Reliability(..)
) where

import Algebra.Semiring

data Reliability = Rel Float
       deriving (Eq)

instance Show Reliability where
  show (Rel p) | (0.0 <= p && p <= 1.0) = show p
              | otherwise = " ☢ "

instance Semiring (Reliability) where
  add (Rel a) (Rel b) = Rel (max a b)
  zero = (Rel 0.0)
  mul (Rel a) (Rel b) = Rel (a * b)
  unit = (Rel 1.0)

