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

psExamples 1 = M (toArray 5 [ zero, PS(fromList([P [2]])), zero, zero, zero
                            , zero, zero, zero, zero, zero
                            , zero, PS(fromList([P [2]])), zero, PS(fromList([P [4]])), zero
                            , PS(fromList([P [1]])), zero, zero, zero, PS(fromList([P [5]]))
                            , PS(fromList([P [1]])), zero, PS(fromList([P [3]])), zero, zero])

psExamples 2 = M (toArray 5 [ PS(fromList([P [1]])), zero, zero, zero, zero
                            , zero, PS(fromList([P [2]])), zero, zero, zero
                            , zero, zero, PS(fromList([P [3]])), zero, zero
                            , zero, zero, zero, PS(fromList([P [4]])), zero
                            , zero, zero, zero, zero, PS(fromList([P [5]]))])

-- CTC path components
psExamples 3 = M (toArray 4 [ zero, PS(fromList([P [2]])), PS(fromList([P [3]])), zero
                            , PS(fromList([P [1]])), zero, PS(fromList([P [3]])), PS(fromList([P [4]]))
                            , PS(fromList([P [1]])), PS(fromList([P [2]])), zero, PS(fromList([P [4]]))
                            , zero, PS(fromList([P [2]])), PS(fromList([P [3]])), zero])

psExamples 4 = M (toArray 4 [ zero, PS(fromList([P [2]])), PS(fromList([P [3]])), zero
                            , PS(fromList([P [1]])), zero, PS(fromList([P [3]])), zero
                            , PS(fromList([P [1]])), PS(fromList([P [2]])), zero, PS(fromList([P [4]]))
                            , zero, zero, PS(fromList([P [3]])), zero])

psExamples 5 = M (toArray 4 [ PS(fromList([P [1]])), zero, zero, zero
                            , zero, PS(fromList([P [2]])), zero, zero
                            , zero, zero, PS(fromList([P [3]])), zero
                            , zero, zero, zero, PS(fromList([P [4]]))])

psExamples 6 = M (toArray 4 [ zero, zero, zero, zero
                            , PS(fromList([P [1]])), zero, PS(fromList([P [3]])), zero
                            , PS(fromList([P [1]])), zero, zero, PS(fromList([P [4]]))
                            , PS(fromList([P [1]])), PS(fromList([P [2]])), zero, zero])

psExamples _ = error "Undefined example of Paths"






