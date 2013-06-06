module Examples.LexProd
( lpbwspExample
) where

import Algebra.Product.Lexico

import Examples.ShortestPath
import Examples.WidestPath

lpbwspExample 0 = lexico (wpExamples 1) (spExamples 4)
lpbwspExample 1 = lexico (wpExamples 2) (spExamples 5)
lpbwspExample 2 = lexico (wpExamples 3) (spExamples 8)
