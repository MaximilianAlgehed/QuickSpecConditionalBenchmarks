--module TE_suchThat (insts, Pgt, PnotNull, PlengthP) where
import Lists
import Test.QuickCheck
import QuickSpec

data Pgt = Pgt {x :: Int, y :: Int} deriving (Ord, Eq, Show)

instance Arbitrary Pgt where
    arbitrary = do
                    (x, y) <- arbitrary `suchThat` (\(x, y) -> x > y)
                    return (Pgt x y)

data PnotNull = PnotNull {xs :: [Int]} deriving (Ord, Eq, Show)

instance Arbitrary PnotNull where
    arbitrary = do
                    xs <- arbitrary `suchThat` (not . null)
                    return (PnotNull xs)

data PlengthP = PlengthP {n :: Int, xs2 :: [Int]} deriving (Ord, Eq, Show)

instance Arbitrary PlengthP where
    arbitrary = do
                    (xs, n) <- arbitrary `suchThat` (\(xs, n) -> n < length xs)
                    return (PlengthP n xs)

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
