module Examples.WidestPath
( wpExamples
) where

import Utils

import Algebra.Matrix
import Algebra.Semiring

import Policy.WidestPath

wpExamples :: Int -> Matrix WidestPath
wpExamples 0 = M (toArray 5 [addId,  WP 1,  WP 4, addId,  WP 5
                            , WP 1, addId,  WP 4, addId,  WP 3
                            , WP 4,  WP 4, addId,  WP 9, addId
                            ,addId, addId,  WP 9, addId,  WP 2
                            , WP 5,  WP 3, addId,  WP 2, addId])

wpExamples 1 = M (toArray 5 [addId,  WP 5, addId, addId, addId
          	            ,addId, addId, addId, addId, addId
          	            ,addId,  WP 5, addId,  WP 5, addId
          	            , WP 5, addId, addId, addId, WP 10
          	            ,WP 10, addId,  WP 5, addId, addId])

wpExamples 2 = M (toArray 5 [addId,  WP 8,  WP 6, addId, addId
          	            ,addId, addId, addId,  WP 4, addId
           	            ,addId, addId, addId,  WP 5, addId
           	            ,addId, addId, addId, addId,  WP 3
         	            ,addId, addId, addId, addId, addId])

wpExamples _ = error "Undefined example of WidestPath"
