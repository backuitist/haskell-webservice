module User where

import Data.Aeson (ToJSON, FromJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import Protolude

data User = User
  { name :: Text
  , age :: Int
  } deriving (Eq, Show, Generic)

-- Use Aeson to convert user to JSON
instance ToJSON User
instance FromJSON User