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

module Algebra.Arborescence
( owaL
, owaR
) where

import Data.Array

import Algebra.Matrix
import Algebra.Semiring

import Policy.ShortestPathNeg
import Examples.ShortestPathNeg

dmul :: (Semiring s) => Matrix s -> Matrix s -> Matrix s
dmul as bs = pointwise as bs mul

antiMulId :: (Semiring s) => Int -> Matrix s
antiMulId n = M (array r [(idx, delta idx) | idx <- range r])
  where r = ((1,1),(n,n))
        delta = \(i,j) -> if (i==j) then addId else mulId

fL :: (Semiring s) => Matrix s -> Matrix s -> Matrix s
fL a as = dmul (mul a as) (antiMulId (order as))

fR :: (Semiring s) => Matrix s -> Matrix s -> Matrix s
fR a as = dmul (mul as a) (antiMulId (order as))

owaL :: (Semiring s) => Matrix s -> Matrix s
owaL as = foldl add (mulId) (take ((order as) - 1) terms)
  where terms = as : [fL as ns | ns <- terms]

owaR :: (Semiring s) => Matrix s -> Matrix s
owaR as = foldl add (mulId) (take ((order as) - 1) terms)
  where terms = as : [fR as ns | ns <- terms]
