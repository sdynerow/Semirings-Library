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

module Policy.WidestPath
( WidestPath(..)
) where

import Algebra.Semiring

import LaTeX

data WidestPath = WP Int | Inf
  deriving (Eq)

instance Show WidestPath where
  show (WP x) = show x
  show Inf = "∞"

instance Semiring WidestPath where
  add (WP a) (WP b) = WP (max a b)
  add _ _ = Inf
  zero = WP 0

  mul (WP a) (WP b) = WP (min a b)
  mul Inf x = x
  mul x Inf = x
  unit = Inf

instance LaTeX WidestPath where
  toLaTeX (WP x) = "\\textifsym{" ++ show x ++ "}"
  toLaTeX  Inf   = "\\infty"
