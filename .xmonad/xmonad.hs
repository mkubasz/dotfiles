import System.IO

import XMonad
import XMonad.Config.Desktop

-- Import Hooks
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook

-- Import Layouts
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.SubLayouts
import XMonad.Layout.OneBig
import XMonad.Layout.Fullscreen
import XMonad.Layout.MultiColumns
import XMonad.Layout.ResizableTile
import XMonad.Actions.MouseResize
import XMonad.Layout.WindowNavigation


-- Import Utils
import XMonad.Util.Run (spawnPipe, safeSpawnProg)

import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeysP)

import qualified XMonad.StackSet as W

-- Settings

gap         = 10

columns =  ThreeCol 1 (3/100) (1/2)

myLayoutHook = smartSpacing gap 
                $ avoidStruts
                $ mouseResize
                $ smartBorders
                $ windowNavigation       
                $ mkToggle (NOBORDERS ?? FULL ?? EOT)
                $ columns 
                ||| multiCol [1] 1 0.01 (-0.5)
                ||| ThreeColMid 1 (3/100) (1/2)
                ||| OneBig (3/4) (3/4) 
                ||| Grid
                ||| Full
                ||| ResizableTall 1 (3/100) (1/2) []

myStartupHook = do
    spawn "xrandr --auto && xrandr --output DP-1 --primary --right-of DP-4"
    setWMName "LG3D"
    spawnOnce "picom --backend glx --vsync --no-usage-damage --experimental-backends &"
    spawnOnce "udiskie -as &"
    spawnOnce "feh --bg-fill --randomize ~/.wallpapers/*"

myStatusBar = "xmobar -x0 ~/.xmobar/xmobar.conf"

myHandleEventHook = handleEventHook defaultConfig 
                    <+> docksEventHook
                    <+> fullscreenEventHook

myManageHook = composeAll
    [manageDocks
    ]

myWorkspaces = ["Main", "Dev", "Playground", "Fun", "Any"]

main = do 
    xmproc <- spawnPipe myStatusBar
    xmonad
      $ docks
      $ ewmh
      $ desktopConfig
      { logHook            = dynamicLogWithPP xmobarPP 
                           { ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                            , ppOutput = hPutStrLn xmproc
                            , ppCurrent = xmobarColor "#c3e88d" "" . wrap "[" "]" 
                            , ppHidden  = xmobarColor "#7F7F7F" ""
                            , ppTitle = xmobarColor "#9ec07c" "" . shorten 60
                            , ppUrgent = xmobarColor "#e06c75" "" . wrap "[" "]" 
                            , ppSep =  "<fc=#4b5363> <fn=1>|</fn> </fc>"
                           }
      , layoutHook         = myLayoutHook
      , startupHook        = myStartupHook
      , handleEventHook    = myHandleEventHook
      , manageHook         = manageDocks <+> myManageHook
      , workspaces         = myWorkspaces

      -- Settings
      , terminal           = "alacritty"
      , modMask            = mod4Mask
      , borderWidth        = 2
      , normalBorderColor  = "#292d3e"
      , focusedBorderColor = "#bbc5ff"
      , focusFollowsMouse  = False
      }  `additionalKeysP`
      [ ("M-d", spawn "rofi -combi-modi window,run,drun -show combi -modi combi")
      , ("<Print>", spawn "sleep 0.2; scrot -s ~/Pictures/Screenshots/Screenshot-%b%d::%H-%M-%S.png")
      , ("M-<Print>", spawn "sleep 0.2; scrot ~/Pictures/Screenshots/Screenshot-%b%d::%H-%M-%S.png")
      ]
