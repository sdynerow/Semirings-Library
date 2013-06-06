module Examples.BoundedShortestPath
( bspExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.BoundedShortestPath

bspExamples :: Int -> Matrix BoundedShortestPath
bspExamples 0 = M (toArray 5 [ zero, BSP 1,  zero, BSP 2, BSP 6
                             ,BSP 1,  zero, BSP 3, BSP 5, BSP 4
                             , zero, BSP 3,  zero, BSP 4,  zero
                             ,BSP 2, BSP 5, BSP 4,  zero,  zero
                             ,BSP 6, BSP 4,  zero,  zero,  zero])

bspExamples 1 = M (toArray 5 [ zero, BSP 2,  zero, BSP 9,  zero
                             ,BSP 2,  zero, BSP 1,  zero,  zero
                             , zero, BSP 1,  zero, BSP 2,  zero
                             ,BSP 9,  zero, BSP 2,  zero, BSP 4
                             , zero,  zero,  zero, BSP 4,  zero])

bspExamples 2 = M (toArray 5 [ zero, BSP 1,  zero, BSP 1, BSP 2
	                     ,BSP 2,  zero, BSP 3,  zero,  zero
	                     , zero,  zero,  zero, BSP 4, BSP 3
	                     ,BSP 1, BSP 2,  zero,  zero,  zero
	                     , zero,  zero,  zero,  zero,  zero])

bspExamples 3 = M (toArray 5 [ zero, BSP 1,  zero,  zero,  zero
	                     , zero,  zero,  zero,  zero,  zero
	                     , zero, BSP 4,  zero, BSP 1,  zero
	                     ,BSP 1,  zero,  zero,  zero, BSP 1
	                     ,BSP 5,  zero, BSP 1,  zero,  zero])

bspExamples 4 = M (toArray 5 [ zero, BSP 2, BSP 1,  zero,  zero
	                     , zero,  zero,  zero, BSP 1,  zero
	                     , zero,  zero,  zero, BSP 3,  zero
	                     , zero,  zero,  zero,  zero, BSP 2
	                     , zero,  zero,  zero,  zero,  zero])

bspExamples _ = error "Undefined example of ShortestPath"



