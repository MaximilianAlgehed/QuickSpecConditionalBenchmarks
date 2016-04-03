import Lists

data Pgt = {x :: Int, y :: Int} deriving (Ord, Eq, Show)

instance Arbitrary Pgt where
    arbitrary = do
                    x <- arbitrary
                    y <- arbitrary
                    return (Pgt (x + abs y) x)

data PnotNull = {xs :: [Int]} deriving (Ord, Eq, Show)

instance Arbitrary PnotNull where
    arbitrary = do
                    x <- arbitrary
                    xs <- arbitrary
                    return (PnotNull (x:xs))

data PlengthP = {n :: Int, xs :: [Int]} deriving (Ord, Eq, Show)

instance Arbitrary PlengthP where
    arbitrary = do
                    x <- arbitrary
                    xs <- arbitrary
                    return (PlengthP (length xs - (abs x)+1) xs)
