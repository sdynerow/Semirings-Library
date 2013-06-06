module Examples.MostReliablePath
( mrExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.MostReliablePath

mrExamples :: Int -> Matrix MostReliablePath
mrExamples 0 = M (toArray 5 [  zero , MR 0.1, MR 0.4,  zero , MR 0.5
                            , MR 0.1,  zero , MR 0.4,  zero , MR 0.3
                            , MR 0.4, MR 0.4,  zero , MR 0.9,  zero
                            ,  zero ,  zero , MR 0.9,  zero , MR 0.2
                            , MR 0.5, MR 0.3,  zero , MR 0.2,  zero])

mrExamples _ = error "Undefined example of MostReliablePath"
