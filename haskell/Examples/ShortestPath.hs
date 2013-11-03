module Examples.ShortestPath
( spExamples
) where

import Utils
import LaTeX

import Algebra.Matrix
import Algebra.Semiring

import Policy.ShortestPath

spExamples :: Int -> Matrix ShortestPath
spExamples 0 = M (toArray 5 [zero,  SP 1, zero,  SP 2,  SP 6
                            , SP 1, zero,  SP 3,  SP 5,  SP 4
                            ,zero,  SP 3, zero,  SP 4, zero
                            , SP 2,  SP 5,  SP 4, zero, zero
                            , SP 6,  SP 4, zero, zero, zero])

spExamples 1 = M (toArray 9
	   [ zero, zero, zero, zero, SP 1, zero, SP 2, SP 3, SP 1
           , zero, zero, zero, SP 3, SP 2, zero, SP 4, zero, zero
           , zero, zero, zero, zero, zero, SP 2, zero, zero, zero
           , zero, SP 3, zero, zero, zero, zero, zero, SP 4, zero
           , SP 1, SP 2, zero, zero, zero, SP 8, zero, zero, zero
           , zero, zero, SP 2, zero, SP 8, zero, zero, zero, zero
           , SP 2, SP 4, zero, zero, zero, zero, zero, zero, zero
           , SP 3, zero, zero, SP 4, zero, zero, zero, zero, SP 6
           , SP 1, zero, zero, zero, zero, zero, zero, SP 6, zero])

spExamples 2 = M (toArray 5 [ zero, SP 2, zero, SP 9, zero
                            , SP 2, zero, SP 1, zero, zero
                            , zero, SP 1, zero, SP 2, zero
                            , SP 9, zero, SP 2, zero, SP 4
                            , zero, zero, zero, SP 4, zero])

spExamples 3 = M (toArray 5 [ zero, SP 1, zero, SP 1, SP 2
	                    , SP 2, zero, SP 3, zero, zero
	                    , zero, zero, zero, SP 4, SP 3
	                    , SP 1, SP 2, zero, zero, zero
	                    , zero, zero, zero, zero, zero])

-- Second components of example from RIE paper.
spExamples 4 = M (toArray 5 [ zero, SP 1, zero, zero, zero
	                    , zero, zero, zero, zero, zero
	                    , zero, SP 4, zero, SP 1, zero
	                    , SP 1, zero, zero, zero, SP 1
	                    , SP 5, zero, SP 1, zero, zero])

spExamples 5 = M (toArray 5 [ zero, SP 2, SP 1, zero, zero
	                    , zero, zero, zero, SP 1, zero
	                    , zero, zero, zero, SP 3, zero
	                    , zero, zero, zero, zero, SP 2
	                    , zero, zero, zero, zero, zero])

spExamples 6 = M (toArray 2 [SP 1, SP 2
	       	 	    ,SP 2, SP 4])

spExamples 7 = M (toArray 2 [SP 13, SP 3
	       	 	    ,SP  8, SP 6])

spExamples 8 = transpose (M (toArray 5 [ zero, SP 2, zero, zero, zero
	                               , zero, zero, SP 3, SP 1, zero
	                               , zero, zero, zero, zero, SP 1
	                               , zero, zero, zero, zero, SP 2
       	                               , zero, zero, zero, zero, zero]))

spExamples 9 = M (toArray 4 [ zero, SP 1, zero, zero
	       	 	    , zero, zero, SP 1, SP 1
	       	 	    , zero, zero, zero, SP 1
			    , zero, zero, zero, zero])

spExamples 10 = M (toArray 5 [ zero, SP 1, zero, zero, zero
	                     , SP 1, zero, SP 2, SP 1, SP 1
	                     , zero, SP 2, zero, SP 1, SP 1
	                     , zero, SP 1, SP 1, zero, zero
       	                     , zero, SP 1, SP 1, zero, zero])

spExamples 11 = M (toArray 5 [ zero, SP 1, zero, zero, zero
	       	 	     , zero, zero, SP 1, zero, SP 1
	       	 	     , zero, zero, zero, SP 1, SP 1
                             , zero, zero, zero, zero, SP 1
                             , zero, zero, zero, zero, zero])

spExamples 12 = M (toArray 5 [ unit, zero, zero, zero, zero
                             , zero, unit, zero, zero, zero
                             , zero, zero, unit, zero, zero
                             , zero, zero, zero, unit, zero
                             , zero, zero, zero, zero, unit])

-- CTC old matrix
spExamples 13 = M (toArray 4 [ zero, SP 1, SP 1, zero
	       	  	     , SP 1, zero, SP 1, SP 1
	       	  	     , SP 1, SP 1, zero, SP 10
		 	     , zero, SP 1, SP 10, zero])

-- CTC new matrix
spExamples 14 = M (toArray 4 [ zero, SP 1, SP 1, zero
	       	  	     , SP 1, zero, SP 1, zero
	       	  	     , SP 1, SP 1, zero, SP 10
		 	     , zero, zero, SP 10, zero])

spExamples 15 = M (toArray 4 [ unit, zero, zero, zero
                             , zero, unit, zero, zero
                             , zero, zero, unit, zero
                             , zero, zero, zero, unit])

-- Variant of second components of example from RIE paper.
spExamples 16 = M (toArray 4 [ zero, zero, zero, zero
	                     , SP 2, zero, SP 1, zero
	                     , SP 2, zero, zero, SP 1
	                     , SP 2, SP 1, zero, zero])

spExamples _ = error "Undefined example of ShortestPath"
