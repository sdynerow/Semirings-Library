module Examples.ShortestPathNeg
( spnExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.ShortestPathNeg

spnExamples :: Int -> Matrix ShortestPathNeg
spnExamples 0 = M (toArray 5 [ zero,SPN 1, zero,SPN 2,SPN 6
                  ,SPN 1, zero,SPN 3,SPN 5,SPN 4
                  , zero,SPN 3, zero,SPN 4, zero
                  ,SPN 2,SPN 5,SPN 4, zero, zero
                  ,SPN 6,SPN 4, zero, zero, zero])

spnExamples 1 = M (toArray 9
	    [ zero, zero, zero, zero,SPN 1, zero,SPN 2,SPN 3,SPN 1
            , zero, zero, zero,SPN 3,SPN 2, zero,SPN 4, zero, zero
            , zero, zero, zero, zero, zero,SPN 2, zero, zero, zero
            , zero,SPN 3, zero, zero, zero, zero, zero,SPN 4, zero
            ,SPN 1,SPN 2, zero, zero, zero,SPN 8, zero, zero, zero
            , zero, zero,SPN 2, zero,SPN 8, zero, zero, zero, zero
            ,SPN 2,SPN 4, zero, zero, zero, zero, zero, zero, zero
            ,SPN 3, zero, zero,SPN 4, zero, zero, zero, zero,SPN 6
            ,SPN 1, zero, zero, zero, zero, zero, zero,SPN 6, zero])

spnExamples 2 = M (toArray 5 [ zero,SPN 2, zero,SPN 9, zero
                  ,SPN 2, zero,SPN 1, zero, zero 
                  , zero,SPN 1, zero,SPN 2, zero
                  ,SPN 9, zero,SPN 2, zero,SPN 4
                  , zero, zero, zero,SPN 4, zero])

spnExamples 3 = M (toArray 3 [ zero, SPN 2, SPN 3
	    		     ,SPN 2,  zero, SPN (-1)
		  	     ,SPN 3, SPN (-1),  zero])

spnExamples 4 = M (toArray 5 [ zero,SPN(-1), SPN 4,   zero,  zero
	      	  	     , zero,   zero, SPN 3,  SPN 2, SPN 2
			     , zero,   zero,  zero,   zero,  zero
			     , zero,  SPN 1, SPN 5,   zero,  zero
			     , zero,   zero,  zero,SPN(-4),  zero])

spnExamples 5 = M (toArray 5 [ zero,SPN(-1),SPN(-1),   zero, SPN 4
	      	  	     ,SPN(-1),   zero,  zero,   zero, SPN (-1)
			     , zero,   zero,  zero,SPN(-1),  zero
			     , zero,   zero,  zero,   zero, SPN 4
			     , zero, SPN(-1),  zero, zero,  zero])

spnExamples 6 = M (toArray 3 [ zero, SPN (-3), SPN 1
	    		     ,SPN (-3),  zero, SPN 1
		  	     ,SPN 1, SPN 1,  zero])

spnExamples 7 = M (toArray 3 [ zero, SPN 0, SPN 4
	    		     ,SPN 0,  zero, SPN 4
		  	     ,SPN 4, SPN 4,  zero])

spnExamples 8 = M (toArray 3 [ zero, SPN 1, SPN 2
	    		     ,SPN 1,  zero, SPN (-2)
		  	     ,SPN 2, SPN (-2),  zero])

spnExamples 9 = M (toArray 3 [ zero, SPN 3, SPN 4
	    		     ,SPN 3,  zero, SPN 0
		  	     ,SPN 4, SPN 0,  zero])

spnExamples _ = error "Undefined example of ShortestPathNeg"