module Examples.ScoProd
( scowpspExample
, scolpspExample
, scospspExample
, scolphcspExample
) where

import Utils
import Graph
import LaTeX

import Algebra.Matrix
import Algebra.Semiring
import Algebra.Product.Scoped
import Algebra.Product.Lexico

import Policy.WidestPath
import Policy.ShortestPath
import Policy.LocalPreference

scowpspExample 0 = toMatrix (G (10,
	   [ (1,2, Int (mulId, SP 4)), (1,3, Int (mulId, SP 1))
	   , (2,1, Int (mulId, SP 4)), (2,3, Int (mulId, SP 1)), (2,4, Ext (WP 100, SP 0))
	   , (3,1, Int (mulId, SP 1)), (3,2, Int (mulId, SP 1)), (3,8, Ext (WP 10, SP 0))
	   , (4,2, Ext (WP 100, SP 0)), (4,5, Int (mulId, SP 1)), (4,6, Int (mulId, SP 1))
	   , (5,4, Int (mulId, SP 1)), (5,6, Int (mulId, SP 2))
	   , (6,4, Int (mulId, SP 1)), (6,5, Int (mulId, SP 2)), (6,7, Int (mulId, SP 4))
	   , (7,6, Int (mulId, SP 4)), (7,9, Ext (WP 100, SP 0))
	   , (8,3, Ext (WP 10, SP 0)), (8,9, Int (mulId, SP 3)), (8,10, Int (mulId, SP 1))
	   , (9,7, Ext (WP 100, SP 0)), (9,8, Int (mulId, SP 3)), (9,10, Int (mulId, SP 1))
	   , (10,8, Int (mulId, SP 1)), (10,9, Int (mulId, SP 1))
	   ]))

scolpspExample 0 = toMatrix (G (10,
	   [ (1,2, Int (mulId, SP 4)), (1,3, Int (mulId, SP 1))
	   , (2,1, Int (mulId, SP 4)), (2,3, Int (mulId, SP 1)), (2,4, Ext (LP 100, SP 0))
	   , (3,1, Int (mulId, SP 1)), (3,2, Int (mulId, SP 1)), (3,8, Ext (LP 10, SP 0))
	   , (4,2, Ext (LP 100, SP 0)), (4,5, Int (mulId, SP 1)), (4,6, Int (mulId, SP 1))
	   , (5,4, Int (mulId, SP 1)), (5,6, Int (mulId, SP 2))
	   , (6,4, Int (mulId, SP 1)), (6,5, Int (mulId, SP 2)), (6,7, Int (mulId, SP 4))
	   , (7,6, Int (mulId, SP 4)), (7,9, Ext (LP 100, SP 0))
	   , (8,3, Ext (LP 100, SP 0)), (8,9, Int (mulId, SP 3)), (8,10, Int (mulId, SP 1))
	   , (9,7, Ext (LP 100, SP 0)), (9,8, Int (mulId, SP 3)), (9,10, Int (mulId, SP 1))
	   , (10,8, Int (mulId, SP 1)), (10,9, Int (mulId, SP 1))
	   ]))

scolpspExample 1 = toMatrix (G (10,
	   [ (1,2, Int (mulId, SP 4)), (1,3, Int (mulId, SP 1))
	   , (2,1, Int (mulId, SP 4)), (2,3, Int (mulId, SP 1)), (2,4, Ext (LP 100, SP 0))
	   , (3,1, Int (mulId, SP 1)), (3,2, Int (mulId, SP 1)), (3,8, Ext (LP 10, SP 0))
	   , (4,2, Ext (LP 100, SP 0)), (4,5, Int (mulId, SP 1)), (4,6, Int (mulId, SP 1))
	   , (5,4, Int (mulId, SP 1)), (5,6, Int (mulId, SP 2))
	   , (6,4, Int (mulId, SP 1)), (6,5, Int (mulId, SP 2)), (6,7, Int (mulId, SP 4))
	   , (7,6, Int (mulId, SP 4)), (7,9, Ext (LP 100, SP 0))
	   , (8,3, Ext (LP 10, SP 0)), (8,9, Int (mulId, SP 3)), (8,10, Int (mulId, SP 1))
	   , (9,7, Ext (LP 100, SP 0)), (9,8, Int (mulId, SP 3)), (9,10, Int (mulId, SP 1))
	   , (10,8, Int (mulId, SP 1)), (10,9, Int (mulId, SP 1))
	   ]))

