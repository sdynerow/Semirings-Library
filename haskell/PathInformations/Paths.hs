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

-- A definition of the AS-PATH policy of BGP

module PathInformations.Paths
( Paths(..)
, Path(..)
) where

import Data.Set
import Algebra.Semiring

data Path = P [Int] | Invalid
          deriving (Eq,Ord)

instance Semiring (Path) where
  add (P as) (P bs) = P as
  add Invalid b = b
  add a Invalid = a
  zero = P []

  mul (P as) (P bs) = P (as ++ bs)
  mul Invalid _ = Invalid
  mul _ Invalid = Invalid
  unit = Invalid

showPath :: (Show a) => [a] -> String
showPath [] = "ε"
showPath (a:[]) = show a
showPath (a:as) = (show a) ++ (showPath as)

instance Show Path where
  show (P as) = showPath as
  show Invalid = "∅"

data Paths = PS (Set Path) | AllPaths
          deriving(Eq)

instance Show Paths where
  show (PS as) = show (toList as)
  show AllPaths = "ALL"

instance Semiring (Paths) where
  add AllPaths _ = AllPaths
  add _ AllPaths = AllPaths
  add (PS as) (PS bs) = PS (union as bs)
  zero = PS empty
  mul a AllPaths = a
  mul AllPaths b = b
  mul (PS as) (PS bs) = PS (fromList [mul a b | a <- asl, b <- bsl])
                        where asl = toList as
                              bsl = toList bs
  unit = AllPaths
