import Lists
import TE_hand
import Test.QuickCheck

whenGT :: Pgt -> Int -> Int -> (Int, Int)
whenGT p x' y'
    | x' > y'   = (x', y')
    | otherwise = (x p, y p)

whenNotNull :: PnotNull -> [Int] -> [Int]
whenNotNull p [] = xs p 
whenNotNull p xs = xs

whenLengthP :: PlengthP -> Int -> [Int] -> (Int, [Int])
whenLengthP p n' xs
    | n' < length xs = (n', xs)
    | otherwise      = (n p, xs2 p)
