module Examples.Paths
( psExamples
) where

import Utils
import LaTeX

import Data.Set

import Algebra.Matrix
import Algebra.Semiring

import Policy.Paths

psExamples :: Int -> Matrix Paths
psExamples 0 = M (toArray 5 [ zero, PS(fromList([P [2]])), zero, zero, zero
                            , PS(fromList([P [1]])), zero, PS(fromList([P [3]])), PS(fromList([P [4]])), PS(fromList([P [5]]))
                            , zero, PS(fromList([P [2]])), zero, PS(fromList([P [4]])), PS(fromList([P [5]]))
                            , zero, PS(fromList([P [2]])), PS(fromList([P [3]])), zero, zero
                            , zero, PS(fromList([P [2]])), PS(fromList([P [3]])), zero, zero])

psExamples _ = error "Undefined example of Paths"






