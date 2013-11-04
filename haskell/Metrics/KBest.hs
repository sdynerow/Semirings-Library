module Metrics.KBest
( KBest(KD)
, kspAddId
, kspMulId
) where

import Data.List
import Algebra.Semiring
import Metrics.Distance

instance Ord Distance where
  (D a) < (D b) = a < b
  (D _) <  Inft  = True
  _ < _ = False

  (D a) <= (D b) = a <= b
  (D _) <=  Inft  = True
  _ <= _ = False

  (D a) > (D b) = a > b
  (D _) >  Inft  = False
  _ > _ = False

  (D a) >= (D b) = a >= b
  (D _) >=  Inft  = False
  _ >= _ = False

data KBest = KD Int [Distance]
     		    | AddId
		    | MulId
  deriving (Eq)

kspAddId :: Int -> KBest
kspAddId n = KD n (replicate n zero)
kspMulId :: Int -> KBest
kspMulId n = KD n (unit : (replicate (n-1) zero))

instance Show KBest where
  show (KD _ as) = show as

instance Semiring KBest where
  add AddId AddId = AddId
  add AddId k = k
  add k AddId = k
  add MulId MulId = MulId
  add MulId (KD n ns) = add (kspMulId n) (KD n ns)
  add k MulId = add MulId k
  add (KD a as) (KD b bs)
    | a == b = KD a (take a (sort (as ++ bs)))
    | otherwise = error "Incompatible vectors"
  zero = AddId

  mul AddId AddId = AddId
  mul AddId (KD _ _) = AddId
  mul (KD _ _) AddId = AddId
  mul MulId MulId = MulId
  mul MulId k = k
  mul k MulId = k
  mul (KD a as) (KD b bs)
    | a == b = KD a (take a (sort [mul x y | x <- as, y <- bs]))
    | otherwise = error "Incompatible vectors"
  unit = MulId