scolphcspExample 0 = toMatrix (G (10,
	   [ (1,2, Int (mulId, SP 4)), (1,3, Int (mulId, SP 1))
	   , (2,1, Int (mulId, SP 4)), (2,3, Int (mulId, SP 1)), (2,4, Ext (Lex(LP 10, SP 1), SP 0))
	   , (3,1, Int (mulId, SP 1)), (3,2, Int (mulId, SP 1)), (3,8, Ext (Lex(LP 5, SP 1), SP 0))
	   , (4,2, Ext (Lex(LP 10, SP 1), SP 0)), (4,5, Int (mulId, SP 1)), (4,6, Int (mulId, SP 1))
	   , (5,4, Int (mulId, SP 1)), (5,6, Int (mulId, SP 2))
	   , (6,4, Int (mulId, SP 1)), (6,5, Int (mulId, SP 2)), (6,7, Int (mulId, SP 4))
	   , (7,6, Int (mulId, SP 4)), (7,9, Ext (Lex(LP 10, SP 1), SP 0))
	   , (8,3, Ext (Lex(LP 5, SP 1), SP 0)), (8,9, Int (mulId, SP 3)), (8,10, Int (mulId, SP 1))
	   , (9,7, Ext (Lex(LP 10, SP 1), SP 0)), (9,8, Int (mulId, SP 3)), (9,10, Int (mulId, SP 1))
	   , (10,8, Int (mulId, SP 1)), (10,9, Int (mulId, SP 1))
	   ]))

scospspExample 0 = toMatrix (G (29,
-- Domain 1
	       [ (1,2, Int (mulId, SP 1)), (1,3, Int (mulId, SP 3))
	       , (2,1, Int (mulId, SP 1)), (2,3, Int (mulId, SP 1)), (2,5, Int (mulId, SP 1)), (2,6, Ext (SP 1, mulId))
	       , (3,1, Int (mulId, SP 3)), (3,2, Int (mulId, SP 1)), (3,4, Int (mulId, SP 2)), (3,5, Int (mulId, SP 2))
	       , (4,3, Int (mulId, SP 2)), (4,5, Int (mulId, SP 4)), (4,18, Ext (SP 1, mulId))
	       , (5,2, Int (mulId, SP 1)), (5,3, Int (mulId, SP 2)), (5,4, Int (mulId, SP 4)), (5,12, Ext (SP 2, mulId))
-- Domain 2
	       , (6,2, Ext (SP 1, mulId)), (6,7, Int (mulId, SP 1)), (6,8, Int (mulId, SP 4))
	       , (7,6, Int (mulId, SP 1)), (7,10, Int (mulId, SP 1))
	       , (8,6, Int (mulId, SP 4)), (8,9, Int (mulId, SP 1)), (8,10, Int (mulId, SP 1)), (8,11, Int (mulId, SP 4))
	       , (9,8, Int (mulId, SP 1)), (9,14, Ext (SP 1, mulId))
	       , (10,7, Int (mulId, SP 1)), (10,8, Int (mulId, SP 1)), (10,11, Int (mulId, SP 2))
	       , (11,8, Int (mulId, SP 4)), (11,10, Int (mulId, SP 2)), (11,24, Ext (SP 3, mulId))
-- Domain 3
	       , (12,5, Ext (SP 2, mulId)), (12,13, Int (mulId, SP 2))
	       , (13,12, Int (mulId, SP 2)), (13,14, Int (mulId, SP 5)), (13,16, Int (mulId, SP 1))
	       , (14,9, Ext (SP 1, mulId)), (14,13, Int (mulId, SP 4)), (14,17, Int (mulId, SP 1))
	       , (15,16, Int (mulId, SP 1)), (15,19, Ext (SP 4, mulId))
	       , (16,13, Int (mulId, SP 1)), (16,15, Int (mulId, SP 1)), (16,17, Int (mulId, SP 2))
	       , (17,14, Int (mulId, SP 1)), (17,16, Int (mulId, SP 2)), (17,24, Ext (SP 1, mulId))
-- Domain 4
	       , (18,4, Ext (SP 1, mulId)), (18,20, Int (mulId, SP 2))
	       , (19,15, Ext (SP 4, mulId)), (19,20, Int (mulId, SP 1)), (19,25, Ext (SP 2, mulId))
	       , (20,18, Int (mulId, SP 2)), (20,19, Int (mulId, SP 1)), (20,21, Int (mulId, SP 1)), (20,22, Int (mulId, SP 1))
	       , (21,20, Int (mulId, SP 1)), (21,23, Int (mulId, SP 4))
	       , (22,20, Int (mulId, SP 1)), (22,23, Int (mulId, SP 1)), (22,28, Ext (SP 1, mulId))
	       , (23,21, Int (mulId, SP 4)), (23,22, Int (mulId, SP 1))
-- Domain 5
	       , (24,11, Ext (SP 3, mulId)), (24,25, Int (mulId, SP 2)), (24,26, Int (mulId, SP 1)), (24,27, Int (mulId, SP 1))
	       , (25,19, Ext (SP 2, mulId)), (25,24, Int (mulId, SP 2)), (25,27, Int (mulId, SP 1)), (25,28, Int (mulId, SP 1))
	       , (26,24, Int (mulId, SP 1)), (26,27, Int (mulId, SP 1)), (26,29, Int (mulId, SP 2))
	       , (27,24, Int (mulId, SP 1)), (27,25, Int (mulId, SP 1)), (27,26, Int (mulId, SP 1)), (27,29, Int (mulId, SP 1))
	       , (28,22, Ext (SP 1, mulId)), (28,25, Int (mulId, SP 1)), (28,29, Int (mulId, SP 4))
	       , (29,26, Int (mulId, SP 2)), (29,27, Int (mulId, SP 1)), (29,28, Int (mulId, SP 4))
	       ]))

