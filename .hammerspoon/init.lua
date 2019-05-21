require "fntools"
require "extensions"
require "keyboard_grid"

hs.alert.show("🦉こんにちは🦉")

---------------------------------------------------------
-- 基本ショートカットキー
---------------------------------------------------------
local hyper = {"ctrl", "alt"}
local hypershift = {"alt", "ctrl", "shift"}

---------------------------------------------------------
-- グリッド設定
---------------------------------------------------------
hs.grid.MARGINX = 10
hs.grid.MARGINY = 10
hs.grid.GRIDHEIGHT = 6
hs.grid.GRIDWIDTH = 6

---------------------------------------------------------
-- ウィンドウ移動
---------------------------------------------------------
hs.hotkey.bind(hyper, 'DOWN', hs.grid.pushWindowDown)
hs.hotkey.bind(hyper, 'UP', hs.grid.pushWindowUp)
hs.hotkey.bind(hyper, 'LEFT', hs.grid.pushWindowLeft)
hs.hotkey.bind(hyper, 'RIGHT', hs.grid.pushWindowRight)

---------------------------------------------------------
-- ウィンドウリサイズ
---------------------------------------------------------
hs.hotkey.bind(hypershift, 'UP', hs.grid.resizeWindowShorter)
hs.hotkey.bind(hypershift, 'DOWN', hs.grid.resizeWindowTaller)
hs.hotkey.bind(hypershift, 'RIGHT', hs.grid.resizeWindowWider)
hs.hotkey.bind(hypershift, 'LEFT', hs.grid.resizeWindowThinner)

---------------------------------------------------------
-- アプリケーションショートカット
---------------------------------------------------------
--hs.hotkey.bind(hyper, "1", launchOrCycleFocus("/Applications/Visual Studio Code.app", "Code"))
hs.hotkey.bind(hyper, "S", launchOrCycleFocus("Slack"))
hs.hotkey.bind(hyper, "C", launchOrCycleFocus("Chatwork"))
hs.hotkey.bind(hyper, "Q", fullScreenCurrent)

---------------------------------------------------------
-- ウィンドウ一覧
---------------------------------------------------------

hs.hotkey.bind(hyper, "K", function()
    hs.hints.windowHints()
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

---------------------------------------------------------
-- コンフィグの自動リロード
---------------------------------------------------------
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
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/dot/.hammerspoon/", reloadConfig):start()

---------------------------------------------------------
-- デバッグコンソールを開く
---------------------------------------------------------
hs.hotkey.bind(hyper, "X", function()
    hs.openConsole()
    hs.focus()
end)

---------------------------------------------------------
-- デバッグ設定
---------------------------------------------------------
hs.crash.crashLogToNSLog = true
