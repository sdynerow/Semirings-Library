module Examples.ShortestPathNeg
( spnExamples
) where

import Algebra.Matrix
import Algebra.Semiring

import Algebra.Optimum

import Policy.ShortestPathNeg

spnExamples :: Int -> Matrix ShortestPathNeg
spnExamples 0 = M [[addId,  SPN 1, addId,  SPN 2,  SPN 6]
                  ,[ SPN 1, addId,  SPN 3,  SPN 5,  SPN 4]
                  ,[addId,  SPN 3, addId,  SPN 4, addId]
                  ,[ SPN 2,  SPN 5,  SPN 4, addId, addId]
                  ,[ SPN 6,  SPN 4, addId, addId, addId]]

spnExamples 1 = M [[addId, addId, addId, addId,  SPN 1, addId,  SPN 2,  SPN 3,  SPN 1]
                  ,[addId, addId, addId,  SPN 3,  SPN 2, addId,  SPN 4, addId, addId]
                  ,[addId, addId, addId, addId, addId,  SPN 2, addId, addId, addId]
                  ,[addId,  SPN 3, addId, addId, addId, addId, addId,  SPN 4, addId]
                  ,[ SPN 1,  SPN 2, addId, addId, addId,  SPN 8, addId, addId, addId]
                  ,[addId, addId,  SPN 2, addId,  SPN 8, addId, addId, addId, addId]
                  ,[ SPN 2,  SPN 4, addId, addId, addId, addId, addId, addId, addId]
                  ,[ SPN 3, addId, addId,  SPN 4, addId, addId, addId, addId,  SPN 6]
                  ,[ SPN 1, addId, addId, addId, addId, addId, addId,  SPN 6, addId]]

spnExamples 2 = M [[addId,  SPN 2, addId,  SPN 9, addId]
                  ,[ SPN 2, addId,  SPN 1, addId, addId]
                  ,[addId,  SPN 1, addId,  SPN 2, addId]
                  ,[ SPN 9, addId,  SPN 2, addId,  SPN 4]
                  ,[addId, addId, addId,  SPN 4, addId]]

spnExamples 3 = M [[addId, SPN 2, SPN 3]
		  ,[SPN 2, addId, SPN (-1)]
		  ,[SPN 3, SPN (-1), addId]]

spnExamples _ = error "Undefined example of ShortestPathNeg"