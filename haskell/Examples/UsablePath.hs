module Examples.UsablePath
( upExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Algebra.Optimum

import Policy.UsablePath

upExamples :: Int -> Matrix UsablePath
upExamples 0 = M (toArray 5 [(U 0), (U 0), (U 0), (U 1), (U 0)
                ,(U 0), (U 0), (U 0), (U 1), (U 0)
    	        ,(U 0), (U 0), (U 0), (U 0), (U 1)
	        ,(U 1), (U 1), (U 0), (U 0), (U 0)
	        ,(U 0), (U 0), (U 1), (U 0), (U 0)])

upExamples 1 = M (toArray 5 [(U 0), (U 0), (U 0), (U 1), (U 0)
                ,(U 1), (U 0), (U 1), (U 0), (U 0)
 	        ,(U 0), (U 0), (U 0), (U 1), (U 1)
	        ,(U 0), (U 0), (U 0), (U 0), (U 1)
	        ,(U 0), (U 1), (U 0), (U 0), (U 0)])

upExamples 2 = M (toArray 7 [(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)
	        ,(U 1), (U 0), (U 0), (U 1), (U 1), (U 0), (U 0)
	        ,(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)
	        ,(U 0), (U 1), (U 1), (U 0), (U 1), (U 1), (U 0)
	        ,(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)
	        ,(U 0), (U 0), (U 1), (U 1), (U 0), (U 0), (U 1)
	        ,(U 0), (U 0), (U 0), (U 0), (U 1), (U 1), (U 0)])

upExamples 3 = M (toArray 7 [(U 0), (U 1), (U 1), (U 0), (U 0), (U 0), (U 0)
	        ,(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)
	        ,(U 1), (U 0), (U 0), (U 1), (U 0), (U 1), (U 0)
	        ,(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)
	        ,(U 0), (U 1), (U 0), (U 1), (U 0), (U 0), (U 1)
	        ,(U 0), (U 0), (U 1), (U 1), (U 0), (U 0), (U 1)
	        ,(U 0), (U 0), (U 0), (U 0), (U 0), (U 0), (U 0)])

upExamples _ = error "Undefined example of Usable"
