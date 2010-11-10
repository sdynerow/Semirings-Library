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

module Algebra.Semimodule
( Semimodule(..)
) where

import Algebra.Semiring

class Semimodule s where
  sadd  :: [s] -> [s] -> [s]
  lSmul ::  s  -> [s] -> [s]
  rSmul ::  s  -> [s] -> [s]

instance (Semiring s) => Semimodule s where
  sadd as bs | (length as) == (length bs) = zipWith (add) as bs
             | otherwise = error "Incompatible vectors"
  lSmul a bs = map (\b -> mul a b) bs
  rSmul a bs = map (\b -> mul b a) bs
