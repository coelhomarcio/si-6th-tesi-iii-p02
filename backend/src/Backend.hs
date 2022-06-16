{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE GADTs #-}

module Backend where

import Common.Route
import Obelisk.Backend

import Database.PostgreSQL.Simple
import Data.Text
import Obelisk.Route
import Snap.Core
import Control.Monad.IO.Class (liftIO)
import qualified Data.Aeson as Aeson

conn :: Conn
conn = Conn "ec2-54-227-248-71.compute-1.amazonaws.com"
            5432
            "fifjxbbylxjstt"
            "4cd238467a660d4ce6c417ee65bc7f77128755473439beac5224411e86cba214"
            "d9ir2pin0ma7h8"

createTable :: Query
createTable = "create table if not exists task (id serial primary key, nm_task text not null)"

backend :: Backend BackendRoute FrontendRoute
backend = Backend
  { _backend_run = \serve -> do
    dbConn <- connect conn
    serve $ do
      \case
        BackendRoute_Task :/ () -> do
          Just nm_task <- Aeson.decode <$> readRequestBody 200
          liftIO $ do
            execute_ dbConn createTable
            execute  dbConn "insert into task (nm_task) values (?)" [nm_task :: Text]
          modifyResponse $ setResponseStatus 200 "Ok"
        _ -> return ()
  , _backend_routeEncoder = fullRouteEncoder
  }
