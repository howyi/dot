require "fntools"
require "extensions"
require "keyboard_grid"

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("🦉")

local hyper = {"ctrl", "alt"}
local hotkey = require "hs.hotkey"
local grid = require "hs.grid"

grid.MARGINX = 10
grid.MARGINY = 10
grid.GRIDHEIGHT = 6
grid.GRIDWIDTH = 6

local mash = {"alt", "ctrl"}
local mashshift = {"alt", "ctrl", "shift"}
local slightmash = {"cmd", "ctrl"}


--Move windows
hotkey.bind(mash, 'DOWN', grid.pushWindowDown)
hotkey.bind(mash, 'UP', grid.pushWindowUp)
hotkey.bind(mash, 'LEFT', grid.pushWindowLeft)
hotkey.bind(mash, 'RIGHT', grid.pushWindowRight)

--Move windows slightly
hotkey.bind(slightmash, 'DOWN', grid.pushWindowDown)
hotkey.bind(slightmash, 'UP', grid.pushWindowUp)
hotkey.bind(slightmash, 'LEFT', grid.pushWindowLeft)
hotkey.bind(slightmash, 'RIGHT', grid.pushWindowRight)


--resize windows
hotkey.bind(mashshift, 'UP', grid.resizeWindowShorter)
hotkey.bind(mashshift, 'DOWN', grid.resizeWindowTaller)
hotkey.bind(mashshift, 'RIGHT', grid.resizeWindowWider)
hotkey.bind(mashshift, 'LEFT', grid.resizeWindowThinner)


-----------------------------------------------------------
---- アプリケーションショートカット
-----------------------------------------------------------

local fnutils = require "hs.fnutils"
local partial = fnutils.partial
local indexOf = fnutils.indexOf
local filter = fnutils.filter

local window = require "hs.window"
local alert = require "hs.alert"
local grid = require "hs.grid"

yay = "ᕙ(⇀‸↼‶)ᕗ"
boo = "ლ(ಠ益ಠლ)"

hs.crash.crashLogToNSLog = true

---------------------------------------------------------
-- アプリケーションショートカット
---------------------------------------------------------
--hs.hotkey.bind(hyper, "1", launchOrCycleFocus("/Applications/Visual Studio Code.app", "Code"))
hs.hotkey.bind(hyper, "S", launchOrCycleFocus("Slack"))
hs.hotkey.bind(hyper, "C", launchOrCycleFocus("Chatwork"))
hs.hotkey.bind(hyper, "Q", fullScreenCurrent)
hs.hotkey.bind(hyper, "D", screenToRight)


---------------------------------------------------------
-- ウィンドウ一覧
---------------------------------------------------------

hs.hotkey.bind(hyper, "K", function()
    hs.hints.windowHints()
end)

hs.hotkey.bind(hyper, "X", function()
    hs.openConsole()
    hs.focus()
end)


---------------------------------------------------------
-- デバッグ用
---------------------------------------------------------

--function listAllApplications()
--    local apps = hs.application.runningApplications();
--    hs.fnutils.each(apps, function(app)
--        dbg(app)
--    end)
--end

function listAllAboutCurrentApplication()
    local app = hs.application.frontmostApplication()
    dbg(app)
    local debugInfo = string.format([[
    Bundle ID: %s
    Title: %s
    Name: %s
    Path: %s
    PID %s]], app:bundleID(), app:title(), app:name(), app:path(), app:pid())
    print(debugInfo)
end

--hs.hotkey.bind(hyper, "G", listAllApplications)
hs.hotkey.bind(hyper, "G", listAllAboutCurrentApplication)
