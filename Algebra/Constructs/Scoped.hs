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

module Scoped
( Scoped(..)
) where

import LaTeX

import Algebra.Semiring
import Algebra.Matrix

data Scoped s t = Int (s,t)
     	      	| Ext (s,t)
		| AddId
		| MulId
  deriving (Eq)

instance (Show s, Show t) => Show (Scoped s t) where
  show (Int (s,t)) = "(" ++ show s ++ "," ++ show t ++ ")"
  show (Ext (s,t)) = ")" ++ show s ++ "," ++ show t ++ "("
  show AddId = "A"
  show MulId = "M"

internalAdd :: (Semiring s, Semiring t) => (s,t) -> (s,t) -> (s,t)
internalAdd (s1,t1) (s2,t2)
      | (addS == s1 && addS == s2) = (addS,add t1 t2)
      | (addS == s1 && addS /= s2 && (t1 /= zero || t2 == zero)) = (s1,t1)
      | (addS /= s1 && addS == s2 &&  t1 /= zero && t2 == zero)  = (s1,t1)

      | (addS /= s1 && addS == s2 && (t1 == zero || t2 /= zero)) = (s2,t2)
      | (addS == s1 && addS /= s2 &&  t1 == zero && t2 /= zero)  = (s2,t2)
      | otherwise    = (addS, zero)
          where addS = add s1 s2

instance (Semiring s, Semiring t) => Semiring (Scoped s t) where
  zero = AddId
  unit = MulId

  add (Int i1) (Int i2) = Int (add s1 s2, add t1 t2)
    where (s1, t1) = i1
    	  (s2, t2) = i2
  add (Int i1) (Ext e2)
      | (addS /= s1 && addS == s2 && t1 == zero && t2 /= zero) = Ext e2
      |       	       	       	     	   	       otherwise = Int i1
      where (s1, t1) = i1
      	    (s2, t2) = e2
	    addS = add s1 s2
  add (Ext e1) (Int i2) = add (Int i2) (Ext e1)
  add (Ext e1) (Ext e2) = Ext (internalAdd e1 e2)

  add AddId x = x
  add x AddId = x
  add MulId x = MulId
  add x MulId = MulId

  mul (Int (s1,t1)) (Int (s2,t2)) = Int (mul s1 s2, mul t1 t2)
  mul (Int (s1,t1)) (Ext (s2,t2)) = Ext (mul s1 s2, mul t1 t2)
  mul (Ext (s1,t1)) (Int (s2,t2)) 
      | (t2 /= zero) = Ext (mul s1 s2, t1)
      | (t2 == zero) = Ext (mul s1 s2, zero)
  mul (Ext (s1,t1)) (Ext (s2,t2))
      | (t2 /= zero) = Ext (mul s1 s2, t1)
      | (t2 == zero) = Ext (mul s1 s2, zero)

  mul x AddId = AddId
  mul AddId x = AddId
  mul x MulId = x
  mul MulId x = x

-- Because I want to put nice matrices from the SP policy in LaTeX files :)
instance (LaTeX s, LaTeX t) => LaTeX (Scoped s t) where
  toLaTeX (Int (s,t)) = "\\left(" ++ toLaTeX s ++ "," ++ toLaTeX t ++ "\\right)"
  toLaTeX (Ext (s,t)) = "\\left)" ++ toLaTeX s ++ "," ++ toLaTeX t ++ "\\right("
  toLaTeX AddId = "\\AddId"
  toLaTeX MulId = "\\MulId"
