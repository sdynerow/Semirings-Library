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

module Metrics.Diamond
( Diamond(..)
) where

import Algebra.Semiring

data Diamond = P | Q | U | V | W
       deriving(Eq, Show)

instance Semiring (Diamond) where
  add P _ = P
  add _ P = P
  add Q x = x
  add x Q = x
  add x y
    | x == y = x
    | x /= y = P
  zero = Q
  mul Q _ = Q
  mul _ Q = Q
  mul P x = x
  mul x P = x
  mul x y
    | x == y = x
    | x /= y = Q
  unit = P
  lub = mul
