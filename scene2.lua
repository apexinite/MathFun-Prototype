local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene(scene2)

---------------------------------------------------------------------------------

local function handleEnterLevelBtnEvent( event )

    if ( "ended" == event.phase ) then
        print( "Play was pressed and released" )
        composer.gotoScene("scene1", "slideDown", 800)
    end
end

local function handleBtnEnterGame1Event( event )

    if ( "ended" == event.phase ) then
        print( "Entering Game1" )
        composer.gotoScene("game1", "zoomOutInFade", 800)
    end
end

local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached top limit" )
        elseif ( event.direction == "down" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "left" ) then print( "Reached left limit" )
        elseif ( event.direction == "right" ) then print( "Reached right limit" )
        end
    end

    return true
end


function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	local buttonEnterLevel = widget.newButton
	{
		label = "Select Level",
		fontSize = "72",
		onEvent = handleEnterLevelBtnEvent,
		emboss = false,
		--properties for a rounded rectangle button...
		shape="roundedRect",
		width = 500,
		height = 100,
		cornerRadius = 30,
		fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
		strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
		strokeWidth = 4
	}	
	buttonEnterLevel.x = display.contentCenterX 
	buttonEnterLevel.y = display.contentCenterY - 300
--                                          x   y   w   h
	-- local rect1 = display.newRoundedRect( 200,250,400,400, 25)
	local buttonEnterGame1 = widget.newButton {
		label = "Game1",
		fontSize = "72",
		onEvent = handleBtnEnterGame1Event,
		emboss = false,
		--properties for a rounded rectangle button...
		shape="roundedRect",
		width  = 400,
		height = 400,
		cornerRadius = 25,
		fillColor = { default={ 1, 0, 1, 1 }, over={ 1, 0, 1, 0.4 } },
		-- strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
		-- strokeWidth = 4
	}
	buttonEnterGame1.x = 200 
	buttonEnterGame1.y = 250
	local rect2 = display.newRoundedRect( 650,250,400,400, 25)
	local rect3 = display.newRoundedRect( 1100,250,400,400, 25)
	-- local rect4 = display.newRect( 700,250,300,300)
	-- local rect5 = display.newRect( 900,250,300,300)
	-- local rect6 = display.newRect(1100,250,300,300)
	-- local rect7 = display.newRect(1300,250,300,300)
	-- local rect8 = display.newRect(1500,250,300,300)
	-- rect1:setFillColor(1, 0, 1)
	rect2:setFillColor(1, 1, 0)
	rect3:setFillColor(1, 0, 1)
	-- rect4:setFillColor(1, 0, 1)
	-- rect5:setFillColor(1, 1, 0)
	-- rect6:setFillColor(1, 0, 1)
	-- rect7:setFillColor(1, 1, 0)
	-- rect8:setFillColor(1, 0, 1)

	local scrollerWidth = 1100
	local scrollView = widget.newScrollView
	{
	    top = 200,
	    left = 667-scrollerWidth/2,
	    width = scrollerWidth,
	    height = 500,
	    scrollWidth = 1000,
	    scrollHeight = 500,
	    verticalScrollDisabled = true,
	    hideBackground = true,
	    listener = scrollListener
	}

	-- local scrollView = widget.newScrollView{ left = 0, width = 0, height = 200, }

	-- scrollView:insert(rect1);
	scrollView:insert(buttonEnterGame1);
	scrollView:insert(rect2);
	scrollView:insert(rect3);
	-- scrollView:insert(rect4);
	-- scrollView:insert(rect5);
	-- scrollView:insert(rect6);
	-- scrollView:insert(rect7);
	-- scrollView:insert(rect8);

	sceneGroup:insert(buttonEnterLevel)
	sceneGroup:insert(scrollView)
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