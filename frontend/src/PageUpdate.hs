{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module PageUpdate where

import Reflex.Dom.Core
import qualified Data.Text as T

import Common.Paragraphs

pageUpdate :: DomBuilder t m => m ()
pageUpdate = do
    elAttr "div" ("class" =: "main") $ do
        el "main" $ do
            el "h2" $ text $ T.pack h2Update
            el "p" $ text "Update works!"
