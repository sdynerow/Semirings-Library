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

module Algebra.SMatrix
( SMatrix(..)
, rowCount
, colCount
) where

import Utils
import Data.Array

import Algebra.Matrix
import Algebra.Semimodule

data SMatrix t = SM (Array (Int,Int) t) | SZero
  deriving Eq

rowCount :: Array (Int,Int) t -> Int
rowCount as = ((fst.snd.bounds) as) - ((fst.fst.bounds) as) + 1

colCount :: Array (Int,Int) t -> Int
colCount as = ((snd.snd.bounds) as) - ((snd.fst.bounds) as) + 1

instance (Eq t, Show t) => Show (SMatrix t) where
  show (SM as) = intShow [[ as!(i,j) | j <- [1..n]] | i <- [1..n]]
    where n = arrayOrder as
          intShow (a:as) |  as == [] = intShowVector a
	  	  	 | otherwise = intShowVector a ++ "\n" ++ intShow as
	    where intShowVector (a:[]) = show a
	          intShowVector (a:as) = show a ++ " " ++ intShowVector as

instance Semimodule s t => Semimodule (Matrix s) (SMatrix t) where
  sadd SZero b = b
  sadd a SZero = a
  sadd (SM as) (SM bs) =   SM (array r [(idx, sadd (as!idx) (bs!idx)) | idx <- range r])
    where r = bounds as
--   lsmul (M as) (SM bs) | ((arrayOrder as) /= (rowCount bs)) =
--     error "Incompatible matrices"
--   lsmul (M as) (SM bs) | ((arrayOrder as) == (rowCount bs)) =
--     SM (array r [((i,j), computeOneElt (M as) (SM bs) (i,j)) | (i,j) <- range r])
--     where r = bounds as
--     	  n = arrayOrder as
  lsmul _ _ = SZero
  rsmul _ _ = SZero
  szero = SZero

--  power as k = squareMultiply mul (matrixUnit (order as)) as k

computeOneElt :: (Semimodule s t) => Matrix s -> SMatrix t -> (Int,Int) -> t
computeOneElt (M as) (SM bs) (i,j) | ((arrayOrder as) == (rowCount bs)) =
  foldl sadd szero [lsmul (as!(i,q)) (bs!(q,j)) | q <- [1..n]]
  where n = arrayOrder as


