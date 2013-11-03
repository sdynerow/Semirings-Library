module IntegerRing
( IntegerRing(..)
) where

import Algebra.Semiring

data IntegerRing = Z Int
  deriving (Eq)

instance Show IntegerRing where
  show (Z x) = show x

instance Semiring (IntegerRing) where
  add (Z x) (Z y) = Z (x + y)
  addId = Z 0

  mul (Z x) (Z y) = Z (x * y)
  mulId = Z 1