scospspExample 1 = toMatrix (G (17,
-- Domain 1
	       [ (1,2, Int (mulId, SP 1)), (1,3, Int (mulId, SP 3))
	       , (2,1, Int (mulId, SP 1)), (2,3, Int (mulId, SP 1)), (2,5, Int (mulId, SP 1)), (2,6, Ext (SP 1, mulId))
	       , (3,1, Int (mulId, SP 3)), (3,2, Int (mulId, SP 1)), (3,4, Int (mulId, SP 2)), (3,5, Int (mulId, SP 2))
	       , (4,3, Int (mulId, SP 2)), (4,5, Int (mulId, SP 4))
	       , (5,2, Int (mulId, SP 1)), (5,3, Int (mulId, SP 2)), (5,4, Int (mulId, SP 4)), (5,12, Ext (SP 3, mulId))
-- Domain 2
	       , (6,2, Ext (SP 1, mulId)), (6,7, Int (mulId, SP 1)), (6,8, Int (mulId, SP 4))
	       , (7,6, Int (mulId, SP 1)), (7,10, Int (mulId, SP 1))
	       , (8,6, Int (mulId, SP 4)), (8,9, Int (mulId, SP 1)), (8,10, Int (mulId, SP 1)), (8,11, Int (mulId, SP 4))
	       , (9,8, Int (mulId, SP 1)), (9,14, Ext (SP 1, mulId))
	       , (10,7, Int (mulId, SP 1)), (10,8, Int (mulId, SP 1)), (10,11, Int (mulId, SP 2))
	       , (11,8, Int (mulId, SP 4)), (11,10, Int (mulId, SP 2))
-- Domain 3
	       , (12,5, Ext (SP 1, mulId)), (12,13, Int (mulId, SP 2))
	       , (13,12, Int (mulId, SP 2)), (13,14, Int (mulId, SP 5)), (13,16, Int (mulId, SP 1))
	       , (14,9, Ext (SP 3, mulId)), (14,13, Int (mulId, SP 4)), (14,17, Int (mulId, SP 1))
	       , (15,16, Int (mulId, SP 1))
	       , (16,13, Int (mulId, SP 1)), (16,15, Int (mulId, SP 1)), (16,17, Int (mulId, SP 2))
	       , (17,14, Int (mulId, SP 1)), (17,16, Int (mulId, SP 2))
	       ]))
