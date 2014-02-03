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
"all4 = [ M (toArray 2 (a1:a2:a3:a4:[])) | a1 <- input, a2 <- input, a3 <- input, a4 <- input ]\n"
"all9 = [ M (toArray 3 (a1:a2:a3:a4:a5:a6:a7:a8:a9:[])) | a1 <- input, a2 <- input, a3 <- input, a4 <- input, a5 <- input, a6 <- input, a7 <- input, a8 <- input, a9 <- input ]"
)

print(
"(as, bs, xs, ys) = (input, input, input, input)\n" +
"cart = [ (a,b,x,y) | a <- as, b <- bs, x <- xs, y <- ys ]"
)

print(
"fixpoint r a b = r == add (mul r a) b\n" +
"independ b a = not (nor (lub b a) (mul b a))\n" +
"lubDistr r1 r2 a = mul (lub r1 r2) a == lub (mul r1 a) (mul r2 a)\n" +
"latDistr x y a = lub a (add x y) == add (lub a x) (lub a y)\n" +
"distr x y a = mul a (add x y) == add (mul a x) (mul a y)"
)

print(
#    "prop (a,b,x,y) = ((fixpoint x a b) && (fixpoint y a b)) ==> (x == y)"
#    "prop (a,b,x,y) = latDistr x y a"
    "prop (a,b,x,y) = (independ b a) ==> (lubDistr x y a)"
#    "prop (a,b,x,y) = lub (mul x a) (add (mul y a) b) == add (lub (mul x a) (mul y a)) (lub (mul x a) b)"
)

print(
    "main = print (head (filter (not.prop) cart))"
)
