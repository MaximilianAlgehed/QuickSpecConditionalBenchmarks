import Arithmetic
import Test.QuickCheck
import QuickSpec

data Pneq = Pneq {x1 :: Int, y1 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Pneq where
    arbitrary = do
                    x <- arbitrary
                    y <- arbitrary `suchThat` (/=x)
                    return $ Pneq x y

data Pgt  = Pgt {x2 :: Int, y2 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Pgt where
    arbitrary = do
                 x <- arbitrary 
                 y <- arbitrary
                 return (Pgt (1 + x + abs y) x)

data Pos = Pos {x3 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Pos where
    arbitrary = do
                    x <- fmap abs arbitrary
                    return (Pos x)

data Neg = Neg {x4 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary Neg where
    arbitrary = do
                   x <- fmap (negate . abs) arbitrary
                   return (Neg x)

data AbsGreater = AGT {x5 :: Int, y5 :: Int} deriving(Ord, Eq, Show)

instance Arbitrary AbsGreater where
    arbitrary = do
                 x <- fmap abs arbitrary
                 y <- fmap abs arbitrary
                 s1 <- oneof [return (-1), return 1]
                 s2 <- oneof [return (-1), return 1]
                 return $ AGT (s1*(x + 1 + y)) (s2*x)

insts = [
             baseType (undefined::Pneq),
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

sign = sig {
            instances = insts,
            constants = constants sig ++ consts
           }
           
main = quickSpec sign
