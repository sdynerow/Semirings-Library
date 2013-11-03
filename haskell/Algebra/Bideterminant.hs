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

module Algebra.Bideterminant
( minor
, negdet
, posdet
, bidet
, perm
) where

import Data.List
import Data.Array

import Algebra.Matrix
import Algebra.Semiring

minor :: (Semiring s) => Matrix s -> Int -> Int -> Matrix s
minor (M ms) i j =
  M (array r [((k,l), expand (ms!(k,l)) k l) | (k,l) <- range r])
  where r = bounds ms
      	expand m k l
	  | ((i==k) && (j==l)) = mulId
	  | ((i/=k) && (j/=l)) = m
	  | otherwise = addId

negdet :: (Semiring s) => Matrix s -> s
negdet _ = addId

posdet :: (Semiring s) => Matrix s -> s
posdet _ = mulId

bidet :: (Semiring s) => Matrix s -> (s,s)
bidet ms = (posdet ms, negdet ms)

perm :: (Semiring s) => Matrix s -> s
perm ms = add (posdet ms) (negdet ms)
