{-# LANGUAGE TemplateHaskell #-}
import Hedgehog
import Hedgehog.Main
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Gen.QuickCheck as Gen

-- Functor laws
type MyFunctor = Maybe
type MyFunctorInst = MyFunctor Int

a = (+2)
b = (*(-1))

prop_functor_identity :: Property
prop_functor_identity = property $ do
  xs <- forAll $ (Gen.arbitrary :: Gen MyFunctorInst)
  fmap id xs === id xs

prop_functor_composition :: Property
prop_functor_composition = property $ do
  xs <- forAll $ (Gen.arbitrary :: Gen MyFunctorInst)
  fmap (a . b) xs === ((fmap a) . (fmap b) $ xs)

tests :: IO Bool
tests =
  checkParallel $$(discover)

main = defaultMain [tests]
