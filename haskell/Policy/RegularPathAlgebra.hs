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

module Policy.RegularPathAlgebra
( RegularPath(..)
) where

import LaTeX

import Algebra.Semiring

data RegularPath =
    Empty
  | Wrong
  | V Int
  | Agr RegularPath RegularPath
  | Ext RegularPath RegularPath
  deriving (Eq)

instance Show RegularPath where
  show Empty = "ε"
  show Wrong = "∅"
  show (V i) = show i
  show (Agr p1 p2) = show p1 ++ "|" ++ show p2
  show (Ext (Agr p1 p2) (Agr p3 p4)) = "(" ++ show p1 ++ ")(" ++ show p2 ++ ")"
  show (Ext (Agr p1 p2) p3) = "(" ++ show (Agr p1 p2) ++ ")" ++ show p3
  show (Ext p1 (Agr p2 p3)) = show p1 ++ "(" ++ show (Agr p2 p3) ++ ")"
  show (Ext p1 p2) = show p1 ++ "" ++ show p2

instance Semiring (RegularPath) where
  add Wrong Wrong = Wrong
  add p1 Wrong = p1
  add Wrong p2 = p2
  add p1 p2 = if (p1 == p2) then p1 else Agr p1 p2
  zero = Wrong
  mul Wrong Wrong = Wrong
  mul p1 Wrong = Wrong
  mul Wrong p2 = Wrong
  mul Empty Empty = Empty
  mul p1 Empty = p1
  mul Empty p2 = p2
  mul p1 p2 = Ext p1 p2
  unit = Empty
