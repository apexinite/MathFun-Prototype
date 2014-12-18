---------------------------------------------------------------------------------
--
-- main.lua
--
---------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- requirements
local composer = require "composer"
local widget = require "widget"
-- load scene1
composer.gotoScene( "game1" )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc)
-- local coronaBtn = display.newImageRect("Icon@2x.png", 114, 114)
-- coronaBtn.x = coronaBtn.width-(114/2)
-- coronaBtn.y = coronaBtn.height-(114/2)