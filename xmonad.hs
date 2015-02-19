import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Util.Run (spawnPipe)
import Data.Monoid (mconcat)
import System.IO
import Graphics.X11.Xlib.Misc
import qualified Data.Map as M


main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ xconfig xmproc

xconfig xmproc = defaultConfig
  { manageHook = mconcat
      [ className =? "Do" --> doFloat -- Float gnome-do.
      , title =? "Guake!" --> doFloat -- Float guake.
      , manageDocks
      ]
  , startupHook = setWMName "LG3D"
  , layoutHook = avoidStruts $ layoutHook defaultConfig
  , logHook = takeTopFocus <+> dynamicLogWithPP xmobarPP
                { ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "green" "" . shorten 50
                }
  , terminal = "gnome-terminal"
  , modMask = mod4Mask -- Use Super instead of Alt.
  , borderWidth = 0
  , keys = \conf -> let defaultKeys = keys defaultConfig conf
                        someRemovedKeys = foldr M.delete defaultKeys $ removeKeys conf
                    in foldr (uncurry M.insert) someRemovedKeys $ newKeys conf
  }


newKeys :: XConfig Layout -> [((KeyMask, KeySym), X ())]
newKeys conf =
  [ ((modMask conf .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
  , ((noModMask, stringToKeysym "XF86AudioLowerVolume"), spawn "amixer -D pulse -q sset Master 5%- unmute")
  , ((noModMask, stringToKeysym "XF86AudioRaiseVolume"), spawn "amixer -D pulse -q sset Master 5%+ unmute")
  , ((noModMask, stringToKeysym "XF86AudioMute"), spawn "amixer -D pulse -q sset Master 1+ toggle")
  ]

removeKeys :: XConfig Layout -> [(KeyMask, KeySym)]
removeKeys conf = [] -- [(modMask conf .|. shiftMask, xK_q)]

