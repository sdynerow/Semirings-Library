module Examples.UsablePath
( upExamples
) where

import Algebra.Matrix
import Algebra.Semiring

import Algebra.Optimum

import Policy.UsablePath

upExamples :: Int -> Matrix UsablePath
upExamples 0 = M [[(U 0), (U 0), (U 0), (U 1), (U 0)]
                ,[(U 0), (U 0), (U 0), (U 1), (U 0)]
    	        ,[(U 0), (U 0), (U 0), (U 0), (U 1)]
	        ,[(U 1), (U 1), (U 0), (U 0), (U 0)]
	        ,[(U 0), (U 0), (U 1), (U 0), (U 0)]]

upExamples 1 = M [[(U 0), (U 0), (U 0), (U 1), (U 0)]
                ,[(U 1), (U 0), (U 1), (U 0), (U 0)]
 	        ,[(U 0), (U 0), (U 0), (U 1), (U 1)]
	        ,[(U 0), (U 0), (U 0), (U 0), (U 1)]
	        ,[(U 0), (U 1), (U 0), (U 0), (U 0)]]

upExamples 2 = M [[(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)]
	        ,[(U 1), (U 0), (U 0), (U 1), (U 1), (U 0), (U 0)]
	        ,[(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)]
	        ,[(U 0), (U 1), (U 1), (U 0), (U 1), (U 1), (U 0)]
	        ,[(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)]
	        ,[(U 0), (U 0), (U 1), (U 1), (U 0), (U 0), (U 1)]
	        ,[(U 0), (U 0), (U 0), (U 0), (U 1), (U 1), (U 0)]]

upExamples 3 = M [[(U 0), (U 1), (U 1), (U 0), (U 0), (U 0), (U 0)]
	        ,[(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)]
	        ,[(U 1), (U 0), (U 0), (U 1), (U 0), (U 1), (U 0)]
	        ,[(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)]
	        ,[(U 0), (U 1), (U 0), (U 1), (U 0), (U 0), (U 1)]
	        ,[(U 0), (U 0), (U 1), (U 1), (U 0), (U 0), (U 1)]
	        ,[(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)]]

upExamples _ = error "Undefined example of Usable"
