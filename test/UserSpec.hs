module UserSpec where

import Test.Aeson.GenericSpecs
import Test.Hspec
import User
import Data.Aeson (encode)
import Arbitraries

spec_user :: Spec
spec_user = goldenSpecs defaultSettings (Proxy :: Proxy User)
    
    -- do
    -- describe "user" $ do
    --     it "should be serializable to json" $ do
    --         encode (User "john" 12) `shouldBe` "{ \"name\": \"john\", \"age\": 12 }"