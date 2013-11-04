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

-- A template for policy definition

module Metrics.Blank
( Blank(..)
) where

import Algebra.Semiring

data Blank = B Int | Neutral
       deriving(Eq, Show)

instance Semiring (Blank) where
  add a b = a
  addId = Neutral
  mul a b = b
  mulId = Neutral
