#!/usr/bin/env python
# -*- coding: utf-8 -*-

print(
"import Utils\n" +
"import Algebra.Matrix\n" +
"import Algebra.Semiring\n" +
"import Metrics.Distance\n" +
"import Metrics.Bandwidth\n" +
"import Metrics.BoundedDistance\n" +
"import Algebra.Constructs.Direct\n" +
"import Algebra.Constructs.Lexicographic\n" +
"import Data.Array"
)

print(
"inputDist = [D 0, D 1, D 2, Inft]\n" +
"inputBand = [B 0, B 1, B 2, Inf]\n" +
"inputBDist = [BD 0, BD 1, BD 2, BD 3, BD 4, BD 5]\n" +
"inputLexs = [Lex (s,t) | s <- inputBand, t <- inputDist]\n" +
"inputElts = inputLexs\n" +
"inputDirs = [Dir (s,t) | s <- inputElts, t <- inputElts]\n" +
"input = inputDirs"
)

print(
"allP = [ Dir (s1,s2) | s1 <- inputElts , s2 <- inputElts ] \n" +
"allPU = [ Dir (s1,s2) | s1 <- tail inputElts , s2 <- tail inputElts ] \n" +
"all4 = [ M (toArray 2 (a1:a2:a3:a4:[])) | a1 <- input, a2 <- input, a3 <- input, a4 <- input ]"
)

print(
    "as = input\n" +
    "bs = input\n"
    "xs = input\n"
    "ys = input"
)

print(
#    "prop a b x y = not ((x == add (mul x a) b) && (y == add (mul y a) b) && not (nor (lub b a) (mul b a))) || x == y"
#    "prop a b x y = not (snor (mul b a) (lub b a)) || mul (lub b x) a == lub (mul b a) (mul x a)"
    "prop a b x y = lub (mul x a) (add (mul y a) b) == add (lub (mul x a) (mul y a)) (lub (mul x a) b)"
)

print(
    "filterProperty = filter (\\(a,b,x,y) -> not (prop a b x y)) [ (a,b,x,y) | a <- as, b <- bs, x <- xs, y <- ys ]\n"
)
