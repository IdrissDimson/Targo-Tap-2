--*********************************************************************************************
-- ====================================================================
-- Targo Tap Corona Version
-- ====================================================================
--
-- File: menu.lua
--
-- Version 0.2
--
--
--*********************************************************************************************

-- define widget
local widget = require("widget");

-- include the Corona "composer" module
local composer = require "composer"
local scene = composer.newScene()

-- forward declarations and other locals
local playBtn
local optionsBtn
local moreBtn

function scene:create( event )
	local sceneGroup = self.view
    --Text
    local myTextObject = display.newText( "TARGO TAP", display.contentWidth/2, display.contentHeight/6, "Nunito-Black", 100 )
    myTextObject:setFillColor(0, 166/255, 156/255)--rgb(0, 166, 156)
    local differentText = display.newText( "Fresh!", display.contentWidth/2, display.contentHeight/4.5, "Nunito-Black", 50 )
    differentText:setFillColor(0, 146/255, 136/255)

    -- 'onRelease' event listener for playBtn
    local function onPlayBtnRelease()
        local phase = event.phase
        -- go to game.lua scene
        composer.gotoScene( "game", "fade", 250 )

        return true -- indicates successful touch
    end

    local function onOptionsBtnRelease() 
        local phase = event.phase
        local options = { params = event.params }
        composer.gotoScene( "options", "fade", 150 )
        return true
    end

    local function onMoreBtnRelease()
        local phase = event.phase
        local options = { params = event.params }
        composer.gotoScene( "more", "fade", 150 )
        return true
    end

    -- Create the widget
    playBtn = widget.newButton {
        label = "Play Targo Tap",
        onRelease = onPlayBtnRelease,
        --properties for a rectangle button...
        shape = "Rect",
        width = display.contentWidth,
        height = display.contentHeight/3,
        cornerRadius = 0,
        labelColor = { default = { .031, .651, .094, 1 }, over = { .000, .551, .000, 1} },
        fillColor = { default={ .616, .82, .58, 1 }, over={ .031, .651, .094, 0.4 } },
        fontSize = 70,
        font = "Nunito-Regular"
    }

    optionsBtn = widget.newButton {
        label = "Options",
        onRelease = onOptionsBtnRelease,--change
        --properties for a rectangle button...
        shape = "Rect",
        width = display.contentWidth/2,
        height = display.contentHeight/3,
        cornerRadius = 0,--rgb(148, 210, 206) --rgb(0, 165, 155)
        labelColor = { default = { 0, .647, .608, 1 }, over = { 0, .547, .508, 1 } },
        fillColor = { default={ .580, .824, .808, 1 }, over={ .480, .724, .708, 1 } },
        fontSize = 70,
        font = "Nunito-Regular"
    }

    moreBtn = widget.newButton {
        label = "More",
        onRelease = onMoreBtnRelease,--change
        --properties for a rectangle button...
        shape = "Rect",
        width = display.contentWidth/2,
        height = display.contentHeight/3,
        cornerRadius = 0,--rgb(255, 178, 123) rgb(239, 113, 25)
        labelColor = { default = { 239/255, 113/255, 25/255, 1 }, over = { 219/255, 93/255, 5/255, 1} },
        fillColor = { default={ 255/255, 158/255, 123/255, 1 }, over={ 235/255, 138/255, 103/255, 1 } },
        fontSize = 70,
        font = "Nunito-Regular"
    }

    -- Center the button
    playBtn.x = display.contentCenterX
    playBtn.y = display.contentCenterY

    -- Place btn below
    optionsBtn.x = display.contentCenterX - (display.contentWidth/4);
    optionsBtn.y = display.contentCenterY + (display.contentHeight/3);
    
    -- Place btn below
    moreBtn.x = display.contentCenterX + (display.contentWidth/4);
    moreBtn.y = display.contentCenterY + (display.contentHeight/3);

    sceneGroup:insert( myTextObject )
	sceneGroup:insert( differentText )
	sceneGroup:insert( playBtn )
	sceneGroup:insert( optionsBtn )
	sceneGroup:insert( moreBtn )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
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
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
    if optionsBtn then
		optionsBtn:removeSelf()	-- widgets must be manually removed
		optionsBtn = nil
	end
    if moreBtn then
		moreBtn:removeSelf()	-- widgets must be manually removed
		moreBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene