module Examples.DirProd
( dirExample
) where

import Utils
import Graph
import LaTeX

import Algebra.Matrix
import Algebra.Semiring
import Algebra.Product.Direct

import Policy.ShortestPath
import Policy.WidestPath

dirExample 0 = toMatrix (G (11,
	   [ (1,2, Dir (SP 2, WP 100)), (1,4, Dir (SP 1, WP 10))
	   , (2,1, Dir (SP 2, WP 100)), (2,3, Dir (SP 1, WP 1000)), (2,5, Dir (SP 3, WP 100)), (2,6, Dir (SP 4, WP 100))
	   , (3,2, Dir (SP 1, WP 1000)), (3,6, Dir (SP 2, WP 10)), (3,7, Dir (SP 1, WP 1000))
	   , (4,1, Dir (SP 1, WP 10)), (4,5, Dir (SP 2, WP 1000)), (4,8, Dir (SP 1, WP 10))
	   , (5,2, Dir (SP 3, WP 100)), (5,4, Dir (SP 2, WP 1000)), (5,6, Dir (SP 2, WP 100)), (5,8, Dir (SP 1, WP 100))
	   , (6,2, Dir (SP 4, WP 100)), (6,3, Dir (SP 2, WP 10)), (6,5, Dir (SP 2, WP 100)), (6,7, Dir (SP 5, WP 100)), (6,10, Dir (SP 2, WP 10)), (6,11, Dir (SP 2, WP 100))
	   , (7,3, Dir (SP 1, WP 1000)), (7,6, Dir (SP 5, WP 100)), (7,11, Dir (SP 1, WP 10))
	   , (8,4, Dir (SP 1, WP 10)), (8,5, Dir (SP 1, WP 100)), (8,9, Dir (SP 2, WP 10))
	   , (9,8, Dir (SP 2, WP 10)), (9,10,Dir (SP 1, WP 100))
	   , (10,6, Dir (SP 2, WP 10)), (10,9, Dir (SP 1, WP 100)), (10,11, Dir (SP 3, WP 10000))
	   , (11,6, Dir (SP 2, WP 100)), (11,7, Dir (SP 1, WP 10)), (11,10, Dir (SP 3, WP 10000))
	   ]))