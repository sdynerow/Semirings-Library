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
( Matrix(..)
, matrixZero
, matrixUnit
, order
, transpose
, pointwise
) where

import Utils
import Data.Array

import Algebra.Semiring

data Matrix s = M (Array (Int,Int) s)
     	      | MatAddId
	      | MatMulId

matrixZero :: (Semiring s) => Int -> Matrix s
matrixZero n = M (array r [(idx, zero) | idx <- range r])
  where r = ((1,1),(n,n))

matrixUnit :: (Semiring s) => Int -> Matrix s
matrixUnit n = M (array r [(idx, delta idx) | idx <- range r])
  where r = ((1,1),(n,n))
        delta = \(i,j) -> kronecker i j

order :: Matrix s -> Int
order (M as) = arrayOrder as
order _ = 0

transpose :: Matrix s -> Matrix s
transpose (M ms) = M (array r [((j,i), ms!(i,j)) | i <- [1..n], j <- [1..n]])
  where r = ((1,1),(n,n))
  	n = arrayOrder ms
transpose x = x

pointwise :: Matrix s -> Matrix t -> (s -> t -> u) -> Matrix u
pointwise (M as) (M bs) op | (arrayOrder as) == (arrayOrder bs) =
  M (array r [(idx, op (as!idx) (bs!idx)) | idx <- range r])
    where r = bounds as
pointwise _ _ _ = error "Incompatible matrices"

instance (Semiring s, Show s) => Show (Matrix s) where
  show (M as) = "[" ++ intShow [[ as!(i,j) | j <- [1..n]] | i <- [1..n]] ++ "]"
    where n = arrayOrder as
          intShow (a:as) |  as == [] = intShowVector a
	  	  	 | otherwise = intShowVector a ++ "\n" ++ intShow as
	    where intShowVector (a:[]) = show a
	          intShowVector (a:as) = show a ++ " " ++ intShowVector as
  show MatAddId = "forall i,j => 0"
  show MatMulId = "i==j => 1 & i/=j => 0"

instance (Semiring s, Eq s) => Eq (Matrix s) where
  (==) MatAddId MatAddId = True
  (==) MatMulId MatMulId = True
  (==) (M as) MatAddId = (==) (M as) (matrixZero (order (M as)))
  (==) MatAddId (M bs) = (==) (matrixZero (order (M bs))) (M bs)
  (==) (M as) MatMulId = (==) (M as) (matrixUnit (order (M as)))
  (==) MatMulId (M bs) = (==) (matrixUnit (order (M bs))) (M bs)
  (==) (M as) (M bs) = as == bs

instance Semiring s => Semiring (Matrix s) where

  add MatAddId (M bs) = add (matrixZero (arrayOrder bs)) (M bs)
  add (M as) MatAddId = add (M as) (matrixZero (arrayOrder as))
  add MatMulId (M bs) = add (matrixUnit (arrayOrder bs)) (M bs)
  add (M as) MatMulId = add (M as) (matrixUnit (arrayOrder as))

  add as bs = pointwise as bs add

  zero = MatAddId

  mul MatAddId (M bs) = mul (matrixZero (arrayOrder bs)) (M bs)
  mul (M as) MatAddId = mul (M as) (matrixZero (arrayOrder as))
  mul MatMulId (M bs) = mul (matrixUnit (arrayOrder bs)) (M bs)
  mul (M as) MatMulId = mul (M as) (matrixUnit (arrayOrder as))

  mul (M as) (M bs) | ((arrayOrder as) /= (arrayOrder bs)) =
    error "Incompatible matrices"
  mul (M as) (M bs) | ((arrayOrder as) == (arrayOrder bs)) =
    M (array r [((i,j), computeOneElt (M as) (M bs) (i,j)) | (i,j) <- range r])
    where r = bounds as
    	  n = arrayOrder as

  unit = MatMulId

  nor (M as) (M bs) | ((arrayOrder as) /= (arrayOrder bs)) =
    error "Incompatible matrices"
  nor a MatAddId = nor a (matrixZero (order a))
  nor MatAddId a = nor (matrixZero (order a)) a

  nor MatMulId a = nor (matrixUnit (order a)) a
  nor a MatMulId = nor a (matrixUnit (order a))

  nor (M as) (M bs) | ((arrayOrder as) == (arrayOrder bs)) =
    foldl (&&) True (zipWith (nor) (elems as) (elems bs))

  lub (M as) (M bs)
     | bounds as == bounds bs = M (toArray ((snd.snd.bounds) as) (zipWith (lub) (elems as) (elems bs)))
     | otherwise = error "Incompatible matrices"

  power as k = squareMultiply mul (matrixUnit (order as)) as k

computeOneElt :: (Semiring s) => Matrix s -> Matrix s -> (Int,Int) -> s
computeOneElt (M as) (M bs) (i,j) | ((arrayOrder as) == (arrayOrder bs)) =
  foldl add zero [mul (as!(i,q)) (bs!(q,j)) | q <- [1..n]]
  where n = arrayOrder as



