{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module PageIndex where

import Control.Monad
import Control.Monad.Fix
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

import PageHome
import PageCreate
import PageRead
import PageUpdate
import PageDelete

data Page = PageHome | PageCreate | PageRead | PageUpdate | PageDelete

pageIndex :: (DomBuilder t m, MonadHold t m, PostBuild t m, MonadFix m) => m ()
pageIndex = do
    h <- elAttr "div" ("class" =: "header") $ do
            el "header" $ do
                  el "h1" $ text "TODO List"
                  el "nav" $ do
                        ul
    dyn_ $ currPag <$> h

ul :: (DomBuilder t m, MonadHold t m) => m (Dynamic t Page)
ul = do
      evs <- el "ul" $ do
            home <- liClicked PageHome "Home"
            create <- liClicked PageCreate "Create"
            read <- liClicked PageRead "Read"
            update <- liClicked PageUpdate "Update"
            delete <- liClicked PageDelete "Delete"
            return (leftmost [home, create, read, update, delete])
      holdDyn PageHome evs

liClicked :: DomBuilder t m => Page -> T.Text -> m (Event t Page)
liClicked p t = do
      (ev, _) <- el' "li" (elAttr "a" ("href" =: "#") (text t))
      return ((\_ -> p) <$> domEvent Click ev)

currPag :: (DomBuilder t m, MonadHold t m, PostBuild t m, MonadFix m) => Page -> m ()
currPag p = case p of
    PageHome -> pageHome
    PageCreate -> pageCreate
    PageRead -> pageRead
    PageUpdate -> pageUpdate
    PageDelete -> pageDelete
