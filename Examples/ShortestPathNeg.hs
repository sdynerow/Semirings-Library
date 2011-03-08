module Examples.ShortestPathNeg
( spnExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.ShortestPathNeg

spnExamples :: Int -> Matrix ShortestPathNeg
spnExamples 0 = M (toArray 5 [addId,SPN 1,addId,SPN 2,SPN 6
                  ,SPN 1,addId,SPN 3,SPN 5,SPN 4
                  ,addId,SPN 3,addId,SPN 4,addId
                  ,SPN 2,SPN 5,SPN 4,addId,addId
                  ,SPN 6,SPN 4,addId,addId,addId])

spnExamples 1 = M (toArray 9
	    [addId,addId,addId,addId,SPN 1,addId,SPN 2,SPN 3,SPN 1
            ,addId,addId,addId,SPN 3,SPN 2,addId,SPN 4,addId,addId
            ,addId,addId,addId,addId,addId,SPN 2,addId,addId,addId
            ,addId,SPN 3,addId,addId,addId,addId,addId,SPN 4,addId
            ,SPN 1,SPN 2,addId,addId,addId,SPN 8,addId,addId,addId
            ,addId,addId,SPN 2,addId,SPN 8,addId,addId,addId,addId
            ,SPN 2,SPN 4,addId,addId,addId,addId,addId,addId,addId
            ,SPN 3,addId,addId,SPN 4,addId,addId,addId,addId,SPN 6
            ,SPN 1,addId,addId,addId,addId,addId,addId,SPN 6,addId])

spnExamples 2 = M (toArray 5 [addId,SPN 2,addId,SPN 9,addId
                  ,SPN 2,addId,SPN 1,addId,addId 
                  ,addId,SPN 1,addId,SPN 2,addId
                  ,SPN 9,addId,SPN 2,addId,SPN 4
                  ,addId,addId,addId,SPN 4,addId])

spnExamples 3 = M (toArray 3 [addId, SPN 2, SPN 3
	    		     ,SPN 2, addId, SPN (-1)
		  	     ,SPN 3, SPN (-1), addId])

spnExamples 4 = M (toArray 5 [addId,SPN(-1), SPN 4,  addId, addId
	      	  	     ,addId,  addId, SPN 3,  SPN 2, SPN 2
			     ,addId,  addId, addId,  addId, addId
			     ,addId,  SPN 1, SPN 5,  addId, addId
			     ,addId,  addId, addId,SPN(-4), addId])

spnExamples 5 = M (toArray 5 [addId,SPN(-1),SPN(-1),  addId, SPN 4
	      	  	     ,SPN(-1),  addId, addId,  addId, SPN (-1)
			     ,addId,  addId, addId,SPN(-1), addId
			     ,addId,  addId, addId,  addId, SPN 4
			     ,addId, SPN(-1), addId,addId, addId])

spnExamples _ = error "Undefined example of ShortestPathNeg"