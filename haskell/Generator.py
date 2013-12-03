#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random

testcount = 2
size = 4

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
"testProperty = foldl (&&) True (map (\\(a,b,x,y) -> True) [ (a,b,x,y) | a <- as, b <- bs, x <- xs, y <- ys])"
)
