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
( llo1
, rlo1
, llo2
, rlo2
, lloStd
, rloStd
, lloMem
, rloMem
, lloStdDepth
, rloStdDepth
, lloMemDepth
, rloMemDepth
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
llo1 :: (Semiring s) => s -> s -> s -> s
llo1 a b x = if (x == updated) then x else llo1 a b updated
  where updated = add (mul a x) b
-- Iterated solving of X = XA + B
rlo1 :: (Semiring s) => s -> s -> s -> s
rlo1 a b x = if (x == updated) then x else rlo1 a b updated
  where updated = add (mul x a) b

lloDepth1 :: (Semiring s) => s -> s -> s -> [LatticeStep]
lloDepth1 a b x = if (x == updated) then [] else (norChar updated x) : lloDepth1 a b updated
  where updated = add (mul a x) b
rloDepth1 :: (Semiring s) => s -> s -> s -> [LatticeStep]
rloDepth1 a b x = if (x == updated) then [] else (norChar updated x) : rloDepth1 a b updated
  where updated = add (mul x a) b

llo2 :: (Semiring s) => s -> s -> s
llo2 a x = if (x == updated) then x else llo2 a updated
  where updated = add (mul a x) x
rlo2 :: (Semiring s) => s -> s -> s
rlo2 a x =  if (x == updated) then x else rlo2 a updated
  where updated = add (mul x a) x

lloDepth2 :: (Semiring s) => s -> s -> [LatticeStep]
lloDepth2 a x = if (x == updated) then [] else (norChar updated x) : lloDepth2 a updated
  where updated = add (mul a x) x
rloDepth2 :: (Semiring s) => s -> s -> [LatticeStep]
rloDepth2 a x = if (x == updated) then [] else (norChar updated x) : rloDepth2 a updated
  where updated = add (mul x a) x

lloStd :: (Semiring s) => s -> s
lloStd a = llo1 a unit unit

rloStd :: (Semiring s) => s -> s
rloStd a = rlo1 a unit unit

lloMem :: (Semiring s) => s -> s
lloMem a = llo2 a unit

rloMem :: (Semiring s) => s -> s
rloMem a = rlo2 a unit

lloStdDepth :: (Semiring s) => s -> [LatticeStep]
lloStdDepth a = lloDepth1 a unit unit
rloStdDepth :: (Semiring s) => s -> [LatticeStep]
rloStdDepth a = rloDepth1 a unit unit

lloMemDepth :: (Semiring s) => s -> [LatticeStep]
lloMemDepth a = lloDepth2 a unit
rloMemDepth :: (Semiring s) => s -> [LatticeStep]
rloMemDepth a = rloDepth2 a unit

