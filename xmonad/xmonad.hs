 import XMonad
 import XMonad.Hooks.DynamicLog
 import XMonad.Hooks.ManageDocks
 import XMonad.Util.Run(spawnPipe)
 import XMonad.Util.EZConfig(additionalKeys)
 import System.IO

 main = do
    xmproc <- spawnPipe "xmobar /home/chris/.xmobarrc"
    xmonad $ defaultConfig {
        manageHook = manageHook defaultConfig <+> manageDocks
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
        }
        , borderWidth = 3
        , normalBorderColor = "#cccccc"
        , focusedBorderColor = "#cd8b00"
        , modMask = mod4Mask
        , terminal = "urxvt"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
