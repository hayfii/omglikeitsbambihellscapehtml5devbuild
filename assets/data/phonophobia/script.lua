local xx = 0
local yy = 0
local xx2 = 0
local yy2 = 0
local cameraBop = false
local camBopNum = 4
local zoomBeat = 0.015
local flashBopNum = 16
local hudAngle = false
local angleshit = 2;
local anglevar = 2;
local iconP1position = 0
local iconP2position = 0
function onCreate()
    doTweenAlpha('camhudvisible', 'camHUD', 0, 0.0000001)
    doTweenAlpha('dadvisible', 'dad', 0, 0.0000001)
    doTweenAlpha('bfvisible', 'boyfriend', 0, 0.0000001)
    
    precacheImage('jumpscare')
setProperty('gf.visible', false)
end
function onEvent(name, value1, value2)
if name == 'camera Bop' and cameraBop then
    camBopNum = tonumber(value1);
    zoomBeat = tonumber(value2)
    end
    if name == 'Bg Flash Bop' then
        flashBopNum = tonumber(value1);
        end
    if name == 'Jumpscare' then
        playSound('jumpscaresound', 1, 'jumpscaresound')
    makeAnimatedLuaSprite('jumpscare', 'jumpscare', 0, 0);
        luaSpriteAddAnimationByPrefix('jumpscare', 'scare', 'jumpscare', 25, false);
        luaSpritePlayAnimation('jumpscare', 'scare');
        setObjectCamera('jumpscare', 'hud');
        playSound("boo")
        setGraphicSize('jumpscare', getPropertyFromClass('flixel.FlxG', 'width') * 0.9, getPropertyFromClass('flixel.FlxG', 'height') * 1.1)
        addLuaSprite('jumpscare', true); 
        runTimer('timerscare', 0.7)
        playSound('jumpscareSound', 2)
end
end
function onTimerCompleted(tag)
    if tag == 'timerscare' then
        cameraFlash('hud', 'ffffff', 3) 
            doTweenAlpha('alphajumpscare', 'jumpscare', 0, 3)
    end
    if tag == 'glitchremove' then
        clearEffects('game')
    end
end
local timeshit = 0;
function onBeatHit()
    if curBeat % flashBopNum == 0 then
        doTweenAlpha('firstalpha', 'crackflash', 0.8, 0.0000001)
        doTweenAlpha('alphaflash', 'crackflash', 0.1, crochet*0.004, 'circout')
        if curBeat >= 128 then
        doTweenAlpha('firstalpha3', 'glowgradient', 0.9, 0.0000001)
        doTweenAlpha('alphaflash3', 'glowgradient', 0.5, crochet*0.004, 'circout')
        else
        doTweenAlpha('firstalpha3', 'glowgradient', 0.5, 0.0000001)
        doTweenAlpha('alphaflash3', 'glowgradient', 0.1, crochet*0.004, 'circout')
        end
        if curBeat >= 192 then
        doTweenAlpha('firstalpha2', 'bgcrack', 1, 0.0000001)
        doTweenAlpha('alphaflash2', 'bgcrack', 0.6, crochet*0.005, 'circout')
        end
        if curBeat >= 128 then
        doTweenAlpha('firstalpha4', 'glowgradientHUD', 0.9, 0.0000001)
        doTweenAlpha('alphaflash4', 'glowgradientHUD', 0.5, crochet*0.005, 'circout')
        end
    end
    if curBeat % camBopNum == 0 and getProperty('camZooming') then
        setPropertyFromClass('flixel.FlxG', 'camera.zoom', getPropertyFromClass('flixel.FlxG', 'camera.zoom') + zoomBeat)
        setProperty('camHUD.zoom', zoomBeat / 2 + getProperty('camHUD.zoom'))
    end
    --[[if curBeat == 260 then
        triggerEvent('Jumpscare')
    end]]
    if curBeat == 200 then
        doTweenAlpha('effectalpha', 'effectshit', 0.1, 7, 'circout')
    end
    if curBeat == 128 then
        doTweenAlpha('alphaflash2', 'bgcrack', 0.6, 9, 'circout')
    end
    if curBeat == 251 then
        cameraBop = true
        triggerEvent('camera Bop', 4, 0.12)
        hudAngle = true
    end
    if curBeat == 128 then
        doTweenAlpha('effectalpha', 'effectshit', 1, 0.000001)
            cameraFlash('camGame', 'ffffff', 2) 
        triggerEvent('Bg Flash Bop', 8)
    end
