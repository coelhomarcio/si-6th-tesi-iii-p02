{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module PageRead where

import Reflex.Dom.Core
import qualified Data.Text as T

import Common.Paragraphs

pageRead :: DomBuilder t m => m ()
pageRead = do
    elAttr "div" ("class" =: "main") $ do
        el "main" $ do
            el "h2" $ text $ T.pack h2Read
            el "p" $ text "Read works!"
