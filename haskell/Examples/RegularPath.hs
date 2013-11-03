module Examples.RegularPath
( rpExamples
) where

import Utils
import LaTeX

import Algebra.Matrix
import Algebra.Semiring

import Policy.RegularPathAlgebra

rpExamples :: Int -> Matrix RegularPath
rpExamples 0 = M (toArray 5 [ zero,  V 2,  V 3, zero, zero
                            , zero, zero,  V 3,  V 4, zero
                            , zero,  V 2, zero,  V 4,  V 5
                            , zero, zero, zero, zero,  V 5
                            , zero, zero, zero,  V 4, zero])

rpExamples 1 = M (toArray 5 [ zero,  V 2, zero, zero, zero
                            , zero, zero, zero, zero, zero
                            , zero,  V 2, zero,  V 4, zero
                            ,  V 1, zero, zero, zero,  V 5
                            ,  V 1, zero,  V 3, zero, zero])

rpExamples 2 = M (toArray 5 [ zero,  V 2, zero, zero, zero
                            ,  V 1, zero,  V 3,  V 4,  V 5
                            , zero,  V 2, zero,  V 4,  V 5
                            , zero,  V 2,  V 3, zero, zero
                            , zero,  V 2,  V 3, zero, zero])

rpExamples 3 = M (toArray 6 [ zero,  V 2,  V 3, zero, zero, zero
                            ,  V 1, zero, zero,  V 4, zero, zero
                            ,  V 1, zero, zero,  V 4,  V 5, zero
                            , zero,  V 2,  V 3, zero, zero,  V 6
                            , zero, zero,  V 3, zero, zero,  V 6
                            , zero, zero, zero,  V 4,  V 5, zero])

rpExamples _ = error "Undefined example of RegularPath"






