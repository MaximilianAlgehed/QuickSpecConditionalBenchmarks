import Arithmetic
import QuickSpec

whenNotEqual :: Int -> Int -> (Int, Int)
whenNotEqual x y 
    | x /= y    = (x, y)
    | otherwise = (1, 0)

whenGreater :: Int -> Int -> (Int, Int)
whenGreater x y
    | x > y     = (x, y)
    | otherwise = (1, 0)

whenPos :: Int -> Int
whenPos x
    | x > 0     = x
    | otherwise = 1

whenNeg :: Int -> Int
whenNeg x
    | x < 0     = x
    | otherwise = -1

whenAbsGreater :: Int -> Int -> (Int, Int)
whenAbsGreater x y
    | abs x > abs y = (x, y)
    | otherwise     = (1, 0)

consts = [
            constant "whenNotEqual1" (\x y -> fst (whenNotEqual x y)),
            constant "whenNotEqual2" (\x y -> snd (whenNotEqual x y)),
            constant "whenGreater1"  (\x y -> fst (whenGreater x y)),
            constant "whenGreater2"  (\x y -> snd (whenGreater x y)),
            constant "whenPos" whenPos,
            constant "whenNeg" whenNeg,
            constant "whenAbsGreater1" (\x y -> fst (whenAbsGreater x y)),
            constant "whenAbsGreater2" (\x y -> snd (whenAbsGreater x y))
         ]


sign = sig {
            constants = constants sig ++ consts}

main = quickSpec sign
