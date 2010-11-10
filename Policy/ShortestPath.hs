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

module Policy.ShortestPath
( ShortestPath(..)
) where

import Algebra.Semiring

import LaTeX

data ShortestPath = SP Int | Inft
  deriving (Eq)

instance Show ShortestPath where
  show (SP x) = show x
  show Inft = "∞"

instance Semiring (ShortestPath) where
  add (SP x) (SP y) = SP (min x y)
  add  Inft  (SP b) = SP b
  add (SP a)  Inft  = SP a
  add  Inft   Inft  = Inft
  addId = Inft

  mul (SP x) (SP y) = SP (x + y)
  mul (SP _)  Inft  = Inft
  mul  Inft  (SP _) = Inft
  mul  Inft   Inft  = Inft
  mulId = (SP 0)

-- Because I want to put nice matrices from the SP policy in LaTeX files :)
instance LaTeX (ShortestPath) where
  toLaTeX (SP x) = "\\mpzc{" ++ show x ++ "}"
  toLaTeX  Inft  = "\\infty"