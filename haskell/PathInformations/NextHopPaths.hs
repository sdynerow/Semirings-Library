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

module PathInformations.NextHopPaths
( NextHopPaths(..)
) where

import LaTeX

import PathInformations.NextHop
import Algebra.Semiring
import Algebra.Semimodule

data NextHopPaths = NHP [NextHop] | Agr NextHopPaths NextHopPaths
  deriving (Eq)

instance Show NextHopPaths where
  show (NHP l) = show l
  show (Agr n1 n2) = show n1 ++ "|" ++ show n2

instance Semimodule NextHop NextHopPaths where
  sadd p1 p2 = Agr p1 p2
  lsmul n (NHP p) = NHP (n:p)
  lsmul n (Agr p1 p2) = Agr (lsmul n p1) (lsmul n p2)
  rsmul (NHP p) n = NHP (n:p)
  rsmul (Agr p1 p2) n = Agr (rsmul p1 n) (rsmul p2 n)
  
--  -- The self-loop is more interesting than any link. The end of the line is the least interesting one.
--  add p1 S = S
--  add S p2 = S
--  add X p2 = p2
--  add p1 X = p1
--  -- We arbitrarily pick the first operand
--  add p1 p2 = p1
--  -- The absence of a next hop is the least interesting situation
--  zero = X
--  -- The self-loop is a unit for concatenation and end of the line absorbs
--  mul S p2 = p2
--  mul X _ = X
--  mul _ X = X
--  -- Otherwise the next-hop is picked, p2 is the next-hop's next-hop :)
--  mul p1 p2 = p1
--  -- The self-loop is a unit for concatenation
--  unit = S
