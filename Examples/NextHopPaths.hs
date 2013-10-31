module Examples.NextHopPaths
( nhpExamples
) where

import Utils
import LaTeX

import Algebra.Matrix
import Algebra.Semiring

import Policy.NextHop
import Policy.NextHopPaths

nhpExamples :: Int -> Matrix NextHopPaths
nhpExamples 0 = M (toArray 5 [ NHP [S], NHP [X], NHP [X], NHP [X], NHP [X]
                             , NHP [X], NHP [S], NHP [X], NHP [X], NHP [X]
                             , NHP [X], NHP [X], NHP [S], NHP [X], NHP [X]
                             , NHP [X], NHP [X], NHP [X], NHP [S], NHP [X]
                             , NHP [X], NHP [X], NHP [X], NHP [X], NHP [S] ])

nhpExamples _ = error "Undefined example of NextHopPaths"






