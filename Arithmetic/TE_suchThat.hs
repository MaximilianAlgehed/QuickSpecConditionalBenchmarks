import Arithmetic
import QuickSpec
import Test.QuickCheck

data Pneq = Pneq {x1 :: Int, y1 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Pneq where
    arbitrary = do
                    (x, y) <- arbitrary `suchThat` (uncurry (/=))
                    return $ Pneq x y

data Pgt  = Pgt {x2 :: Int, y2 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Pgt where
    arbitrary = do
                 (x, y) <- arbitrary `suchThat` (uncurry (>))
                 return (Pgt x y)

data Pos = Pos {x3 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Pos where
    arbitrary = do
                    x <- arbitrary `suchThat` (>0)
                    return (Pos x)

data Neg = Neg {x4 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Neg where
    arbitrary = do
                   x <- arbitrary `suchThat` (<0)
                   return (Neg x)

data AbsGreater = AGT {x5 :: Int, y5 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary AbsGreater where
    arbitrary = do
                 (x, y) <- arbitrary `suchThat` (\(x, y) -> abs x > abs y)
                 return $ AGT x y

insts = [baseType (undefined::Pneq),
         names  (NamesFor ["Pneq"] :: NamesFor Pneq),
         baseType (undefined::Pgt),
         names (NamesFor ["Pgt"] :: NamesFor Pgt),
         baseType (undefined::Pos),
         names (NamesFor ["Pos"] :: NamesFor Pos),
         baseType (undefined::Neg),
         names (NamesFor ["Neg"] :: NamesFor Neg),
         baseType (undefined::AbsGreater),
         names (NamesFor ["AbsGreater"] :: NamesFor AbsGreater)
        ]

consts = [
                constant "x1" x1,
                constant "y1" y1,
                constant "x2" x2,
                constant "y2" y2,
                constant "x3" x3,
                constant "x4" x4,
                constant "x5" x5,
                constant "y5" y5
         ]

sign = sig {instances = insts,
            constants = constants sig ++ consts
           }
           
main = quickSpec sign
