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

module Policy.MostReliablePath
( MostReliablePath(..)
) where

import Algebra.Semiring

data MostReliablePath = MR Float
       deriving (Eq)

instance Show MostReliablePath where
  show (MR p) | (0.0 <= p && p <= 1.0) = show p
              | otherwise = " ☢ "

instance Semiring (MostReliablePath) where
  add (MR a) (MR b) = MR (max a b)
  addId = (MR 0.0)
  mul (MR a) (MR b) = MR (a * b)
  mulId = (MR 1.0)