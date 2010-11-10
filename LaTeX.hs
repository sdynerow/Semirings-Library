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

module LaTeX
( LTX(..)
, LaTeX(..)
, matrixToLTX
) where

import Algebra.Matrix

data LTX s = L s | LM [[s]]

matrixToLTX :: Matrix s -> LTX s
matrixToLTX (M ms) = LM ms

class LaTeX s where
  toLaTeX :: s -> String

instance (LaTeX s, Eq s, Show s) => Show (LTX s) where
  show (LM as) = "\\begin{bmatrix}\n" ++ intShow as ++ "\\end{bmatrix}"
    where intShow (a:as) | (as==[]) = showV a ++ "\n"
          	         | (as/=[]) = showV a ++ "\\\\\n" ++ intShow as
	                     where showV (a:[]) = toLaTeX a
   			           showV (a:as) = toLaTeX a ++ " & " ++ showV as
  show (L a) = toLaTeX a

instance (LaTeX s, LaTeX t) => LaTeX (s,t) where
  toLaTeX (a,b) = "(" ++ (toLaTeX a) ++ "," ++ (toLaTeX b) ++ ")"
