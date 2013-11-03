module Policy.KShortestPath
( KShortestPath(KSP)
, kspAddId
, kspMulId
) where

import Data.List
import Algebra.Semiring
import Policy.ShortestPath

instance Ord ShortestPath where
  (SP a) < (SP b) = a < b
  (SP _) <  Inft  = True
  _ < _ = False

  (SP a) <= (SP b) = a <= b
  (SP _) <=  Inft  = True
  _ <= _ = False

  (SP a) > (SP b) = a > b
  (SP _) >  Inft  = False
  _ > _ = False

  (SP a) >= (SP b) = a >= b
  (SP _) >=  Inft  = False
  _ >= _ = False

data KShortestPath = KSP Int [ShortestPath]
     		    | AddId
		    | MulId
  deriving (Eq)

kspAddId :: Int -> KShortestPath
kspAddId n = KSP n (replicate n addId)
kspMulId :: Int -> KShortestPath
kspMulId n = KSP n (mulId : (replicate (n-1) addId))

instance Show KShortestPath where
  show (KSP _ as) = show as

instance Semiring KShortestPath where
  add AddId AddId = AddId
  add AddId k = k
  add k AddId = k
  add MulId MulId = MulId
  add MulId (KSP n ns) = add (kspMulId n) (KSP n ns)
  add k MulId = add MulId k
  add (KSP a as) (KSP b bs)
    | a == b = KSP a (take a (sort (as ++ bs)))
    | otherwise = error "Incompatible vectors"
  addId = AddId

  mul AddId AddId = AddId
  mul AddId (KSP _ _) = AddId
  mul (KSP _ _) AddId = AddId
  mul MulId MulId = MulId
  mul MulId k = k
  mul k MulId = k
  mul (KSP a as) (KSP b bs)
    | a == b = KSP a (take a (sort [mul x y | x <- as, y <- bs]))
    | otherwise = error "Incompatible vectors"
  mulId = MulId