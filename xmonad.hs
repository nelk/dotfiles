import Control.Monad (when)
import Data.Monoid (mconcat)
import Data.Ratio ((%))
import System.Exit
import System.IO
import XMonad
import XMonad.Actions.UpdatePointer (updatePointer, PointerPosition(..))
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers (isDialog)
import XMonad.Layout.Grid (Grid(..))
import XMonad.Layout.IM (Property(..), withIM)
import XMonad.Layout.Combo (combineTwo)
import XMonad.Layout.Tabbed (tabbed, defaultTheme, shrinkText)
import XMonad.Layout.TwoPane
import XMonad.Layout.WindowNavigation
import XMonad.StackSet (shiftMaster, focusUp, focusDown, greedyView, shift)
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Util.Cursor (setDefaultCursor)
import XMonad.Util.Run (spawnPipe, runProcessWithInput)
import qualified Data.Map as M


main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ xconfig xmproc

workspaceBindings :: [(KeySym, String)]
workspaceBindings = [ (xK_1, "web")
                    , (xK_2, "work")
                    , (xK_3, "3")
                    , (xK_4, "4")
                    , (xK_5, "5")
                    , (xK_6, "6")
                    , (xK_7, "7")
                    , (xK_8, "8")
                    , (xK_9, "videos")
                    , (xK_0, "chat")
                    , (xK_minus, "-")
                    , (xK_equal, "=")
                    ]

hangoutsResource :: String
hangoutsResource = "crx_nckgahadagoaajjgafhacjanaoiihapd" 

xconfig xmproc = defaultConfig
  { workspaces = map snd workspaceBindings
  , manageHook = mconcat
      [ className =? "Do" --> doFloat -- Float gnome-do.
      , title =? "Guake!" --> doFloat -- Float guake.
      , title =? "Tabs Outliner" --> (doF $ shift "web")
      , title =? "Video Storage" --> (doF $ shift "videos")
      , resource =? hangoutsResource--> (doF $ shift "chat")
      , className =? "Pidgin" --> (doF $ shift "chat")
      , isDialog --> doF shiftMaster
      , manageDocks
      ]
  , startupHook = setWMName "LG3D" >> setDefaultCursor xC_top_left_arrow
  , layoutHook = avoidStruts $ windowNavigation $ webLayoutWrapper $ chatLayoutWrapper defaultLayout
  , logHook = do
      dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle = xmobarColor "green" "" . shorten 50
        , ppLayout = const ""
        }
      --updatePointer (Relative 0.5 0.5)
  , terminal = "gnome-terminal"
  , modMask = mod4Mask -- Use Super instead of Alt.
  , borderWidth = 0
  , keys = \conf -> let defaultKeys = keys defaultConfig conf
                        someRemovedKeys = foldr M.delete defaultKeys $ removeKeys conf
                    in foldr (uncurry M.insert) someRemovedKeys $ newKeys conf
  }

imLayoutLeftWrapper rosterProperty = withIM (1 % 6) rosterProperty
imLayoutRightWrapper rosterProperty = reflectHoriz . imLayoutLeftWrapper rosterProperty
webLayoutWrapper = onWorkspace "web" ((imLayoutLeftWrapper (Title "Tabs Outliner") $ Mirror Grid) ||| Full)
chatLayoutWrapper = onWorkspace "chat" ((imLayoutLeftWrapper (Title "Hangouts") $ imLayoutRightWrapper (Title "Buddy List") $ Mirror Grid) ||| Full)

defaultLayout = combineTwo (TwoPane 0.03 0.5) (tabbed shrinkText defaultTheme) (tabbed shrinkText defaultTheme) ||| Full

altMask :: KeyMask
altMask = mod1Mask

newKeys :: XConfig Layout -> [((KeyMask, KeySym), X ())]
newKeys (XConfig {modMask = modMask'}) =
  [ ((controlMask .|. altMask, xK_l), spawn "xscreensaver-command -lock")
  , ((noModMask, stringToKeysym "XF86AudioLowerVolume"), spawn "amixer -D pulse -q sset Master 5%- unmute")
  , ((noModMask, stringToKeysym "XF86AudioRaiseVolume"), spawn "amixer -D pulse -q sset Master 5%+ unmute")
  , ((noModMask, stringToKeysym "XF86AudioMute"), spawn "amixer -D pulse -q sset Master 1+ toggle")
  , ((modMask' .|. shiftMask, xK_q), withConfirm "Really quit?" $ io (exitWith ExitSuccess))
  , ((modMask' .|. shiftMask, xK_h), sendMessage (Move L) >> sendMessage (Swap L))
  , ((modMask' .|. shiftMask, xK_l), sendMessage (Move R) >> sendMessage (Swap R))
  , ((modMask' .|. shiftMask, xK_j), sendMessage (Move D) >> sendMessage (Swap D))
  , ((modMask' .|. shiftMask, xK_k), sendMessage (Move U) >> sendMessage (Swap U))
  , ((modMask', xK_h), windows focusUp)
  , ((modMask', xK_l), windows focusDown)
  --, ((modMask', xK_j), sendMessage $ Go D)
  --, ((modMask', xK_k), sendMessage $ Go U)
  ] ++ concat [
    [ ((modMask', key), windows $ greedyView ws)
    , ((modMask' .|. shiftMask, key), windows $ shift ws)
    ] | (key, ws) <- workspaceBindings
  ]

removeKeys :: XConfig Layout -> [(KeyMask, KeySym)]
removeKeys (XConfig {modMask = modMask'}) =
  [ (modMask' .|. shiftMask, xK_q)
  , (modMask', xK_p)]
  ++ [(modMask', key) | key <- [xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9]]

withConfirm :: String -> X () -> X ()
withConfirm msg action = do
  response <- runProcessWithInput "dmenu" ["-p", msg] "yes\nno\n"
  when (response == "yes") action

