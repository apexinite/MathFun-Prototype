local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene(game1)

---------------------------------------------------------------------------------

-- local function handleEnterLevelBtnEvent( event )

--     if ( "ended" == event.phase ) then
--         print( "Play was pressed and released" )
--         composer.gotoScene("scene1", "slideRight", 800)
--     end
-- end


function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	-- local buttonEnterLevel = widget.newButton
	-- {
	-- 	label = "Select Level",
	-- 	fontSize = "72",
	-- 	onEvent = handleEnterLevelBtnEvent,
	-- 	emboss = false,
	-- 	--properties for a rounded rectangle button...
	-- 	shape="roundedRect",
	-- 	width = 500,
	-- 	height = 100,
	-- 	cornerRadius = 30,
	-- 	fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
	-- 	strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
	-- 	strokeWidth = 4
	-- }	
	-- buttonEnterLevel.x = display.contentCenterX 
	-- buttonEnterLevel.y = display.contentCenterY - 300
	-- local sceneTitle = display.newText("Game1", display.contentCenterX, display.contentCenterY - 200, native.SystemFont, 72)
	local bg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	puck = display.newCircle(100, 100, 100)
	puck:setFillColor(1, 0, 0)
	local centerPanel = display.newImage("img/iPhone-6-Center-Panel-Design.png", display.contentCenterX, display.contentCenterY)
	-- sceneGroup:insert(buttonEnterLevel)
	-- sceneGroup:insert(sceneTitle)
	sceneGroup:insert(bg)
	sceneGroup:insert(centerPanel)
	sceneGroup:insert(puck)
	function puck:touch( event )
	    if event.phase == "began" then
		
	        self.markX = self.x    -- store x location of object
	        self.markY = self.y    -- store y location of object
		
	    elseif event.phase == "moved" then
		
	        local x = (event.x - event.xStart) + self.markX
	        local y = (event.y - event.yStart) + self.markY
	        
	        self.x, self.y = x, y    -- move object based on calculations above
	    end
	    
	    return true
	end
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- composer.removeScene("scene1")
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		puck:addEventListener( "touch", puckTouchListener )

	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end


function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene