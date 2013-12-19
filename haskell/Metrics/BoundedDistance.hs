module Metrics.BoundedDistance
( BoundedDistance(..)
) where

import Algebra.Semiring

data BoundedDistance = BD Int
  deriving(Eq)

instance Show BoundedDistance where
  show (BD k)
    | ( k < intMu ) = show k
    | otherwise = "µ"

instance Semiring (BoundedDistance) where
  add (BD x) (BD y) = BD (min x y)
  zero = mu

  mul (BD x) (BD y)
    | (x + y < intMu) = BD (x + y)
    |   otherwise  = mu
  unit = (BD 0)

  lub (BD x) (BD y)
    | (max x y < intMu) = BD (max x y)
    | otherwise = mu

mu :: BoundedDistance
mu = (BD intMu)

intMu :: Int
intMu = 4
