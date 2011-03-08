module Algebra.Arborescences
( owa
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
        delta = \(i,j) -> antikronecker i j

f :: (Semiring s) => Matrix s -> Matrix s -> Matrix s
f a as = dmul (mul a as) (antiMulId (order as))

owa :: (Semiring s) => Matrix s -> Matrix s
owa as = foldl add (mulId) (take ((order as) - 1) terms)
  where terms = as : [f as ns | ns <- terms]
