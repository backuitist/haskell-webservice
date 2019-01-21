{-# OPTIONS_GHC -fno-warn-orphans #-}
module Arbitraries where

import User
import Generic.Random (genericArbitraryU)
import Test.QuickCheck (Arbitrary, arbitrary)
import Test.QuickCheck.Instances ()

instance Arbitrary User where
    arbitrary = genericArbitraryU