#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random

testcount = 20
size = 2

input = [ "D 0", "D 1", "D 2", "D 3", "D 4", "D 5", "D 6", "D 7", "D 8", "D 9", "zero" ]

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
"import Metrics.Distance\n"
)

print(genTestSet("as"))
print(genTestSet("bs"))
print(genTestSet("xs"))
print(genTestSet("ys"))

print(
"testProperty :: Bool\n" +
    "testProperty = foldl (||) False (map (\\(a,b,x,y) -> (x == add (mul x a) b) && (y == add (mul y a) b) && (inc b (mul a b)) && (snor x y) && (snor x (mul x a)) && (snor (mul x a) (mul y a)) && (inc (mul x a) b) && (inc (mul y a) b) && (snor y (mul y a)) && (inc y (mul x a)) && (snor x b) && (snor y b)) [ (a,b,x,y) | a <- as, b <- bs, x <- xs, y <- ys])"
)

print(
    "filterProperty = filter (\\(a,b,x,y) -> (x == add (mul x a) b) && (y == add (mul y a) b) && (inc b (mul a b)) && (snor x y) && (snor x (mul x a)) && (snor (mul x a) (mul y a)) && (inc (mul x a) b) && (inc (mul y a) b) && (snor y (mul y a)) && (inc y (mul x a)) && (snor x b) && (snor y b)) [ (a,b,x,y) | a <- as, b <- bs, x <- xs, y <- ys]"
)

print("a = M (toArray 2 [D 6, D 7, D 0, D 9])")
print("b = M (toArray 2 [D 4, D 1, D 9, D 5])")
print("x = M (toArray 2 [D 0, D 1, D 0, D 0])")
print("y = M (toArray 2 [D 0, D 1, D 4, D 5])")
