module Examples.BoundedShortestPath
( bspExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.BoundedShortestPath

bspExamples :: Int -> Matrix BoundedShortestPath
bspExamples 0 = M (toArray 5 [addId, BSP 1, addId, BSP 2, BSP 6
                             ,BSP 1, addId, BSP 3, BSP 5, BSP 4
                             ,addId, BSP 3, addId, BSP 4, addId
                             ,BSP 2, BSP 5, BSP 4, addId, addId
                             ,BSP 6, BSP 4, addId, addId, addId])

bspExamples 1 = M (toArray 5 [addId, BSP 2, addId, BSP 9, addId
                             ,BSP 2, addId, BSP 1, addId, addId
                             ,addId, BSP 1, addId, BSP 2, addId
                             ,BSP 9, addId, BSP 2, addId, BSP 4
                             ,addId, addId, addId, BSP 4, addId])

bspExamples 2 = M (toArray 5 [addId, BSP 1, addId, BSP 1, BSP 2
	                     ,BSP 2, addId, BSP 3, addId, addId
	                     ,addId, addId, addId, BSP 4, BSP 3
	                     ,BSP 1, BSP 2, addId, addId, addId
	                     ,addId, addId, addId, addId, addId])

bspExamples 3 = M (toArray 5 [addId, BSP 1, addId, addId, addId
	                     ,addId, addId, addId, addId, addId
	                     ,addId, BSP 4, addId, BSP 1, addId
	                     ,BSP 1, addId, addId, addId, BSP 1
	                     ,BSP 5, addId, BSP 1, addId, addId])

bspExamples 4 = M (toArray 5 [addId, BSP 2, BSP 1, addId, addId
	                     ,addId, addId, addId, BSP 1, addId
	                     ,addId, addId, addId, BSP 3, addId
	                     ,addId, addId, addId, addId, BSP 2
	                     ,addId, addId, addId, addId, addId])

bspExamples _ = error "Undefined example of ShortestPath"



