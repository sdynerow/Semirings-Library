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

module PathInformations.Existence
( Existence(..)
) where

import Algebra.Semiring

import LaTeX

data Existence = E Int
  deriving (Eq)

instance Show Existence where
  show (E 0) = "X"
  show (E 1) = "V"

instance Semiring Existence where
  add (E a) (E b) = E (max a b)
  zero = (E 0)

  mul (E a) (E b) = E (min a b)
  unit = (E 1)

instance LaTeX Existence where
  toLaTeX (E 0) = "\\ko"
  toLaTeX (E 1) = "\\ok"
