module Examples.WidestPath
( wpExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.WidestPath

wpExamples :: Int -> Matrix WidestPath
wpExamples 0 = M (toArray 5 [ zero,  WP 1,  WP 4,  zero,  WP 5
                            , WP 1,  zero,  WP 4,  zero,  WP 3
                            , WP 4,  WP 4,  zero,  WP 9,  zero
                            , zero,  zero,  WP 9,  zero,  WP 2
                            , WP 5,  WP 3,  zero,  WP 2,  zero])

wpExamples 1 = M (toArray 5 [ zero,  WP 5,  zero,  zero,  zero
          	            , zero,  zero,  zero,  zero,  zero
          	            , zero,  WP 5,  zero,  WP 5,  zero
          	            , WP 5,  zero,  zero,  zero, WP 10
          	            ,WP 10,  zero,  WP 5,  zero,  zero])

wpExamples 2 = M (toArray 5 [ zero,  WP 8,  WP 6,  zero,  zero
          	            , zero,  zero,  zero,  WP 4,  zero
           	            , zero,  zero,  zero,  WP 5,  zero
           	            , zero,  zero,  zero,  zero,  WP 3
         	            , zero,  zero,  zero,  zero,  zero])

wpExamples 3 = M (toArray 5 [ zero,  zero,  zero,  zero,  zero
                            , WP 3,  zero,  zero,  zero,  zero
                            , zero,  WP 5,  zero,  zero,  zero
                            , zero,  WP 4,  zero,  zero,  zero
                            , zero,  zero,  WP 6,  WP 8,  zero])

wpExamples 4 = M (toArray 4 [ zero,  WP 1,  zero, zero
                            , zero,  zero,  WP 2, WP 1
                            , zero,  zero,  zero, WP 2
                            , zero,  zero,  zero, zero])

wpExamples 5 = M (toArray 5 [ zero, WP 10, zero, zero, zero
	                    , WP 10, zero, WP 90, WP 5, WP 100
	                    , zero, WP 90, zero, WP 100, WP 100
	                    , zero, WP 5, WP 100, zero, zero
       	                    , zero, WP 100, WP 100, zero, zero])

wpExamples 6 = M (toArray 6 [ zero, WP 2, WP 1, zero, zero, zero
                            , zero, zero, zero, WP 2, zero, zero
                            , zero, zero, zero, WP 1, WP 2, zero
                            , zero, zero, zero, zero, zero, WP 1
                            , zero, zero, zero, zero, zero, WP 2
                            , zero, zero, zero, zero, zero, zero])

wpExamples 7 = M (toArray 5 [ zero, WP 1, zero, zero, zero
                            , zero, zero, WP 2, zero, WP 1
                            , zero, zero, zero, WP 3, WP 2
                            , zero, zero, zero, zero, WP 3
                            , zero, zero, zero, zero, zero])

wpExamples _ = error "Undefined example of WidestPath"
