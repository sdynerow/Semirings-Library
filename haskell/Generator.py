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
"inputDist = [D 0, D 1, D 2, D 3, Inft]\n" +
"inputBand = [B 0, B 1, B 2, B 3, Inf]\n" +
"inputBDist = [BD 0, BD 1, BD 2, BD 3, BD 4, BD 5]\n" +
"inputLexs = [Lex (s,t) | s <- inputBand, t <- inputDist]\n" +
"inputElts = inputLexs\n" +
"inputDirs = [Dir (s,t) | s <- inputElts, t <- inputElts]\n" +
"input = inputLexs"
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
#    "prop a b x y = not ((x == add (mul x a) b) && (y == add (mul y a) b) && snor (mul b a) zero && zero == lub b a) || x == y"
    "prop a b x y = mul (lub a b) x == lub (mul a x) (mul b x)"
)

print(
    "testOR = foldl (||) False [ prop a b x y | a <- as, b <- bs, x <- xs, y <- ys]\n"
)

print(
    "testAND = foldl (&&) True [ prop a b x y | a <- as, b <- bs, x <- xs, y <- ys]\n"
)

print(
    "filterProperty = filter (\\(a,b,x,y) -> not (prop a b x y)) [ (a,b,x,x) | a <- as, b <- bs, x <- xs]\n"
)

print(
    "a = M (toArray 2 [zero, D 0, D 1, zero])\n" +
    "b = matrixUnit 2 :: Matrix Distance\n" +
    "x = M (toArray 2 [D 0, D 0, D 1, D 0])\n" +
    "y = M (toArray 2 [D 0, D 1, D 1, D 0])\n" +
    "ex = Lex (B 100, D 2)\n" +
    "eb = Lex (B 10, D 1)\n" +
    "ea = Lex (B 10, D 1)"
)







