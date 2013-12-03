module Examples.NextHop
( nhExamples
) where

import Utils
import LaTeX

import Algebra.Matrix
import Algebra.Semiring

import PathInformations.NextHop

nhExamples :: Int -> Matrix NextHop
nhExamples 0 = M (toArray 5 [ zero, A 1 2, zero, zero, zero
                            , zero, zero, zero, zero, zero
                            , zero, A 3 2, zero, A 3 4, zero
                            , A 4 1, zero, zero, zero, A 4 5
                            , A 5 1, zero, A 5 3, zero, zero])

nhExamples _ = error "Undefined example of NextHop"






