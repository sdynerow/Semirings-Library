module Examples.Bandwidth
( bExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Metrics.Bandwidth

bExamples :: Int -> Matrix Bandwidth
bExamples 0 = M (toArray 5 [ zero,  B 1,  B 4,  zero,  B 5
                            , B 1,  zero,  B 4,  zero,  B 3
                            , B 4,  B 4,  zero,  B 9,  zero
                            , zero,  zero,  B 9,  zero,  B 2
                            , B 5,  B 3,  zero,  B 2,  zero])

-- First components of RIE paper example.
bExamples 1 = M (toArray 5 [ zero,  B 5,  zero,  zero,  zero
          	            , zero,  zero,  zero,  zero,  zero
          	            , zero,  B 5,  zero,  B 5,  zero
          	            , B 5,  zero,  zero,  zero, B 10
          	            ,B 10,  zero,  B 5,  zero,  zero])

bExamples 2 = M (toArray 5 [ zero,  B 8,  B 6,  zero,  zero
          	            , zero,  zero,  zero,  B 4,  zero
           	            , zero,  zero,  zero,  B 5,  zero
           	            , zero,  zero,  zero,  zero,  B 3
         	            , zero,  zero,  zero,  zero,  zero])

bExamples 3 = M (toArray 5 [ zero,  zero,  zero,  zero,  zero
                            , B 3,  zero,  zero,  zero,  zero
                            , zero,  B 5,  zero,  zero,  zero
                            , zero,  B 4,  zero,  zero,  zero
                            , zero,  zero,  B 6,  B 8,  zero])

bExamples 4 = M (toArray 4 [ zero,  B 1,  zero, zero
                            , zero,  zero,  B 2, B 1
                            , zero,  zero,  zero, B 2
                            , zero,  zero,  zero, zero])

bExamples 5 = M (toArray 5 [ zero, B 10, zero, zero, zero
	                    , B 10, zero, B 90, B 5, B 100
	                    , zero, B 90, zero, B 100, B 100
	                    , zero, B 5, B 100, zero, zero
       	                    , zero, B 100, B 100, zero, zero])

bExamples 6 = M (toArray 6 [ zero, B 2, B 1, zero, zero, zero
                            , zero, zero, zero, B 2, zero, zero
                            , zero, zero, zero, B 1, B 2, zero
                            , zero, zero, zero, zero, zero, B 1
                            , zero, zero, zero, zero, zero, B 2
                            , zero, zero, zero, zero, zero, zero])

bExamples 7 = M (toArray 5 [ zero, B 1, zero, zero, zero
                            , zero, zero, B 2, zero, B 1
                            , zero, zero, zero, B 3, B 2
                            , zero, zero, zero, zero, B 3
                            , zero, zero, zero, zero, zero])

bExamples 8 = M (toArray 5 [ unit, zero, zero, zero, zero
                            , zero, unit, zero, zero, zero
                            , zero, zero, unit, zero, zero
                            , zero, zero, zero, unit, zero
                            , zero, zero, zero, zero, unit])

-- Variant of first components of RIE paper example.
bExamples 9 = M (toArray 4 [ zero,  zero,  zero,  zero
          	            , B 5,  zero, B 10,  zero
          	            , B 5,  zero,  zero, B 10
          	            , B 5, B 10,  zero,  zero])

bExamples 10 = M (toArray 4 [ zero,  B 1,  zero, zero
                             , zero,  zero,  B 2, B 2
                             , zero,  zero,  zero, B 1
                             , zero,  zero,  zero, zero])

bExamples _ = error "Undefined example of Bandwidth"
