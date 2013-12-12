#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random

testcount = 81
size = 2

input = [ "D 0", "D 1", "D 2", "zero" ]

def genMatrix(total):
    s = ""
    for i in range(total):
        idx = random.randint(0,len(input)-1)
        s += str(input[idx])
        if (i < total - 1):
            s += ", "
    return s

def genTestSet(name):
    testlist  = "%s :: [Matrix Distance]\n" % name
    testlist += "%s = [" % name
    for t in range(testcount):
        testlist += "M (toArray %d [%s])" % (size, genMatrix(size*size))
        if (t < testcount - 1):
            testlist += ", "
    testlist += "]\n"
    return testlist

print(
"import Utils\n" +
"import Algebra.Matrix\n" +
"import Algebra.Semiring\n" +
"import Metrics.Distance\n" +
"import Metrics.Bandwidth\n" +
"import Algebra.Constructs.Direct\n" +
"import Algebra.Constructs.Lexicographic\n" +
"import Data.Array"
)

print(
"inputDist = [D 0, D 1, D 2, D 3, D 4, Inft]\n" +
"inputBand = [B 0, B 1, B 2, B 3, B 4, Inf]\n" +
"inputElts = inputDist\n" +
"inputDirs = [Dir (s,t) | s <- inputElts, t <- inputElts]\n" +
"inputLexs = [Lex (s,t) | s <- inputBand, t <- inputDist]\n" +
"input = inputLexs"
)

print(
#"allP :: [Direct Distance Distance]\n" +
"allP = [ Dir (s1,s2) | s1 <- inputElts , s2 <- inputElts ]"
)

print(
#"allPU :: [Direct Distance Distance]\n" +
"allPU = [ Dir (s1,s2) | s1 <- tail inputElts , s2 <- tail inputElts ]"
)

print(
#"allM :: [Matrix Distance]\n" +
"allM = [ M (toArray 2 (a1:a2:a3:a4:[])) | a1 <- input, a2 <- input, a3 <- input, a4 <- input ]\n"
)

print(
#"allU :: [Matrix Distance]\n" +
"allU = [ M (toArray 2 (a1:a2:a3:a4:[])) | a1 <- [zero], a2 <- input, a3 <- input, a4 <- [zero] ]\n"
)

print(
    "as = input\n" +
    "bs = input\n"
    "xs = input\n"
    "ys = input"
)

print(
    "fst4 (a,_,_,_) = a"
)

print(
"prop a b x y = " +
"(zero == lub a b) && " +          # a )( b
"(x == add (mul x a) b) && " +     # x = xa + b
"(y == add (mul y a) b) && " +     # y = ya + b
"(snor x y) && " +                 # x < y
"(snor x b) && " +                 # x < b
"(nor y b) && " +                  # y < b or y = b
"(snor x (mul x a)) && " +         # x < xa
"(snor y (mul y a)) && " +         # y < ya
"(inc y (mul x a)) && " +          # y || xa
#"(snor (mul x a) (mul y a)) && " + # xa < ya
"(inc (mul x a) b) && " +          # xa || b
"(inc (mul y a) b) && " +          # ya || b
"True\n"
)

print(
    "disjoint (M as) = as!(1,1) /= unit && as!(2,2) /= unit"
)

print(
    "lub a b = if (nor a b) then b else a\n" +
#    "lub :: Matrix Distance -> Matrix Distance -> Matrix Distance\n" +
    "lubM (M as) (M bs) = M (toArray 2 (zipWith (\\x -> \\y -> if (nor x y) then y else x) (elems as) (elems bs)))"
)

print(
#    "prop2 a b x y = not ((zero == (lub a b)) && (x == add (mul x a) b) && (nor x a) && (nor x (mul x a))) || nor a (mul x a)"
    "prop2 a b x y = not ((snor a zero) && (snor b zero) && (x == add (mul x a) b) && (y == add (mul y a) b) && (zero == lub a b)) || zero == lub (mul x a) a && zero == lub (mul x a) b"
)

print(
    "testOR = foldl (||) False [ prop2 a b x y | a <- as, b <- bs, x <- xs, y <- ys]\n"
)

print(
    "testAND = foldl (&&) True [ prop2 a b x y | a <- as, b <- bs, x <- xs, y <- ys]\n"
)

print(
    "filterProperty = filter (\\(a,b,x,y) -> not (prop2 a b x y)) [ (a,b,x,y) | a <- as, b <- bs, x <- xs, y <- ys]\n"
)

print(
    "a = M (toArray 2 [D 1, D 1, D 1, D 0])\n" +
    "b = matrixUnit 2 :: Matrix Distance\n" +
    "x = M (toArray 2 [D 0, D 0, D 1, D 0])\n" +
    "y = M (toArray 2 [D 0, D 1, D 1, D 0])"
)
