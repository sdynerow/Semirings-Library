#!/usr/bin/env python
# -*- coding: utf-8 -*-

print(
"import Utils\n" +
"import Algebra.Matrix\n" +
"import Algebra.Semiring\n" +
"import Metrics.Diamond\n" +
"import Data.Array"
)

print("input = [P,Q,U,V,W]")
print(
    "all4 = [ M (toArray 2 (a1:a2:a3:a4:[])) | a1 <- input, a2 <- input, a3 <- input, a4 <- input ]\n"
)

print(
"(as, bs, xs, ys) = (all4,all4,all4,all4)\n" +
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
    "prop (a,b,x,y) = ((fixpoint x a b) && (fixpoint y a b)) ==> (fixpoint (add x y) a b)"
#    "prop (a,b,x,y) = latDistr x y a"
#    "prop (a,b,x,y) = (independ b a) ==> (lubDistr x y a)"
#    "prop (a,b,x,y) = lub (mul x a) (add (mul y a) b) == add (lub (mul x a) (mul y a)) (lub (mul x a) b)"
)

print(
    "main = print (head (filter (not.prop) cart))"
)
