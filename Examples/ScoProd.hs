module Examples.ScoProd
( scowpspExample
, scolpspExample
) where

import Utils
import Graph
import LaTeX

import Algebra.Matrix
import Algebra.Semiring
import Algebra.Product.Scoped

import Policy.WidestPath
import Policy.ShortestPath
import Policy.LocalPreference

scowpspExample 0 = toMatrix (G (10,
	   [ (1,2, Int (SP 4)), (1,3, Int (SP 1))
	   , (2,1, Int (SP 4)), (2,3, Int (SP 1)), (2,4, Ext (WP 100, SP 0))
	   , (3,1, Int (SP 1)), (3,2, Int (SP 1)), (3,8, Ext (WP 10, SP 0))
	   , (4,2, Ext (WP 100, SP 0)), (4,5, Int (SP 1)), (4,6, Int (SP 1))
	   , (5,4, Int (SP 1)), (5,6, Int (SP 2))
	   , (6,4, Int (SP 1)), (6,5, Int (SP 2)), (6,7, Int (SP 4))
	   , (7,6, Int (SP 4)), (7,9, Ext (WP 100, SP 0))
	   , (8,3, Ext (WP 10, SP 0)), (8,9, Int (SP 3)), (8,10, Int (SP 1))
	   , (9,7, Ext (WP 100, SP 0)), (9,8, Int (SP 3)), (9,10, Int (SP 1))
	   , (10,8, Int (SP 1)), (10,9, Int (SP 1))
	   ]))

scolpspExample 0 = toMatrix (G (10,
	   [ (1,2, Int (SP 4)), (1,3, Int (SP 1))
	   , (2,1, Int (SP 4)), (2,3, Int (SP 1)), (2,4, Ext (LP 100, SP 0))
	   , (3,1, Int (SP 1)), (3,2, Int (SP 1)), (3,8, Ext (LP 10, SP 0))
	   , (4,2, Ext (LP 100, SP 0)), (4,5, Int (SP 1)), (4,6, Int (SP 1))
	   , (5,4, Int (SP 1)), (5,6, Int (SP 2))
	   , (6,4, Int (SP 1)), (6,5, Int (SP 2)), (6,7, Int (SP 4))
	   , (7,6, Int (SP 4)), (7,9, Ext (LP 100, SP 0))
	   , (8,3, Ext (LP 100, SP 0)), (8,9, Int (SP 3)), (8,10, Int (SP 1))
	   , (9,7, Ext (LP 100, SP 0)), (9,8, Int (SP 3)), (9,10, Int (SP 1))
	   , (10,8, Int (SP 1)), (10,9, Int (SP 1))
	   ]))




