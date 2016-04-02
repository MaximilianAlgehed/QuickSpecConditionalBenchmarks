module Lists (sig, predicates) where
import QuickSpec

sig = signature {
        maxTermSize = Just 10,
        constants = [
            constant "[]" ([] :: [A]),
            constant ":"  ((:) :: A -> [A] -> [A]),
            constant "++" ((++) :: [A] -> [A] -> [A]),
            constant "zip" (zip :: [A] -> [B] -> [(A, B)]),
            constant "length" (length :: [A] -> Int),
            constant "take" (take :: Int -> [A] -> [A]),
            constant "drop" (drop :: Int -> [A] -> [A]),
            constant "reverse" (reverse :: [A] -> [A])
        ] ++ predicates
     }

predicates = [
        constant ">"       ((>) :: Int -> Int -> Bool),
        constant "notNull" ((not . null) :: [A] -> Bool),
        constant "lengthP" ((\xs n -> n < length xs) :: [A] -> Int -> Bool)
    ]
