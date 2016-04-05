--module TE_hand (Pgt, PnotNull, PlengthP, insts) where
import Test.QuickCheck
import QuickSpec
import Lists

data Pgt = Pgt {x :: Int, y :: Int} deriving (Ord, Eq, Show)

instance Arbitrary Pgt where
    arbitrary = do
                    x <- arbitrary
                    y <- arbitrary
                    return (Pgt (1 + x + abs y) x)

data PnotNull = PnotNull {xs :: [Int]} deriving (Ord, Eq, Show)

instance Arbitrary PnotNull where
    arbitrary = do
                    x <- arbitrary
                    xs <- arbitrary
                    return (PnotNull (x:xs))

data PlengthP = PlengthP {n :: Int, xs2 :: [Int]} deriving (Ord, Eq, Show)

instance Arbitrary PlengthP where
    arbitrary = do
                    x <- arbitrary
                    xs <- arbitrary
                    return (PlengthP (length xs - ((abs x)+1)) xs)

consts = [
            constant "x" x,
            constant "y" y,
            constant "xs" xs,
            constant "n" n,
            constant "xs2" xs2
         ]

insts = [
            baseType (undefined :: Pgt),
            names (NamesFor ["pgt"] :: NamesFor Pgt),
            baseType (undefined :: PnotNull),
            names (NamesFor ["pnotnull"] :: NamesFor PnotNull),
            baseType (undefined :: PlengthP),
            names (NamesFor ["plengthp"] :: NamesFor PlengthP)
        ]

sign = sig {
        instances = instances sig ++ insts,
        constants = constants sig ++ consts
       }

main = quickSpec sign

prop_1 p = (x p) > (y p)
prop_2 p = (not . null) (xs p)
prop_3 p = (n p) < length (xs2 p)
