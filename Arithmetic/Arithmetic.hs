module Arithmetic (sig, predicates) where

import Prelude hiding(max, min)
import Test.QuickCheck
import QuickSpec

max :: Int -> Int -> Int
max a b
    | a > b     = a
    | otherwise = b

min :: Int -> Int -> Int
min a b
    | a < b     = a
    | otherwise = b

sig =
  signature {
    maxTermSize = Just 7,
    constants = [
       constant "max" max,
       constant "min" min,
       constant "x" (coerce . a21 :: Pgt -> Int),
       constant "y" (coerce . a22 :: Pgt -> Int),
       constant "+" ((+) :: Int -> Int -> Int),
       constant "*" ((*) :: Int -> Int -> Int),
       constant "/" (div :: Int -> Int -> Int),
       constant "%" (rem :: Int -> Int -> Int),
       constant "-" ((-) :: Int -> Int -> Int),
       constant "0" (0 :: Int),
       constant "1" (1 :: Int),
       constant "-1" (-1 :: Int)
    ] ++ predicates
   }

predicates = [
        constant "/="         ((/=) :: Int -> Int -> Bool),
        constant ">"          ((>)  :: Int -> Int -> Bool),
        constant "pos"        ((>0) :: Int -> Bool),
        constant "neg"        ((<0) :: Int -> Bool),
        constant "absGreater" ((\x y -> abs x > abs y) :: Int -> Int -> Bool)
    ]
