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

module Algebra.Triangular
( upper
, lower
) where

import Algebra.Semiring
import Algebra.Matrix

upper :: (Semiring s) => Matrix s -> Matrix s
upper (M as) = M (zipWith (\a b -> zipWith mul a b) as uExtractor)
  where uExtractor = [[up i j | j <- [1..n]] | i <- [1..n]]
        n = order as
        up i j | (i <  j) = mulId
               | (i >= j) = addId

lower :: (Semiring s) => Matrix s -> Matrix s
lower (M as) = M (zipWith (\a b -> zipWith mul a b) as lExtractor)
  where lExtractor = [[lo i j | j <- [1..n]] | i <- [1..n]]
        n = order as
        lo i j | (i <  j) = addId
               | (i >= j) = mulId
