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

module Policy.UsablePath
( UsablePath(..)
) where

import Algebra.Semiring

import LaTeX

data UsablePath = U Int
  deriving (Eq)

instance Show UsablePath where
  show (U 0) = "X"
  show (U 1) = "V"

instance Semiring UsablePath where
  add (U a) (U b) = U (max a b)
  zero = (U 0)

  mul (U a) (U b) = U (min a b)
  unit = (U 1)

instance LaTeX UsablePath where
  toLaTeX (U 0) = "\\ko"
  toLaTeX (U 1) = "\\ok"
