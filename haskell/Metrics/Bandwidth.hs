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

module Metrics.Bandwidth
( Bandwidth(..)
) where

import Algebra.Semiring

import LaTeX

data Bandwidth = B Int | Inf
  deriving (Eq)

instance Show Bandwidth where
  show (B x) = show x
  show Inf = "∞"

instance Semiring Bandwidth where
  add (B a) (B b) = B (max a b)
  add _ _ = Inf
  zero = B 0

  mul (B a) (B b) = B (min a b)
  mul Inf x = x
  mul x Inf = x
  unit = Inf

  lub Inf b = b
  lub a Inf = a
  lub (B a) (B b) = B (min a b)

instance LaTeX Bandwidth where
  toLaTeX (B x) = "\\textifsym{" ++ show x ++ "}"
  toLaTeX  Inf   = "\\infty"
