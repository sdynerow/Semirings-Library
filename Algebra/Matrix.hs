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

module Algebra.Matrix
( Matrix(M)
, genMatrixAddId
, genMatrixMulId
, order
) where

import Data.List
import Data.Bits

import Utils
import Algebra.Semiring

data Matrix s = M [[s]]
              | MatAddId
	      | MatMulId

instance (Show s, Eq s) => Show (Matrix s) where
  show (M (a:as)) | as == []  = showVector a
                  | otherwise = showVector a ++ "\n" ++ show (M as)
    where showVector (a:[]) = show a
          showVector (a:as) = show a ++ " " ++ showVector as
  show MatAddId = "forall i,j => 0"
  show MatMulId = "i==j => 1 & i/=j => 0"

instance (Semiring s, Eq s) => Eq (Matrix s) where
  (==) MatAddId MatAddId = True
  (==) MatMulId MatMulId = True
  (==) (M as) MatAddId = (==) (M as) (genMatrixAddId (order as))
  (==) MatAddId (M bs) = (==) (genMatrixAddId (order bs)) (M bs)
  (==) (M as) MatMulId = (==) (M as) (genMatrixMulId (order as))
  (==) MatMulId (M bs) = (==) (genMatrixMulId (order bs)) (M bs)
  (==) (M as) (M bs) = as == bs

genMatrixAddId :: (Semiring s) => Int -> Matrix s
genMatrixAddId n = M (replicate n (replicate n addId))

genMatrixMulId :: (Semiring s) => Int -> Matrix s
genMatrixMulId n = M [[kronecker i j | j <- [1..n]] | i <- [1..n]]

order :: [[s]] -> Int
order as = intOrder as (length as)
  where intOrder [] n = n
        intOrder (x:xs) n | (n == length x) = intOrder xs n
                          | otherwise       = error "xs is not a square matrix"

instance Semiring s => Semiring (Matrix s) where
  add (M as) (M bs) = M (zipWith (zipWith add) as bs)
  add MatAddId (M bs) = add (genMatrixAddId (order bs)) (M bs)
  add (M as) MatAddId = add (M as) (genMatrixAddId (order as))
  add MatMulId (M bs) = add (genMatrixMulId (order bs)) (M bs)
  add (M as) MatMulId = add (M as) (genMatrixMulId (order as))
  add _ _ = error "Incompatibles matrices"
  addId = MatAddId

  mul (M as) (M bs) =
      M [[foldl add addId (zipWith mul a b) | b <- transpose bs] | a <- as]
  mul MatAddId (M bs) = mul (genMatrixAddId (order bs)) (M bs)
  mul (M as) MatAddId = mul (M as) (genMatrixAddId (order as))
  mul MatMulId (M bs) = mul (genMatrixMulId (order bs)) (M bs)
  mul (M as) MatMulId = mul (M as) (genMatrixMulId (order as))
  mul _ _ = error "Incompatibles matrices"
  mulId = MatMulId

  power (M as) k = squareMultiply mul (genMatrixMulId (order as)) (M as) k
