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

module Policy.Sequence
( Sequence(..)
) where

import Algebra.Semiring

threshold = 10

data Sequence = S [Int] | Full
  deriving(Eq, Show)

instance Semiring (Sequence) where
  add (S x) (S y) = if (lx < ly)
      	       	    then (S x)
		    else (S y)
    where lx = length x
    	  ly = length y
  add (S x) Full = (S x)
  add Full (S x) = (S x)
  add Full Full = Full
  addId = Full
  mul (S x) (S y) = if (lres < threshold)
      	       	    then (S res)
		    else Full
    where lres = length res
    	  res = x ++ y
  mul   _     _   = Full
  mulId = S []
