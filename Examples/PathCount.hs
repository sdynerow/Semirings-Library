module Examples.PathCount
( pcExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.PathCount

pcExamples :: Int -> Matrix PathCount
pcExamples 0 = M (toArray 5 [ zero, PC 1, zero, zero, zero
                            , PC 1, zero, PC 1, PC 1, PC 1
                            , zero, PC 1, zero, PC 1, PC 1
                            , zero, PC 1, PC 1, zero, zero
                            , zero, PC 1, PC 1, zero, zero])
pcExamples 1 = M (toArray 5 [ zero, PC 1, PC 1, zero, PC 1
                            , zero, zero, PC 1, PC 1, zero
                            , zero, zero, zero, PC 1, PC 1
                            , zero, zero, zero, zero, PC 1
                            , zero, zero, zero, zero, zero])
pcExamples 2 = M (toArray 5 [ zero, PC 1, PC 1, zero, PC 1
                            , zero, zero, PC 1, PC 1, zero
                            , zero, zero, zero, zero, PC 1
                            , zero, zero, zero, zero, PC 1
                            , zero, zero, zero, zero, zero])
               
pcExamples _ = error "Undefined example of PathCount"






