module CListQS (sig, predicates) where
import QuickSpec
import Data.Coerce
import CyclicLists
import qualified Prelude as P

sig =
  signature {
    maxTermSize = P.Just 10,
    instances = [
                 baseType (P.undefined::(CList P.Integer)),
                 names (NamesFor ["xs", "ys", "zs"] :: NamesFor (CList P.Integer))
                ],
    constants = [
       constant "[]" (nil :: CList P.Integer),
       constant ":" (cons :: P.Integer -> CList P.Integer -> CList P.Integer),
       constant "drop" (drop :: P.Int -> CList P.Integer -> CList P.Integer),
       constant "take" (take :: P.Int -> CList P.Integer -> CList P.Integer),
       constant "xs" (coerce :: (NC P.Integer) -> CList P.Integer),
       constant "xs" (coerce :: (DC P.Integer) -> CList P.Integer),
       constant "xs" (coerce :: (JC P.Integer) -> CList P.Integer),
       constant "==" ((P.==) :: CList P.Integer -> CList P.Integer -> P.Bool),
       constant "True" P.True,
       constant "False" P.False,
       constant "++" ((++) :: CList P.Integer -> CList P.Integer -> CList P.Integer)
    ] P.++ predicates
   }

predicates = [
                constant "definatelyCyclic" (definatelyCyclic :: CList A -> P.Bool), 
                constant "notCyclic" (notCyclic :: CList A -> P.Bool), 
                constant "justCyclic" (justCyclic :: CList A -> P.Bool)
             ]
