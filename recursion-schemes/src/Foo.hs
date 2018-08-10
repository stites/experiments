module Foo where

reduceRight :: (a -> b -> b) -> b -> [a] -> b
reduceRight fn b as = case as of
  []   -> b
  a:rem -> fn a (reduceRight fn b rem)

showIntList :: [Int] -> String
showIntList =
  let
    fn num str =
      "(" ++ show num ++ "," ++ str ++ ")"
  in
    reduceRight fn ""

reduceRight' :: (Maybe (a, b) -> b) -> [a] -> b
reduceRight' fn as = case as of
  []    -> fn Nothing
  a:rem -> fn (Just (a, reduceRight' fn rem))

show'int'list :: [Int] -> String
show'int'list ints =
    reduceRight' showingStuff ints

showingStuff :: Maybe (Int, String) -> String
showingStuff Nothing           = ""
showingStuff (Just (num, str)) =
      "(" ++ show num ++ "," ++ str ++ ")"




-- showIntsInParens :: Int -> String -> String
-- showIntsInParens 


{-
def reduceRight(fn:(a -> b -> b), b:b, as:[a]):
  if as == []:
    return b
  else:
    return fn(as[0], reduceRight(fn, b, as[1:]))
-}









-- reduceRight1 :: (a -> b -> b) -> b -> [a] -> b
-- reduceRight1 fn memo = \case

-- sum :: [Int] -> Int
-- sum = reduceRight (\a b -> a + b) 0

