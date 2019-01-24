module KafkaDemo (sendMessages) where

import User
import Control.Exception (bracket)
import Control.Monad (forM_)
import qualified Data.ByteString.Lazy as LBS
import Data.ByteString (ByteString)
import Kafka.Producer
import Data.Aeson (encode)
import Protolude

sendMessages :: IO ()
sendMessages =
    bracket mkProducer clProducer runHandler >>= print
    where
        mkProducer = newProducer producerProps
        clProducer (Left _)     = return ()
        clProducer (Right prod) = closeProducer prod
        runHandler (Left err)   = return $ Left err
        runHandler (Right prod) = sendUsers prod

-- Global producer properties
producerProps :: ProducerProperties
producerProps = brokersList [BrokerAddress "localhost:9092"]
                <> logLevel KafkaLogDebug

-- Topic to send messages to
targetTopic :: TopicName
targetTopic = TopicName "users"

sendUsers :: KafkaProducer -> IO (Either KafkaError ())
sendUsers prod = do
    err1 <- produceMessage prod (mkMessage (Just "userId1") (Just (encodeStrict $ User "john" 12)) )
    forM_ err1 print

    err2 <- produceMessage prod (mkMessage Nothing (Just (encodeStrict $ User "lisbeth" 21)))
    forM_ err2 print

    return $ Right ()

mkMessage :: Maybe ByteString -> Maybe ByteString -> ProducerRecord
mkMessage k v = ProducerRecord
                    { prTopic = targetTopic
                    , prPartition = UnassignedPartition
                    , prKey = k
                    , prValue = v
                    }

encodeStrict = LBS.toStrict . encode                    