{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Header where

import Control.Monad
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import Language.Javascript.JSaddle (eval, liftJSM)

import Obelisk.Frontend
import Obelisk.Configs
import Obelisk.Route
import Obelisk.Generated.Static

import Reflex.Dom.Core

import Common.Paragraphs
import Common.Route

header :: DomBuilder t m => m ()
header = do
      elAttr "div" ("class" =: "header") $ do
            el "header" $ do
                  el "h1" $ text "TODO List"
                  nav
                  return ()

nav :: DomBuilder t m => m ()
nav = do
      el "nav" $ do
            el "ul" $ do
                  el "li" $ do
                        elAttr "a" ("href" =: "/" <> "title" =: "Home") $ text "Home"
                  el "li" $ do
                        elAttr "a" ("href" =: "create" <> "title" =: "Create") $ text "Create"
                  el "li" $ do
                        elAttr "a" ("href" =: "read" <> "title" =: "Read") $ text "Read"
                  el "li" $ do
                        elAttr "a" ("href" =: "update" <> "title" =: "Update") $ text "Update"
                  el "li" $ do
                        elAttr "a" ("href" =: "delete" <> "title" =: "Delete") $ text "Delete"
