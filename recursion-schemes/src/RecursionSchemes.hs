{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE DeriveFunctor #-}
module RecursionSchemes where

import Data.Monoid

data Tree a = Empty | Leaf a | Node (Tree a) (Tree a)

instance Functor Tree where
  fmap :: (a -> b) -> Tree a -> Tree b
  fmap f = \case
    Empty      -> Empty
    (Leaf x)   -> Leaf (f x)
    (Node l r) -> Node (fmap f l) (fmap f r)

instance Foldable Tree where
  foldMap :: Monoid b => (a -> b) -> Tree a -> b
  foldMap _ Empty    = mempty
  foldMap f (Leaf x) = f x
  foldMap f (Node l r) = foldMap f l <> foldMap f r

instance Traversable Tree where
  traverse :: Applicative f => (a -> f b) -> Tree a -> f (Tree b)
  traverse f = \case
    Empty      -> pure Empty
    (Leaf x)   -> Leaf <$> f x
    (Node l r) -> Node <$> traverse f l <*> traverse f r

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ agg []     = agg
foldr' f agg (x:xs) = f x (foldr f agg xs)

foldr'' :: (Maybe (a, b) -> b) -> [a] -> b
foldr'' alg []     = alg   Nothing
foldr'' alg (a:as) = alg $ Just (a, foldr'' alg as)

showit :: Maybe (Double, String) -> String
showit = \case
  Nothing -> "N"
  Just (a, b) -> "J(" ++ show a ++ "," ++ b ++ ")"

rationalizeit :: Maybe (Int, Double) -> Double
rationalizeit = \case
  Nothing -> 1
  Just (a, b) -> a' + b / (a' + b)
    where
      a' = fromIntegral a

-------------------------------------------------------------------------------
newtype Fix f = Fix { unFix :: f (Fix f) }

data ListF a r = C a r | N
  deriving Functor

data NatF r = Succ r | Zero
  deriving Functor

cata :: forall f a . Functor f => (f a -> a) -> Fix f -> a
cata alg = alg . fmap (cata alg) . unFix

showitF :: ListF Double -> String
showitF = cata alg m where
  alg :: ListF Double -> String
  alg = undefined


