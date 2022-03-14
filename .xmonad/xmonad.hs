import XMonad
import Data.Monoid
import System.Exit
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.Minimize (minimizeEventHook)
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Actions.SpawnOn
import XMonad.Layout.LayoutModifier(ModifiedLayout)
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.BoringWindows (boringWindows, focusUp, focusDown)
import XMonad.Layout.Maximize (maximize, maximizeRestore)
import XMonad.Layout.Minimize (minimize)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8 

myTerminal = "alacritty"
myModMask = mod4Mask

-- Colours
gray      = "#3B4252"
gray2     = "#4C566A"
red       = "#BF616A"
blue      = "#88C0D0"
white     = "#ECEFF4"
myNormalBorderColor = "#5E81AC"
myFocusedBorderColor    = "#A3BE8C"

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myLayoutHook        = avoidStruts (tiled ||| renamed [Replace "Full"] ( smartBorders . maximize . minimize . boringWindows $ Full ))
  where
    tiled   = Tall nmaster delta ratio
    nmaster     = 1
    ratio   = 1/2
    delta   = 3/100
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
      -- launch a terminal
      ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf),

      -- media keys
      ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
      ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"),
      ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%"),

      -- launch firefox
      ((modm .|. shiftMask, xK_b), spawn "firefox"),

      -- launch VS Code
      ((modm .|. shiftMask, xK_v), spawn "code"),

      -- launch alsa mixer
      ((modm .|. shiftMask, xK_a), spawn "alsamixer"),

      -- screen saver
      ((modm .|. shiftMask, xK_l), spawn "slock")

      -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenu_run")

    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
--    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myStartupHook = do
 -- spawn "/usr/bin/stalonetray"
  spawn "/home/jtpevehouse/.config/polybar/launch.sh"
  setWMName "LG3D"
--  spawnOnce "dropbox"
  spawn "picom -b"

-----------------------------------------------------------------------------

main :: IO ()
main = do
    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

    xmonad $ ewmh $ docks $ defaults { logHook = dynamicLogWithPP (myLogHook dbus) }

-- Override the PP values as you would otherwise, adding colors etc depending
-- on  the statusbar used
myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOrder = \(ws:l:t:_) -> [ws]
    , ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{F" ++ blue ++ "} ") " %{F-}"
    , ppVisible = wrap ("%{F" ++ gray ++ "} ") " %{F-}"
    , ppUrgent = wrap ("%{F" ++ red ++ "} ") " %{F-}"
    , ppHidden = wrap ("%{F" ++ gray ++ "} ") " %{F-}"
    , ppTitle = wrap ("%{F" ++ gray2 ++ "} ") " %{F-}" . shorten 90
    }
-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"

defaults = def
    { terminal              = myTerminal,
      workspaces            = myWorkspaces,
      modMask               = myModMask,
      normalBorderColor     = myNormalBorderColor,
      focusedBorderColor    = myFocusedBorderColor,
      borderWidth           = 3,
      manageHook            = manageSpawn,
      keys                  = myKeys,
      layoutHook            = spacingRaw False (Border 10 10 10 10) True (Border 10 10 10 10) True $ myLayoutHook,
      startupHook           = myStartupHook,
      handleEventHook       = fullscreenEventHook
    }


-----------------------------------------------------------------------------

help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
