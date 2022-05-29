{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module PageCreate where

import Reflex.Dom.Core
import qualified Data.Text as T

import Common.Paragraphs

pageCreate :: (DomBuilder t m, MonadHold t m, PostBuild t m) => m ()
pageCreate = do
    elAttr "div" ("class" =: "main") $ do
        el "main" $ do
            el "h2" $ text $ T.pack h2Create
            elAttr "form" ("action" =: "javascript:void(0);") $ do
                el "fieldset" $ do
                    el "legend" $ text "Adicionar"
                    el "div" $ do
                        el "label" $ text "Tarefa"
                        input

input :: (DomBuilder t m, MonadHold t m, PostBuild t m) => m ()
input = do
    evt <- event
    output <- holdDyn "" evt
    el "p" (dynText output)

event :: DomBuilder t m => m (Event t T.Text)
event = do
    t <- inputElement def
    (evt, _) <- el' "button" (text "Gravar")
    return $ attachPromptlyDynWith const (_inputElement_value t) (domEvent Click evt)
