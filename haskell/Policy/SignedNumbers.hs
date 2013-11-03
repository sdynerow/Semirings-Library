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

module SignedNumbers
( QA
) where

import Algebra.Semiring

data QA = Pl | Mi | Ze | Qu
  deriving (Eq)

instance Show QA where
  show Pl = "+"
  show Mi = "-"
  show Ze = "0"
  show Qu = "?"

toQA :: Int -> (Int, QA)
toQA x = (x, sg x)

sg :: Int -> QA
sg 0 = Ze
sg a | (a > 0) = Pl
     | (a < 0) = Mi

instance Semiring QA where
  add Pl Pl = Pl
  add Pl Mi = Qu
  add Pl Ze = Pl
  add Pl Qu = Qu

  add Mi Pl = Qu
  add Mi Mi = Mi
  add Mi Ze = Mi
  add Mi Qu = Qu

  add Ze Pl = Pl
  add Ze Mi = Mi
  add Ze Ze = Ze
  add Ze Qu = Qu

  add Qu Pl = Qu
  add Qu Mi = Qu
  add Qu Ze = Qu
  add Qu Qu = Qu

  addId = Ze

  mul Pl Pl = Pl
  mul Pl Mi = Mi
  mul Pl Ze = Ze
  mul Pl Qu = Qu

  mul Mi Pl = Mi
  mul Mi Mi = Pl
  mul Mi Ze = Ze
  mul Mi Qu = Qu

  mul Ze Pl = Ze
  mul Ze Mi = Ze
  mul Ze Ze = Ze
  mul Ze Qu = Ze

  mul Qu Pl = Qu
  mul Qu Mi = Qu
  mul Qu Ze = Ze
  mul Qu Qu = Qu

  mulId = Pl

instance Semiring (Int, QA) where
  add (a,s) (b,t) = (a + b, add s t)
  addId = (0,addId)
  mul (a,s) (b,t) = (a * b, complicated)
    where complicated = add (add (mul (sg a) t) (mul (sg b) s)) (mul s t)
  mulId = (1,mulId)

