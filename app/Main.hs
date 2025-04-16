{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.Wai ()
import Network.Wai.Handler.Warp (run)
import Network.Wai.Middleware.Cors (simpleCors)
import Servant
import Stats (Stat, stats)

type API = "stats" :> Get '[JSON] [Stat]

server :: Server API
server = return stats

-- WAI Application
app :: Application
app = serve (Proxy :: Proxy API) server

-- Run server on port 8080
main :: IO ()
main = run 8080 $ simpleCors app
