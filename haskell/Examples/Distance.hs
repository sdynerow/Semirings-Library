module Examples.Distance
( dExamples
) where

import Utils
import LaTeX

import Algebra.Matrix
import Algebra.Semiring

import Metrics.Distance

dExamples :: Int -> Matrix Distance
dExamples 0 = M (toArray 5 [zero,  D 1, zero,  D 2,  D 6
                            , D 1, zero,  D 3,  D 5,  D 4
                            ,zero,  D 3, zero,  D 4, zero
                            , D 2,  D 5,  D 4, zero, zero
                            , D 6,  D 4, zero, zero, zero])

dExamples 1 = M (toArray 9
	   [ zero, zero, zero, zero, D 1, zero, D 2, D 3, D 1
           , zero, zero, zero, D 3, D 2, zero, D 4, zero, zero
           , zero, zero, zero, zero, zero, D 2, zero, zero, zero
           , zero, D 3, zero, zero, zero, zero, zero, D 4, zero
           , D 1, D 2, zero, zero, zero, D 8, zero, zero, zero
           , zero, zero, D 2, zero, D 8, zero, zero, zero, zero
           , D 2, D 4, zero, zero, zero, zero, zero, zero, zero
           , D 3, zero, zero, D 4, zero, zero, zero, zero, D 6
           , D 1, zero, zero, zero, zero, zero, zero, D 6, zero])

dExamples 2 = M (toArray 5 [ zero, D 2, zero, D 9, zero
                            , D 2, zero, D 1, zero, zero
                            , zero, D 1, zero, D 2, zero
                            , D 9, zero, D 2, zero, D 4
                            , zero, zero, zero, D 4, zero])

dExamples 3 = M (toArray 5 [ zero, D 1, zero, D 1, D 2
	                    , D 2, zero, D 3, zero, zero
	                    , zero, zero, zero, D 4, D 3
	                    , D 1, D 2, zero, zero, zero
	                    , zero, zero, zero, zero, zero])

-- Second components of example from RIE paper.
dExamples 4 = M (toArray 5 [ zero, D 1, zero, zero, zero
	                    , zero, zero, zero, zero, zero
	                    , zero, D 4, zero, D 1, zero
	                    , D 1, zero, zero, zero, D 1
	                    , D 5, zero, D 1, zero, zero])

dExamples 5 = M (toArray 5 [ zero, D 2, D 1, zero, zero
	                    , zero, zero, zero, D 1, zero
	                    , zero, zero, zero, D 3, zero
	                    , zero, zero, zero, zero, D 2
	                    , zero, zero, zero, zero, zero])

dExamples 6 = M (toArray 2 [D 1, D 2
	       	 	    ,D 2, D 4])

dExamples 7 = M (toArray 2 [D 13, D 3
	       	 	    ,D  8, D 6])

dExamples 8 = transpose (M (toArray 5 [ zero, D 2, zero, zero, zero
	                               , zero, zero, D 3, D 1, zero
	                               , zero, zero, zero, zero, D 1
	                               , zero, zero, zero, zero, D 2
       	                               , zero, zero, zero, zero, zero]))

dExamples 9 = M (toArray 4 [ zero, D 1, zero, zero
	       	 	    , zero, zero, D 1, D 1
	       	 	    , zero, zero, zero, D 1
			    , zero, zero, zero, zero])

dExamples 10 = M (toArray 5 [ zero, D 1, zero, zero, zero
	                     , D 1, zero, D 2, D 1, D 1
	                     , zero, D 2, zero, D 1, D 1
	                     , zero, D 1, D 1, zero, zero
       	                     , zero, D 1, D 1, zero, zero])

dExamples 11 = M (toArray 5 [ zero, D 1, zero, zero, zero
	       	 	     , zero, zero, D 1, zero, D 1
	       	 	     , zero, zero, zero, D 1, D 1
                             , zero, zero, zero, zero, D 1
                             , zero, zero, zero, zero, zero])

dExamples 12 = M (toArray 5 [ unit, zero, zero, zero, zero
                             , zero, unit, zero, zero, zero
                             , zero, zero, unit, zero, zero
                             , zero, zero, zero, unit, zero
                             , zero, zero, zero, zero, unit])

-- CTC old matrix
dExamples 13 = M (toArray 4 [ zero, D 1, D 1, zero
	       	  	     , D 1, zero, D 1, D 1
	       	  	     , D 1, D 1, zero, D 10
		 	     , zero, D 1, D 10, zero])

-- CTC new matrix
dExamples 14 = M (toArray 4 [ zero, D 1, D 1, zero
	       	  	     , D 1, zero, D 1, zero
	       	  	     , D 1, D 1, zero, D 10
		 	     , zero, zero, D 10, zero])

dExamples 15 = M (toArray 4 [ unit, zero, zero, zero
                             , zero, unit, zero, zero
                             , zero, zero, unit, zero
                             , zero, zero, zero, unit])

-- Variant of second components of example from RIE paper.
dExamples 16 = M (toArray 4 [ zero, zero, zero, zero
	                     , D 2, zero, D 1, zero
	                     , D 2, zero, zero, D 1
	                     , D 2, D 1, zero, zero])

dExamples 17 = M (toArray 5 [ zero, D 1, D 2, zero, D 4
	                    , zero, zero, D 1, D 3, zero
	                    , zero, zero, zero, D 1, D 2
	                    , zero, zero, zero, zero, D 1
	                    , zero, zero, zero, zero, zero])

dExamples 18 = M (toArray 5 [ unit, zero, zero, zero, D 4
	                    , zero, unit, zero, zero, zero
	                    , zero, zero, unit, zero, zero
	                    , zero, zero, zero, unit, zero
	                    , zero, zero, zero, zero, unit])

dExamples _ = error "Undefined example of Distance"
