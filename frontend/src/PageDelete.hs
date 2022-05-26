{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module PageDelete where

import Reflex.Dom.Core
import qualified Data.Text as T

import Common.Paragraphs

pageDelete :: DomBuilder t m => m ()
pageDelete = do
    elAttr "div" ("class" =: "main") $ do
        el "main" $ do
            el "h2" $ text $ T.pack h2Delete
            el "p" $ text "Delete works!"
