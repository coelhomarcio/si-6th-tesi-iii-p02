{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module PageCreate where

import Reflex.Dom.Core
import qualified Data.Text as T

import Common.Paragraphs

pageCreate :: DomBuilder t m => m ()
pageCreate = do
    elAttr "div" ("class" =: "main") $ do
        el "main" $ do
            el "h2" $ text $ T.pack h2Create
            el "p" $ text "Create works!"
