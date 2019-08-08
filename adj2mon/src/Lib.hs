{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE InstanceSigs #-}
module Lib
    ( someFunc
    ) where

import Data.Kind

someFunc :: IO ()
someFunc = putStrLn "someFunc"

-- functor composition is defined for
-- F: A -> B
-- G: B -> C
-- as G * F : A -> C

newtype FComp f g a = C { unC :: f (g a) }

instance (Functor f, Functor g) => Functor (FComp f g) where
  fmap :: (a -> b) -> FComp f g a -> FComp f g b
  fmap f (C x) = C $ (fmap.fmap) f x

-- The identity functor maps each morphism and object onto itself
newtype Identity a = Id { unId :: a }

instance Functor Identity where
  fmap f (Id x) = Id (f x)

-- composition with the identity functor forms an identity relation:
--     F * (Id_A)
-- (Id_B)   F

left :: Functor f => FComp f Identity a -> f a
left (C a) = fmap unId a

right :: Functor f => f a -> FComp f Identity a
right a = C $ fmap Id a

-- Given a Natural Transformation
type Nat f g = forall a . f a -> g a
-- The interchage law states taht we can chase a natural transformation through functors
-- horizonally, or compose natural transformations between functors vertically and still
-- arrive at the same result:
type NatComp f f' g g' = forall a . f' (f a) -> g' (g a)

vert
  :: (Functor f, Functor f')
  => (Functor g, Functor g')
  => Nat f' g' -> Nat f g -> NatComp f f' g g'
vert a b x = a (fmap b x)

horiz
  :: (Functor f, Functor f')
  => (Functor g, Functor g')
  => Nat f' g' -> Nat f g -> NatComp f f' g g'
horiz a b x = fmap b (a x)

