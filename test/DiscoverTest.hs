{-# LANGUAGE ScopedTypeVariables #-}

module DiscoverTest where

import           Data.List
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck    

test_addition :: TestTree
test_addition = testProperty "Addition commutes" $ \(a :: Int) (b :: Int) -> a + b == b + a
