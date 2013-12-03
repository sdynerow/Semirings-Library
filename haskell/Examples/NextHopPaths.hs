module Examples.NextHopPaths
( nhpExamples
) where

import Utils
import LaTeX

import Algebra.Matrix
import Algebra.Semiring

import PathInformations.NextHop
import PathInformations.NextHopPaths

nhpExamples :: Int -> Matrix NextHopPaths
-- nhpExamples 0 = M (toArray 5 [ NHP 1 1 [[]], NHP 1 2 [[]], NHP [[]], NHP [[]], NHP [[]]
--                              , NHP 2 1 [[]], NHP 2 2 [[]], NHP [[]], NHP [[]], NHP [[]]
--                              , NHP 3 1 [[]], NHP 3 2 [[]], NHP [[]], NHP [[]], NHP [[]]
--                              , NHP 4 1 [[]], NHP 4 2 [[]], NHP [[]], NHP [[]], NHP [[]]
--                              , NHP 5 1 [[]], NHP 5 2 [[]], NHP [[]], NHP [[]], NHP [[]] ])

-- Solution to RLO
nhpExamples 1 = M (toArray 5 [ NHP 1 1 [[]], NHP 1 2 [[(A 1 2)]], NHP 1 3 [[]], NHP 1 4 [[]], NHP 1 5 [[]]
                             , NHP 2 1 [[]], NHP 2 2 [[]], NHP 2 3 [[]], NHP 2 4 [[]], NHP 2 5 [[]]
                             , NHP 3 1 [[(A 3 4)]], NHP 3 2 [[(A 3 4)]], NHP 3 3 [[]], NHP 3 4 [[(A 3 4)]], NHP 3 5 [[(A 3 4)]]
                             , NHP 4 1 [[(A 4 5)]], NHP 4 2 [[(A 4 5)]], NHP 4 3 [[(A 4 5)]], NHP 4 4 [[]], NHP 4 5 [[(A 4 5)]]
                             , NHP 5 1 [[(A 5 1)]], NHP 5 2 [[(A 5 3)]], NHP 5 3 [[(A 5 3)]], NHP 5 4 [[(A 5 3)]], NHP 5 5 [[]] ])

-- Solution to LLO
nhpExamples 2 = M (toArray 5 [ NHP 1 1 [[]], NHP 1 2 [[(A 1 2)]], NHP 1 3 [[]], NHP 1 4 [[]], NHP 1 5 [[]]
                             , NHP 2 1 [[]], NHP 2 2 [[]], NHP 2 3 [[]], NHP 2 4 [[]], NHP 2 5 [[]]
                             , NHP 3 1 [[(A 3 4)]], NHP 3 2 [[(A 3 4)]], NHP 3 3 [[]], NHP 3 4 [[(A 3 4)]], NHP 3 5 [[(A 3 4)]]
                             , NHP 4 1 [[(A 4 5)]], NHP 4 2 [[(A 4 1)]], NHP 4 3 [[(A 4 5)]], NHP 4 4 [[]], NHP 4 5 [[(A 4 5)]]
                             , NHP 5 1 [[(A 5 1)]], NHP 5 2 [[(A 5 3)]], NHP 5 3 [[(A 5 3)]], NHP 5 4 [[(A 5 3)]], NHP 5 5 [[]] ])

nhpExamples _ = error "Undefined example of NextHopPaths"






