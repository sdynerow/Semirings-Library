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

module Policy.Semiring
( Tropical(..)
, ZRing(..)
) where

import Algebra.Semiring
import Algebra.CanonicalPreorder

data Tropical = T Integer | Infty
  deriving (Eq)

instance Show Tropical where
  show (T a) = show a
  show Infty = "∞"

data ZRing = Z Integer
  deriving (Eq)

instance Show ZRing where
  show (Z a) = show a

instance Semiring Tropical where
  add (T a) (T b) = T (min a b)
  add   a   Infty = a
  add Infty   b   = b

  addId = Infty

  mul (T a) (T b) = T (a + b)
  mul   _     _   = Infty

  mulId = (T 0)

instance CanonicalPreorder Tropical where
  cprAdd (T a) (T b) = b <= a
  cprAdd Infty _ = True
  cprAdd _ _ = False

instance Semiring ZRing where
  add (Z a) (Z b) = Z (a + b)
  addId = (Z 0)

  mul (Z a) (Z b) = Z (a * b)
  mulId = (Z 1)

instance CanonicalPreorder ZRing where
  cprAdd _ _ = True

instance Semiring (Tropical, ZRing) where
  add (t1,z1) (t2,z2) = (add t1 t2, add z1 z2)
  addId = (addId, addId)
  mul (t1,z1) (t2,z2) = (mul t1 t2, mul z1 z2)
  mulId = (mulId, mulId)

instance CanonicalPreorder (Tropical, ZRing) where
  cprAdd (t1,_) (t2,_) = cprAdd t1 t2
