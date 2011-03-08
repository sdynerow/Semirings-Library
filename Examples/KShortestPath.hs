module Examples.KShortestPath
( kspExamples
) where

import Data.Array

import Algebra.Matrix
import Algebra.Semiring

import Policy.ShortestPath
import Policy.KShortestPath

import Examples.ShortestPath

toKSP :: Matrix ShortestPath -> Int -> Matrix KShortestPath
toKSP (M ms) k =
    M (array b [(idx, KSP k ((ms!idx):(replicate (k-1) addId)))| idx <- range b])
  where b = bounds ms

kspExamples :: Int -> Matrix KShortestPath
kspExamples 0 = toKSP (spExamples 0) 4
kspExamples 1 = toKSP (spExamples 1) 4
kspExamples 2 = toKSP (spExamples 2) 4
kspExamples 3 = toKSP (spExamples 3) 4
kspExamples 4 = toKSP (spExamples 4) 4
kspExamples 5 = toKSP (spExamples 5) 4
kspExamples 6 = toKSP (spExamples 6) 4
kspExamples 7 = toKSP (spExamples 7) 4
kspExamples _ = error "Undefined example number"