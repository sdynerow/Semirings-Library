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
( leftLocalOptimum
, rightLocalOptimum
, stdLeftLocOpt
, stdRightLocOpt
, globalOptimum
) where

import Data.List

import Algebra.Semiring
import Algebra.Matrix

magic :: [s] -> [[[s]]] -> [[s]]
magic as bs = foldl (++) [] (zipWith (\a ps -> (map (\p -> a:p) ps)) as bs)

leftLocalOptimum :: (Semiring s) => s -> s -> s -> s
leftLocalOptimum a b x = if (x == uLocOpt)
		         then x
			 else leftLocalOptimum a b uLocOpt
  where uLocOpt = add (mul a x) b

rightLocalOptimum :: (Semiring s) => s -> s -> s -> s
rightLocalOptimum  a b x = if (x == uLocOpt)
		          then x
			  else rightLocalOptimum a b uLocOpt
  where uLocOpt = add (mul x a) b

stdLeftLocOpt :: (Semiring s) => s -> s -> s
stdLeftLocOpt a x = leftLocalOptimum a mulId x

stdRightLocOpt :: (Semiring s) => s -> s -> s
stdRightLocOpt a x = rightLocalOptimum a mulId x

class GlobalOptimum s where
  globalOptimum :: Matrix s -> Matrix s
  collapse :: [[[[s]]]] -> Matrix s
  newPower :: Matrix s -> Int -> [[[[s]]]]

instance (Semiring s) => GlobalOptimum s where
  globalOptimum (M as) =
    foldl add addId [collapse (newPower (M as) i) | i <- [0..n]]
      where n = order as

  collapse cp =
    M [[foldl add addId (map (foldl mul mulId) bs) | bs <- as] | as <- cp]

  newPower (M as) 0 = [[ [[kronecker i j]] | j <- [1..n]] | i <- [1..n]]
    where n = order as
  newPower (M as) n =
    [[magic a b | b <- transpose (newPower (M as) (n-1))] | a <- as]






