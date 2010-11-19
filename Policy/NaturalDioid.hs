module NaturalDioid
( NaturalDioid(..)
) where

import Algebra.Semiring

data NaturalDioid = N Int
  deriving (Eq)

instance Show NaturalDioid where
  show (N x) = show x

instance Semiring (NaturalDioid) where
  add (N x) (N y) = N (x + y)
  addId = N 0

  mul (N x) (N y) = N (x * y)
  mulId = N 1