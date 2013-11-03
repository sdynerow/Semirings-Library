module Examples.AuthenticatedSP
() where

import Algebra.Matrix
import Algebra.Semiring

import Algebra.Optimum

import Algebra.Constructs

import Policy.UsablePath
import Policy.ShortestPath

import LaTeX

top :: Semiring s => Int -> Matrix s
top n = genMatrixAddId n

bottom :: Semiring s => Int -> Matrix s
bottom n = M (replicate n (replicate n mulId))

shortestPaths :: Matrix ShortestPath
shortestPaths = M [[addId, SP 2,  SP 1, addId, addId]
	         ,[ SP 2, addId, addId,  SP 4, addId]
	         ,[ SP 1, addId, addId,  SP 1,  SP 2]
	         ,[addId,  SP 4,  SP 1, addId, addId]
		 ,[addId, addId,  SP 2, addId, addId]]

usablePaths :: Matrix UsablePath
usablePaths = M [map U [0,1,1,0,0]
	        ,map U [1,0,0,1,0]
	        ,map U [0,0,0,0,0]
	        ,map U [0,1,1,0,0]
		,map U [0,0,1,0,0]]

usablePathsSym = M [map U [0,1,0,0,0]
	           ,map U [1,0,0,1,0]
	           ,map U [0,0,0,0,0]
	           ,map U [0,1,0,0,0]
		   ,map U [0,0,0,0,0]]

authSP = lexico usablePaths shortestPaths

initGuessACCEPT :: Int -> Matrix (UsablePath,ShortestPath)
initGuessACCEPT i = lexico (top i) (genMatrixMulId i)

initGuessREJECT :: Int -> Matrix (UsablePath,ShortestPath)
initGuessREJECT i = lexico (bottom i) (genMatrixMulId i)

shortestPathsSubMatrix = M [[addId,  SP 2, addId, addId]
		       	   ,[ SP 2, addId,  SP 4, addId]
		       	   ,[addId,  SP 4, addId, addId]
			   ,[addId, addId, addId, addId]]






