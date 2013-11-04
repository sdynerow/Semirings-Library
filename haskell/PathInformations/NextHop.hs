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

module PathInformations.NextHop
( NextHop(..)
) where

import LaTeX

import Algebra.Semiring

data NextHop = A Int Int | S | X
  deriving (Eq)

instance Show NextHop where
  show S = "↻" -- the self-loop
  show X = "⇥" -- the end of the line
  show (A i j) = show i ++ "⇀" ++ show j

instance Semiring (NextHop) where
  -- The self-loop is more interesting than any link. The end of the line is the least interesting one.
  add p1 S = S
  add S p2 = S
  add X p2 = p2
  add p1 X = p1
  -- We arbitrarily pick the first operand
  add p1 p2 = p1
  -- The absence of a next hop is the least interesting situation
  zero = X
  -- The self-loop is a unit for concatenation and end of the line absorbs
  mul S p2 = p2
  mul X _ = X
  mul _ X = X
  -- Otherwise the next-hop is picked, p2 is the next-hop's next-hop :)
  mul p1 p2 = p1
  -- The self-loop is a unit for concatenation
  unit = S
