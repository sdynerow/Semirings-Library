module Examples.ShortestPath
( spExamples
) where

import Algebra.Matrix
import Algebra.Semiring

import Algebra.Optimum

import Policy.ShortestPath

import LaTeX

spExamples :: Int -> Matrix ShortestPath
spExamples 0 = M [[addId,  SP 1, addId,  SP 2,  SP 6]
                 ,[ SP 1, addId,  SP 3,  SP 5,  SP 4]
                 ,[addId,  SP 3, addId,  SP 4, addId]
                 ,[ SP 2,  SP 5,  SP 4, addId, addId]
                 ,[ SP 6,  SP 4, addId, addId, addId]]

spExamples 1 = M [[addId, addId, addId, addId,  SP 1, addId,  SP 2,  SP 3,  SP 1]
                 ,[addId, addId, addId,  SP 3,  SP 2, addId,  SP 4, addId, addId]
                 ,[addId, addId, addId, addId, addId,  SP 2, addId, addId, addId]
                 ,[addId,  SP 3, addId, addId, addId, addId, addId,  SP 4, addId]
                 ,[ SP 1,  SP 2, addId, addId, addId,  SP 8, addId, addId, addId]
                 ,[addId, addId,  SP 2, addId,  SP 8, addId, addId, addId, addId]
                 ,[ SP 2,  SP 4, addId, addId, addId, addId, addId, addId, addId]
                 ,[ SP 3, addId, addId,  SP 4, addId, addId, addId, addId,  SP 6]
                 ,[ SP 1, addId, addId, addId, addId, addId, addId,  SP 6, addId]]

spExamples 2 = M [[addId,  SP 2, addId,  SP 9, addId]
                 ,[ SP 2, addId,  SP 1, addId, addId]
                 ,[addId,  SP 1, addId,  SP 2, addId]
                 ,[ SP 9, addId,  SP 2, addId,  SP 4]
                 ,[addId, addId, addId,  SP 4, addId]]

spExamples 3 = M [[addId,  SP 1, addId,  SP 1,  SP 2]
	         ,[ SP 2, addId,  SP 3, addId, addId]
	         ,[addId, addId, addId,  SP 4,  SP 3]
	         ,[ SP 1,  SP 2, addId, addId, addId]
	         ,[addId, addId, addId, addId, addId]]

spExamples 4 = M [[addId,  SP 1, addId, addId, addId]
	         ,[addId, addId, addId, addId, addId]
	         ,[addId,  SP 4, addId,  SP 1, addId]
	         ,[ SP 1, addId, addId, addId,  SP 1]
	         ,[ SP 5, addId,  SP 1, addId, addId]]

spExamples 5 = M [[addId,  SP 2,  SP 1, addId, addId]
	         ,[addId, addId, addId,  SP 1, addId]
	         ,[addId, addId, addId,  SP 3, addId]
	         ,[addId, addId, addId, addId,  SP 2]
	         ,[addId, addId, addId, addId, addId]]

spExamples _ = error "Undefined example of ShortestPath"

