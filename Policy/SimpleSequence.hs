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

module Policy.SimpleSequence
( SimpleSequence(..)
) where

import Data.List

import Algebra.Semiring

threshold = 30

data SimpleSequence = S [Int] | Invalid
  deriving(Eq, Show)

unicity :: (Eq a) => [a] -> Bool
unicity [] = True
unicity (x:xs) = (x `notElem` xs) && (unicity xs)

merge :: SimpleSequence -> SimpleSequence -> SimpleSequence
merge (S x) (S y) = if ((unicity res) && (lres < threshold))
      	       	    then (S res)
		    else Invalid
  where lres = length res
  	res = x ++ y

instance Semiring (SimpleSequence) where
  add (S x) (S y) = if (lx < ly)
      	       	    then (S x)
		    else (S y)
    where lx = length x
    	  ly = length y
  add (S x) Invalid = (S x)
  add Invalid (S x) = (S x)
  add Invalid Invalid = Invalid
  addId = Invalid

  mul (S x) (S y) = merge (S x) (S y)
  mul   _     _   = Invalid
  mulId = S []

