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

module Algebra.Optimum
( llo
, rlo
, lloStd
, rloStd
, lloStdDepth
, rloStdDepth
) where

import Algebra.Semiring
import Algebra.Matrix

data LatticeStep = Lt | Gt | Eq | Pa

instance Show LatticeStep where
  show Lt = "<"
  show Gt = ">"
  show Eq = "≈"
  show Pa = "|"

norChar :: (Semiring s) => s -> s -> LatticeStep
norChar a b | (nor a b) && (nor b a) = Eq
norChar a b | (nor a b) = Lt
norChar a b | (nor b a) = Gt
norChar a b | otherwise = Pa

-- Iterated solving of X = AX + B
llo :: (Semiring s) => s -> s -> s -> s
llo a b x = if (x == updated) then x else llo a b updated
  where updated = add (mul a x) b
-- Iterated solving of X = XA + B
rlo :: (Semiring s) => s -> s -> s -> s
rlo a b x = if (x == updated) then x else rlo a b updated
  where updated = add (mul x a) b

lloDepth :: (Semiring s) => s -> s -> s -> [LatticeStep]
lloDepth a b x = if (x == updated) then [] else (norChar updated x) : lloDepth a b updated
  where updated = add (mul a x) b
rloDepth :: (Semiring s) => s -> s -> s -> [LatticeStep]
rloDepth a b x = if (x == updated) then [] else (norChar updated x) : rloDepth a b updated
  where updated = add (mul x a) b

lloStd :: (Semiring s) => s -> s
lloStd a = llo a unit unit

rloStd :: (Semiring s) => s -> s
rloStd a = rlo a unit unit

lloStdDepth :: (Semiring s) => s -> [LatticeStep]
lloStdDepth a = lloDepth a unit unit
rloStdDepth :: (Semiring s) => s -> [LatticeStep]
rloStdDepth a = rloDepth a unit unit

