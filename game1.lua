local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene(game1)

---------------------------------------------------------------------------------
local function handleStart( event )

    if ( "ended" == event.phase ) then
        print( "starting game1" )
        buttonStart:removeSelf();
        bgStartMask:removeSelf();
        -- composer.gotoScene("scene1", "slideRight", 800)
		update()
		update2()
    end
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	-- local sceneTitle = display.newText("Game1", display.contentCenterX, display.contentCenterY - 200, native.SystemFont, 72)
	local bg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	local centerPanel = display.newImage("img/iPhone-6-Center-Panel-Design.png", display.contentCenterX, display.contentCenterY)

-- PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK 
-- PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK 
-- PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK 
 	puck = display.newCircle(100, 100, 100)
	puck:setFillColor(1, 0, 0)
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
-- PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK 
-- PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK 
-- PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK PUCK 

	
-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 
-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 
-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 
-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 
	local function newArc(startAngle, widthAngle, radius, xPos, yPos, color)
	    startAngle = startAngle or 0
	    widthAngle = widthAngle or 90
	    radius = radius or 100
	    local vert = {}
	    vert[#vert+1] = 0 
	    vert[#vert+1] = 0
	    
	    
	    local minX, minY = 0,0
	    local initX, initY = radius * math.cos(startAngle), radius * math.sin(startAngle)
	    if (initX < minX) then minX = initX end
	    if (initY < minY) then minY = initY end
	    
	    for i = 0, widthAngle do
	        local a = (startAngle+i)*math.pi/180
	        
	        local x, y = radius * math.cos(a), radius * math.sin(a)
	        vert[#vert+1] = x
	        vert[#vert+1] = y
	        
	        if (x < minX) then minX = x end
	        if (y < minY) then minY = y end
	    end
	    
	    local arc = display.newPolygon(xPos + minX, yPos + minY, vert)
	    arc.anchorX, arc.anchorY = 0, 0
	    arc:setFillColor(color[1],color[2],color[3])
	   
	    return arc
	end

	local startAngle = 270
	local curAngle = 360
	local radius = 40
	local buffer = 5
	local color1, color2 = {0,0,.8}, {0.4,0.4,.8}
	local xPos, yPos = display.contentCenterX*1.75, display.contentCenterY*1.75
	local arc1 = newArc(startAngle,curAngle,radius+buffer,xPos,yPos,color1);
	-- local arc2 = newArc(startAngle,curAngle,radius,xPos,yPos,color2);

	function update()
	    curAngle = curAngle - 1
	    -- if (curAngle == 0) then 
	    -- 	curAngle = 360; 
	    -- 	print('done'); 
	    -- end
	    arc1:removeSelf();
	    -- arc2:removeSelf();
	    arc1 = newArc(startAngle,curAngle,radius+buffer,xPos,yPos,color1);
	    -- arc2 = newArc(startAngle,curAngle,radius,xPos,yPos,color2);
		-- arc1.xScale = -1
		-- arc1.x, arc1.y = display.contentCenterX*1.75, display.contentCenterY*1.75
		-- arc2.xScale = -1
		sceneGroup:insert(arc1)
		-- sceneGroup:insert(arc2)

 		-- timer.performWithDelay(88, update)
 		if curAngle >= 0 then
 			timer.performWithDelay(10, update)
 		end
 		print (curAngle); -- for debuggin purposes
	end
	timerText = display.newText("burp" ,100, 180, native.systemFont, 22)
	timerText:setTextColor(1, 1, 0 )

	local countdown = 10
	function update2()
		timerText.text = countdown
		countdown = countdown - 1
		timer.performWithDelay(1000, update2)
		print (countdown)
	end



-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 
-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 
-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 
-- TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER TIMER 


	buttonStart = widget.newButton
	{
		label = "Start",
		fontSize = "72",
		onEvent = handleStart,
		emboss = false,
		--properties for a rounded rectangle button...
		shape="circle",
		radius = 100,
		fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
		strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
		strokeWidth = 4
	}	
	buttonStart.x = display.contentCenterX 
	buttonStart.y = display.contentCenterY

	bgStartMask = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	bgStartMask:setFillColor(0, 0, 0, 0.9)

	sceneGroup:insert(bg)
	sceneGroup:insert(centerPanel)
	sceneGroup:insert(puck)

	sceneGroup:insert(arc1)
	sceneGroup:insert(timerText)
	-- sceneGroup:insert(arc2)

	sceneGroup:insert(bgStartMask)
	sceneGroup:insert(buttonStart)




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