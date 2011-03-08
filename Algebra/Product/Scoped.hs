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

module Algebra.Product.Scoped
( Scoped(..)
) where

import LaTeX

import Algebra.Semiring
import Algebra.Matrix

data Scoped s t = Int t
     	      	| Ext (s,t)
		| AddId
		| MulId
  deriving (Eq)

instance (Show s, Show t) => Show (Scoped s t) where
  show (Int t) = "I" ++ show t
  show (Ext (s,t)) = "E" ++ show (s,t)
  show AddId = "A"
  show MulId = "M"

instance (Semiring s, Semiring t) => Semiring (Scoped s t) where
  addId = AddId
  mulId = MulId

  add (Ext (s1,t1)) (Ext (s2,t2))
      | (addS == s1 && addS == s2) = Ext (addS,add t1 t2)
      | (addS == s1) = Ext (s1,t1)
      | (addS == s2) = Ext (s2,t2)
      | otherwise    = Ext (addS, addId)
          where addS = add s1 s2
  add (Int t1) (Int t2) = Int (add t1 t2)
  add (Int t1) (Ext  _) = Int t1
  add (Ext  _) (Int t2) = Int t2
  add AddId x = x
  add x AddId = x
  add MulId x = MulId
  add x MulId = MulId

  mul (Int b1) (Int b2) = Int (mul b1 b2)
  mul (Int b1) (Ext (a2,b2)) = Ext (a2, mul b1 b2)
  mul (Ext (a1,b1)) (Int b2) = Ext (a1, b1)
  mul (Ext (a1,b1)) (Ext (a2,b2)) = Ext (mul a1 a2, b1)

  mul x AddId = AddId
  mul AddId x = AddId
  mul x MulId = x
  mul MulId x = x

-- Because I want to put nice matrices from the SP policy in LaTeX files :)
instance (LaTeX s, LaTeX t) => LaTeX (Scoped s t) where
  toLaTeX (Int t) = "\\mpzc{I}[" ++ toLaTeX t ++ "]"
  toLaTeX (Ext (s,t)) = "\\mpzc{E}(" ++ toLaTeX s ++ "," ++ toLaTeX t ++ ")"
  toLaTeX AddId = "\\AddId"
  toLaTeX MulId = "\\MulId"