-- Copyright (c) 2010 - Seweryn Dynerowicz
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
-- http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- imitations under the License.

module PathInformations.NextHopPaths
( NextHopPaths(..)
) where

import LaTeX

import PathInformations.NextHop

import Algebra.Semiring

data NextHopPaths = NHP Int Int [[NextHop]]
  deriving (Eq)

compat :: NextHop -> NextHop -> Bool
compat S _ = True
compat _ S = True
compat (A i q1) (A q2 j) = q1 == q2

consistent :: [NextHop] -> Bool
consistent (a:[]) = True
consistent (a1:a2:as) = (compat a1 a2) && (consistent (a2:as))

reduce :: [NextHop] -> [NextHop]
reduce (a:[]) = a:[]
reduce as
  | consistent as = filter (\x -> (x /= S)) as
  | otherwise = []

elimDoubles :: Eq a => [a] -> [a]
elimDoubles [] = []
elimDoubles (a:as) = a : (filter (\x -> a /= x) (elimDoubles as))

elimEmpty :: Eq a => [[a]] -> [[a]]
elimEmpty [[]] = [[]]
elimEmpty  as  = filter (\x -> x /= []) as

startsAt :: Int -> [NextHop] -> Bool
startsAt _ [] = False
startsAt _ (S:_) = True
startsAt s ((A i _):_) = s == i

endsAt :: Int -> [NextHop] -> Bool
endsAt _ [] = False
endsAt _ (S:[]) = True
endsAt s ((A _ j):[]) = s == j
endsAt s (_:as) = endsAt s as

instance Show NextHopPaths where
  show (NHP 0 0 (l:[])) = show l
  show (NHP 0 0 (p : ps)) = show p ++ "|" ++ show (NHP 0 0 ps)
  show (NHP i j (l:[])) = show i ++ ">" ++ show j ++ " " ++ show l
  show (NHP i j (p : ps)) = show i ++ ">" ++ show j ++ " " ++ show p ++ "|" ++ show (NHP 0 0 ps)

instance Semiring NextHopPaths where
  add (NHP s1 d1 p1) (NHP s2 d2 p2) = NHP s2 d2 (elimEmpty (elimDoubles (p1 ++ p2)))
  zero = NHP 0 0 [[]]

  mul (NHP s1 _ p1) (NHP _ d2 p2) = NHP s1 d2 [reduce (a ++ b) | a <- p1, b <- p2, startsAt s1 a, endsAt d2 b]
  unit = NHP 0 0 [[S]]
