module Examples.MostReliablePath
( mrExamples
) where

import Algebra.Matrix
import Algebra.Semiring

import Algebra.Optimum

import Policy.MostReliablePath

mrExamples :: Int -> Matrix MostReliablePath
mrExamples 0 = M [[  addId, MR 0.1, MR 0.4,  addId, MR 0.5]
                 ,[ MR 0.1,  addId, MR 0.4,  addId, MR 0.3]
                 ,[ MR 0.4, MR 0.4,  addId, MR 0.9,  addId]
                 ,[  addId,  addId, MR 0.9,  addId, MR 0.2]
                 ,[ MR 0.5, MR 0.3,  addId, MR 0.2,  addId]]

mrExamples _ = error "Undefined example of MostReliablePath"
