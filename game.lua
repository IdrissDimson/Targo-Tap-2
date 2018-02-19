--*********************************************************************************************
-- ====================================================================
-- Targo Tap Corona Version
-- ====================================================================
--
-- File: game.lua
--
-- Version 0.1
--
--
--*********************************************************************************************

-- define widget
local widget = require("widget")

local composer = require( "composer" )
local scene = composer.newScene()

local Btn1
local Btn2
local Btn3
local Btn4
local timeLeft
local time = 0
local timeLimit = 20
local score = 0

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view
    
    local timeText = display.newText( "TIME:", display.safeActualContentWidth/2.3, display.safeActualContentHeight/6, "Nunito-Black", 60 )
    timeText:setFillColor(.27, .651, 60)
    local scoreText = display.newText( "SCORE:", display.safeActualContentWidth/2.3, display.safeActualContentHeight/4.5, "Nunito-Black", 40 )
    scoreText:setFillColor(.27, .651, 60)
    local numberText = display.newText( 0, display.safeActualContentWidth/2, display.safeActualContentHeight/1.8, "Nunito-Regular", 100 )
    numberText:setFillColor(0, 0, 0)
    numberText.text = ( math.random(1, 4) )
    timeLeft = display.newText(20, display.safeActualContentWidth/1.7, display.safeActualContentHeight/6, "Nunito-Black", 65)
    timeLeft:setFillColor(.27, .651, 60)
    local scoreNumber = display.newText( 0, display.safeActualContentWidth/1.7, display.safeActualContentHeight/4.5, "Nunito-Regular", 60 )
    scoreNumber:setFillColor(.27, .651, 60)
    local function check()
        if Btn1:getLabel() == numberText.text then
            print("You won Da prize boii!")
            score = score + 1
            scoreNumber.text = score
            return true
        else
            print("sike!! that's ze wrong numero!")
            return false
        end
    end
    local function check2()
        if Btn2:getLabel() == numberText.text then
            print("You won Da prize boii!")
            score = score + 1
            scoreNumber.text = score
            return true
        else
            print("sike!! that's ze wrong numero!")
            return false
        end
    end
    local function check3()
        if Btn3:getLabel() == numberText.text then
            print("You won Da prize boii!")
            score = score + 1
            scoreNumber.text = score
            return true
        else
            print("sike!! that's ze wrong numero!")
            return false
        end
    end
    local function check4()
        if Btn4:getLabel() == numberText.text then
            print("You won Da prize boii!")
            score = score + 1
            scoreNumber.text = score
            return true
        else
            print("sike!! that's ze wrong numero!")
            return false
        end
    end
    
    local function BtnSwitch()
        if numberText.text == "3" then
            Btn1:setLabel("1")
            Btn2:setLabel("2")
            Btn3:setLabel("3")
            Btn4:setLabel("4")
        elseif numberText.text == "4" then
            Btn1:setLabel("4")
            Btn2:setLabel("1")
            Btn3:setLabel("2")
            Btn4:setLabel("3")
        elseif numberText.text == "2" then
            Btn1:setLabel("3")
            Btn2:setLabel("4")
            Btn3:setLabel("1")
            Btn4:setLabel("2")
        elseif numberText.text == "1"  then
            Btn1:setLabel("2")
            Btn2:setLabel("3")
            Btn3:setLabel("4")
            Btn4:setLabel("1")
        else
            print("LOLOLOLLOL FAIL")
        end
    end
    local function onBtnRelease()
        -- go to game.lua scene
        print( "You pressed Button!" )
        numberText.text = ( math.random(1, 4) )
        BtnSwitch()
        return true	-- indicates successful touch
    end
    Btn1 = widget.newButton {
        label = "1",
        onPress = check,
        onRelease = onBtnRelease,
        --properties for a rectangle button...
        shape = "Rect",
        width = display.safeActualContentWidth/2,
        height = display.safeActualContentHeight/4,
        cornerRadius = 0,
        labelColor = { default = { 8/255, 19/255, 166/255, 1 }, over = { 149/255, 148/255, 209/255, 1} },
        fillColor = { default={ 149/255, 148/255, 209/255, 1 }, over={  8/255, 19/255, 166/255, 0.4 } },
        fontSize = 70,
        font = "Nunito-Regular"
    }
    Btn2 = widget.newButton {
        label = "2",
        onPress = check2,
        onRelease = onBtnRelease,
        --properties for a rectangle button...
        shape = "Rect",
        width = display.safeActualContentWidth/2,
        height = display.safeActualContentHeight/4,
        cornerRadius = 0,
        labelColor = { default = { 166/255, 8/255, 8/255, 1 }, over = { 207/255, 147/255, 147/255, 1} },
        fillColor = { default={ 207/255, 147/255, 147/255, 1 }, over={ 166/255, 8/255, 8/255, 0.4 } },
        fontSize = 70,
        font = "Nunito-Regular"
    }
    Btn3 = widget.newButton {
        label = "3",
        onPress = check3,
        onRelease = onBtnRelease,
        --properties for a rectangle button...
        shape = "Rect",
        width = display.safeActualContentWidth/2,
        height = display.safeActualContentHeight/4,
        cornerRadius = 0,
        labelColor = { default = { 166/255, 8/255, 8/255, 1 }, over = { 207/255, 147/255, 147/255, 1} },
        fillColor = { default={ 207/255, 147/255, 147/255, 1 }, over={ 166/255, 8/255, 8/255, 0.4 } },
        fontSize = 70,
        font = "Nunito-Regular"
    }
    Btn4 = widget.newButton {
        label = "4",
        onPress = check4,
        onRelease = onBtnRelease,
        --properties for a rectangle button...
        shape = "Rect",
        width = display.safeActualContentWidth/2,
        height = display.safeActualContentHeight/4,
        cornerRadius = 0,
        labelColor = { default = { 8/255, 19/255, 166/255, 1 }, over = { 149/255, 148/255, 209/255, 1} },
        fillColor = { default={ 149/255, 148/255, 209/255, 1 }, over={  8/255, 19/255, 166/255, 0.4 } },
        fontSize = 70,
        font = "Nunito-Regular"
    }
    local numberRect = display.newRoundedRect( display.safeActualContentWidth/2, display.safeScreenOriginY + (display.safeActualContentHeight/2), display.safeActualContentWidth/4, display.safeActualContentHeight/7, 25 )
    
    Btn1.x = display.safeScreenOriginX + (display.safeActualContentWidth/4);
    Btn1.y = display.safeScreenOriginY + (display.safeActualContentHeight/3);
    
    Btn2.x = display.safeScreenOriginX + (display.safeActualContentWidth/1.32);
    Btn2.y = display.safeScreenOriginY + (display.safeActualContentHeight/3);
    
    Btn3.x = display.safeScreenOriginX + (display.safeActualContentWidth/4);
    Btn3.y = display.safeScreenOriginY + (display.safeActualContentHeight/1.7);
    
    Btn4.x = display.safeScreenOriginX + (display.safeActualContentWidth/1.32);
    Btn4.y = display.safeScreenOriginY + (display.safeActualContentHeight/1.7);
    
    
    sceneGroup:insert( timeText )
    sceneGroup:insert( scoreText )
    sceneGroup:insert( scoreNumber )
    sceneGroup:insert( Btn1 )
    sceneGroup:insert( Btn2 )
    sceneGroup:insert( Btn3 )
    sceneGroup:insert( Btn4 )
    sceneGroup:insert( numberRect )
    sceneGroup:insert( numberText )
    sceneGroup:insert( timeLeft )
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
    score = 0
    timeLeft:setFillColor(.27, .651, 60)
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.

        local function timerDown()
           timeLimit = timeLimit-1
           timeLeft.text = timeLimit
                
            if(timeLimit==10)then
                timeLeft:setFillColor(255,0,0)
            elseif(timeLimit==0)then
                print("Time Out") -- or do your code for time out
                timeLimit = 20
                composer.gotoScene( "gameover", "fade", 250 )
            end
          end
        timer.performWithDelay(1000,timerDown,timeLimit)
        
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
        timeLimit = 20
	elseif phase == "did" then
        -- Called when the scene is now off screen
    end 
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
    
    if Btn1 then
		Btn1:removeSelf()	-- widgets must be manually removed
		Btn1 = nil
	end
    if Btn2 then
		Btn2:removeSelf()	-- widgets must be manually removed
		Btn2 = nil
	end
    if Btn3 then
		Btn3:removeSelf()	-- widgets must be manually removed
		Btn3 = nil
	end
    if Btn4 then
        Btn4:removeSelf()
        Btn4 = nil
    end
    if timerDown then
        timerDown:removeSelf()
        timerDown = nil
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