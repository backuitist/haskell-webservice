module User where

import Protolude

import Data.Aeson (ToJSON, encode)
import Data.Text (Text)
import GHC.Generics (Generic)

data User = User
  { name :: Text
  , age :: Int
  } deriving (Eq, Show, Generic)

-- Use Aeson to convert user to JSON
instance ToJSON User