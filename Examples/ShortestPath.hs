module Examples.ShortestPath
( spExamples
) where

import Utils
import LaTeX

import Algebra.Matrix
import Algebra.Semiring
import Algebra.Bideterminant

import Policy.ShortestPath

spExamples :: Int -> Matrix ShortestPath
spExamples 0 = M (toArray 5 [addId,  SP 1, addId,  SP 2,  SP 6
                            , SP 1, addId,  SP 3,  SP 5,  SP 4
                            ,addId,  SP 3, addId,  SP 4, addId
                            , SP 2,  SP 5,  SP 4, addId, addId
                            , SP 6,  SP 4, addId, addId, addId])

spExamples 1 = M (toArray 9
	   [addId, addId, addId, addId,  SP 1, addId,  SP 2,  SP 3,  SP 1
           ,addId, addId, addId,  SP 3,  SP 2, addId,  SP 4, addId, addId
           ,addId, addId, addId, addId, addId,  SP 2, addId, addId, addId
           ,addId,  SP 3, addId, addId, addId, addId, addId,  SP 4, addId
           , SP 1,  SP 2, addId, addId, addId,  SP 8, addId, addId, addId
           ,addId, addId,  SP 2, addId,  SP 8, addId, addId, addId, addId
           , SP 2,  SP 4, addId, addId, addId, addId, addId, addId, addId
           , SP 3, addId, addId,  SP 4, addId, addId, addId, addId,  SP 6
           , SP 1, addId, addId, addId, addId, addId, addId,  SP 6, addId])

spExamples 2 = M (toArray 5 [addId,  SP 2, addId,  SP 9, addId
                            , SP 2, addId,  SP 1, addId, addId
                            ,addId,  SP 1, addId,  SP 2, addId
                            , SP 9, addId,  SP 2, addId,  SP 4
                            ,addId, addId, addId,  SP 4, addId])

spExamples 3 = M (toArray 5 [addId,  SP 1, addId,  SP 1,  SP 2
	                    , SP 2, addId,  SP 3, addId, addId
	                    ,addId, addId, addId,  SP 4,  SP 3
	                    , SP 1,  SP 2, addId, addId, addId
	                    ,addId, addId, addId, addId, addId])

spExamples 4 = M (toArray 5 [addId,  SP 1, addId, addId, addId
	                    ,addId, addId, addId, addId, addId
	                    ,addId,  SP 4, addId,  SP 1, addId
	                    , SP 1, addId, addId, addId,  SP 1
	                    , SP 5, addId,  SP 1, addId, addId])

spExamples 5 = M (toArray 5 [addId,  SP 2,  SP 1, addId, addId
	                    ,addId, addId, addId,  SP 1, addId
	                    ,addId, addId, addId,  SP 3, addId
	                    ,addId, addId, addId, addId,  SP 2
	                    ,addId, addId, addId, addId, addId])

spExamples 6 = M (toArray 2 [SP 1, SP 2
	       	 	    ,SP 2, SP 4])

spExamples 7 = M (toArray 2 [SP 13, SP 3
	       	 	    ,SP 8, SP 6])

spExamples _ = error "Undefined example of ShortestPath"






