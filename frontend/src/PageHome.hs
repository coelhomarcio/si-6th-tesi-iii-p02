{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module PageHome where

import Reflex.Dom.Core
import qualified Data.Text as T

import Common.Paragraphs

pageHome :: DomBuilder t m => m ()
pageHome = do
    elAttr "div" ("class" =: "main") $ do
        el "main" $ do
            el "h2" $ text $ T.pack h2Home
            el "p" $ text $ T.pack pHome01
            el "p" $ text $ T.pack pHome02
            el "p" $ text $ T.pack pHome03
            el "p" $ text $ T.pack pHome04
