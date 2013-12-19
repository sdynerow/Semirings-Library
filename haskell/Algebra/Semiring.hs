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

module Algebra.Semiring
( Semiring(..)
, powers
, closures
) where

import Utils

class (Eq s) => Semiring s where
  add :: s -> s -> s
  zero :: s

  mul :: s -> s -> s
  unit :: s

  nor :: s -> s -> Bool
  nor a b = (add a b == a)

  snor :: s -> s -> Bool
  snor a b = (nor a b) && (a /= b)

  inc :: s -> s -> Bool
  inc a b = not (nor a b) && not (nor b a)

  lub :: s -> s -> s

  kronecker :: (Eq t) => t -> t -> s
  kronecker i j | (i==j) = unit
                | (i/=j) = zero
  
  -- Because square-and-multiply is much better for computing a power :)
  power :: s -> Int -> s
  power a k = squareMultiply mul unit a k
  
  closure :: s -> Int -> s
  closure a k = foldl (add) unit (take k (tail (powers a)))

  star :: s -> s
  star a = fst (head (filter id (closurePairs a)))
    where id (a,b) = a == b

powers :: (Semiring s) => s -> [s]
powers a = unit : [(mul a b) | b <- powers a]

closures :: (Semiring s) => s -> [s]
closures a = unit : [add b (mul a b) | b <- closures a]

closurePairs :: (Semiring s) => s -> [(s,s)]
closurePairs a = zip clos (tail clos)
  where clos = closures a
