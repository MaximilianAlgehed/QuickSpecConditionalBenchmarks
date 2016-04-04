module Lists (sig, predicates) where
import QuickSpec hiding (insert)
import Data.List

sig = signature {
        maxTermSize = Just 6,
        constants = [
            constant "[]"      ([] :: [Int]),
            constant ":"       ((:) :: Int -> [Int] -> [Int]),
            constant "++"      ((++) :: [Int] -> [Int] -> [Int]),
            constant "zip"     (zip :: [Int] -> [Int] -> [(Int, Int)]),
            constant "length"  (length :: [Int] -> Int),
            constant "take"    (take :: Int -> [Int] -> [Int]),
            constant "drop"    (drop :: Int -> [Int] -> [Int]),
            constant "reverse" (reverse :: [Int] -> [Int]),
            constant "insert"  (insert :: Int -> [Int] -> [Int]),
            constant "sort"    (sort :: [Int] -> [Int])
        ] ++ predicates
     }

predicates = [
        constant ">"       ((>) :: Int -> Int -> Bool),
        constant "notNull" ((not . null) :: [Int] -> Bool),
        constant "lengthP" ((\xs n -> n < length xs) :: [Int] -> Int -> Bool)
    ]
