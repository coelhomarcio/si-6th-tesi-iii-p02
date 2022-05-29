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
                        cxtext



click :: DomBuilder t m => m (Event t T.Text)
click = do
    t <- inputElement def
    (evt, _) <- el' "button" (text "Submit")
    return $ attachPromptlyDynWith const (_inputElement_value t) (domEvent Click evt)



cxtext :: (DomBuilder t m, MonadHold t m, PostBuild t m) => m ()
cxtext = do
    evt <- click
    resultado <- holdDyn "" evt
    el "p" (dynText resultado)

