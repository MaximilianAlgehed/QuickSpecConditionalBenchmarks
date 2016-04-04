import QuickSpec
import Lists

whenGT :: Int -> Int -> (Int, Int)
whenGT x y
    | x > y     = (x, y)
    | otherwise = (1, 0)

whenNotNull :: [Int] -> [Int]
whenNotNull [] = [0]
whenNotNull xs = xs

whenLengthP :: Int -> [Int] -> (Int, [Int])
whenLengthP n xs
    | n < length xs = (n, xs)
    | otherwise     = (0, [0])

consts = [
            constant "whenGT1" (\(x,y) -> fst (whenGT x y)),
            constant "whenGT2" (\(x,y) -> snd (whenGT x y)),
            constant "whenNotNull" whenNotNull,
            constant "whenLengthP1" (\(x, y) -> fst (whenLengthP x y)),
            constant "whenLengthP2" (\(x, y) -> snd ( whenLengthP x y))
         ]

sign = sig {
            constants = constants sig ++ consts
           }

main = quickSpec sign
