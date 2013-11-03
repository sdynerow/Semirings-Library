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

module Utils
( log2
, toArray
, arrayOrder
, squareMultiply
) where

import Data.Bits
import Data.Array

log2 :: Int -> Int
log2 1 = 0
log2 n = 1 + log2 (n `div` 2)

toArray :: Int -> [s] -> Array (Int,Int) s
toArray n ms | ((n*n) == (length ms)) =
  array bnds (zip (range bnds) ms)
  where bnds = ((1,1),(n,n))

arrayOrder :: Array (Int,Int) s -> Int
arrayOrder as = fst (snd (bounds as))

squareMultiply :: (a -> a -> a) -> a -> a -> Int -> a
squareMultiply  _  mulId _ 0 = mulId
squareMultiply mul mulId a k | (k>0) = pInt k ((log2 k)-1) a a
  where pInt _ i _ acc | (i<0) = acc
        pInt k i a acc = pInt k (i-1) a uAcc
              where uAcc = if (testBit k i)
                           then (mul (mul a acc) acc)
                           else (mul acc acc)