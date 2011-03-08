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

module Graph
( Graph(..)
, toMatrix
) where

import Utils

import Algebra.Semiring
import Algebra.Matrix

import Policy.ShortestPath

data Graph w = G (Int, [(Int, Int, w)])
  deriving (Eq, Show)

spawn :: (Semiring w) => [(Int, Int, w)] -> Int -> Int -> [w]
spawn [] n i = replicate (b-i) addId
  where b = (n*n)
spawn as n i = if (((x * n + y) - n - 1) == i)
      	       	   then w : spawn (tail as) n (i+1)
		   else addId : spawn as n (i+1)
  where (x,y,w) = head as
    	b = (n*n)-1

-- We suppose the arcs are ordered by origin and destination and there exists at most one arc by node pair
toMatrix :: (Semiring w) => Graph w -> Matrix w
toMatrix (G (n, as)) = M (toArray n arcList)
  where arcList = spawn as n 0

