import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.Script
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"
  --xmproc <- spawnPipe "/usr/bin/xmobar /home/alex/.xmobarrc"
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , startupHook = setWMName "LG3D" -- <+> execScriptHook "startup"
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , logHook = takeTopFocus <+> dynamicLogWithPP xmobarPP
                  { ppOutput = hPutStrLn xmproc
                  , ppTitle = xmobarColor "green" "" . shorten 50
                  }
    , terminal = "gnome-terminal"
    , modMask = mod4Mask -- Use Super instead of Alt
    , borderWidth = 0
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
    ]
