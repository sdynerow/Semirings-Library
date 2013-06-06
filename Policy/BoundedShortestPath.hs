module Policy.BoundedShortestPath
( BoundedShortestPath(..)
) where

import Algebra.Semiring

data BoundedShortestPath = BSP Int
  deriving(Eq)

instance Show BoundedShortestPath where
  show (BSP k)
    | ( k < intMu ) = show k
    | otherwise = "µ"

instance Semiring (BoundedShortestPath) where
  add (BSP x) (BSP y) = BSP (min x y)
  zero = mu

  mul (BSP x) (BSP y)
    | (x + y < 15) = BSP (x + y)
    |   otherwise  = mu
  unit = (BSP 0)

mu :: BoundedShortestPath
mu = (BSP intMu)

intMu :: Int
intMu = 7