end
function onUpdate()
    songPoses = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPoses / 5000) * (bpm / 60)
    --[[if curBeat >= 1 then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'scale.x',  0.8 + 0.2 * math.sin((currentBeat+ i*0.25)*math.pi));
            setPropertyFromGroup('strumLineNotes', i, 'scale.y',  0.8 + 0.2 * math.sin((currentBeat+ i*0.25)*math.pi));
            setPropertyFromGroup('strumLineNotes', i, 'angle',  160.8 + 0.2 * math.sin((currentBeat+ i*0.25)*math.pi));

        end

        for i = 0, getProperty('unspawnNotes.length')-1 do
            setPropertyFromGroup('notes', i, 'angle',  160.8 + 0.2 * math.sin((currentBeat+ i*0.25)*math.pi));
            setPropertyFromGroup('notes', i, 'scale.x',  0.8 + 0.2 * math.sin((currentBeat+ i*0.25)*math.pi));
            setPropertyFromGroup('notes', i, 'scale.y',  0.8 + 0.2 * math.sin((currentBeat+ i*0.25)*math.pi));
        end
    end]]
    songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    if curBeat >= 128 then
      doTweenY(dadTweenY, 'dad', -20-300*math.cos((currentBeat*0.25)*math.pi),0.001)
      setProperty('dad.x', -0-100*math.sin((currentBeat*0.25)*math.pi))
      setProperty('boyfriend.x', 860+30*math.sin((currentBeat2*0.25)*math.pi))
    else
        doTweenY(dadTweenY, 'dad', -0-50*math.cos((currentBeat*0.25)*math.pi),0.001)
        setProperty('dad.x', -0-20*math.sin((currentBeat*0.25)*math.pi))
    end
    --[[noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 280*math.cos((currentBeat+4*0.25)*math.pi), 0.6)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + 100*math.cos((currentBeat+5*0.25)*math.pi), 0.6)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 220*math.cos((currentBeat+6*0.25)*math.pi), 0.6)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 140*math.cos((currentBeat+7*0.25)*math.pi), 0.6)

    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 280*math.cos((currentBeat+4*0.25)*math.pi), 0.6)
    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 100*math.cos((currentBeat+5*0.25)*math.pi), 0.6)
    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 120*math.cos((currentBeat+6*0.25)*math.pi), 0.6)
    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 - 240*math.cos((currentBeat+7*0.25)*math.pi), 0.6)]]
    if curBeat >= 128 then
        doTweenAlpha('camhudvisible', 'camHUD', 1, 3)
        doTweenAlpha('dadvisible', 'dad', 1, 3)
        doTweenAlpha('bfvisible', 'boyfriend', 1, 3)
    end
        xx = getProperty('dad.x') + 360;
        yy = getProperty('dad.y') + 300;
        xx2 = getProperty('boyfriend.x') + 80;
        yy2 = getProperty('boyfriend.y') + 80;
        if curBeat <= 255 then
        triggerEvent('Camera Follow Pos',xx + 300,yy + 40)
        end
        -- ok --
        if curBeat >= 255 then
        if mustHitSection == false then
            doTweenZoom('dad', 'camGame', 1.2, 0.3, 'circout')
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx-25,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx+25,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera  Follow Pos',xx,yy-25)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx,yy+25)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos',xx-25,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos',xx+25,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos',xx,yy-25)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos',xx,yy+25)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx,yy)
            end
            else
            doTweenZoom('bf', 'camGame', 0.7, 0.3, 'circout')
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx2-25,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx2+25,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx2,yy2-25)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx2,yy2+25)
            end
            if getProperty('boyfriend.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
        -- end --
end

currentBeat2 = (songPos / 1000) * (bpm / 140)
if hudAngle then
setProperty('camHUD.angle',0 - 5 * math.cos((currentBeat2*0.25)*math.pi) )
setProperty('camGame.angle',0 - 3 * math.cos((currentBeat2*0.25)*math.pi) )
end
end

function opponentNoteHit()
    if lowQuality == false then
   --addChromaticAbberationEffect('camHUD')
   -- runTimer('glitchremove', 0.015 )
    end
end
function goodNoteHit()
    if lowQuality == false then
  --  addChromaticAbberationEffect('camHUD')
 --   runTimer('glitchremove', 0.015)
    end
end