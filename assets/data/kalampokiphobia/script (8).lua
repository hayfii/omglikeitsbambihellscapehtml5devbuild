



local timeshit = 0;
function onBeatHit()
    if curBeat == 0 then
        doTweenAlpha('effectalpha', 'effectshit', 1, 0.000001)
            cameraFlash('camHUD', 'ffffff', 2) 
        triggerEvent('Bg Flash Bop', 8)
    end
    if curBeat == 319 then
        doTweenAlpha('effectalpha', 'effectshit', 1, 0.000001)
            cameraFlash('camHUD', 'ffffff', 2) 
        triggerEvent('Bg Flash Bop', 8)
    end
    if curBeat == 447 then
        doTweenAlpha('effectalpha', 'effectshit', 1, 0.000001)
            cameraFlash('camHUD', 'ffffff', 2) 
        triggerEvent('Bg Flash Bop', 8)
    end

    if curBeat == 703 then
        doTweenAlpha('effectalpha', 'effectshit', 1, 0.000001)
            cameraFlash('camHUD', 'ffffff', 2) 
        triggerEvent('Bg Flash Bop', 8)
    end
    if curBeat == 832 then
        doTweenAlpha('effectalpha', 'effectshit', 1, 0.000001)
            cameraFlash('camHUD', 'ffffff', 2) 
        triggerEvent('Bg Flash Bop', 8)
    end

 
end
function onUpdate()
    
    songPoses = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPoses /500) * (bpm / 50)
    currentBeat3 = (songPoses /5500) * (bpm / 50)
    currentBeat436 = (songPoses /5000) * (bpm / 50)

  
    songPos = getSongPosition()
    

currentBeat2 = (songPos / 250) * (bpm / 300)

setProperty('camHUD.angle',0 - 4 * math.sin((currentBeat2*0.25)*math.pi) )

      local currentBea4t = (songPos/520)*(bpm/200)

      local currentBeat5 = (songPos/2500)*(bpm/200)
      doTweenAngle('ballssss', 'dad', 6-12*math.cos((currentBea4t*0.25)*math.pi),0.001)
      doTweenY(dadTweenY, 'dad', -20-300*math.cos((currentBea4t*0.25)*math.pi),0.001)
      noteTweenY('defaultFPlayerStrumY0', 0, ((screenHeight / 2) - (167 / 2)) + (math.cos((currentBeat436) + (0) * 2) * 300), 0.0000001)
      noteTweenY('defaultFPlayerStrumY1', 1, ((screenHeight / 2) - (107 / 2)) + (math.cos((currentBeat436) + (1) * 2) * 300), 0.0000001)
      noteTweenY('defaultFPlayerStrumY2', 2, ((screenHeight / 2) - (101 / 2)) + (math.cos((currentBeat436) + (2) * 2) * 300), 0.0000001)
      noteTweenY('defaultFPlayerStrumY3', 3, ((screenHeight / 2) - (107 / 2)) + (math.cos((currentBeat436) + (3) * 2) * 300), 0.0000001)

      noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 2) - (107 / 2)) + (math.cos((currentBeat436) + 0) * 300), 0.001)
      noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 2) - (127 / 2)) + (math.cos((currentBeat436) + 1) * 300), 0.001)
      noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 2) - (117 / 2)) + (math.cos((currentBeat436) + 2) * 300), 0.001)
      noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 2) - (101 / 2)) + (math.cos((currentBeat436) + 3) * 300), 0.001)
      noteTweenX('fake1', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat436) - (0) * 2) * 150), 0.0000001)
      noteTweenX('fake2', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat436) - (1) * 2) * 150), 0.0000001)
      noteTweenX('fake3', 2, ((screenWidth / 2) - (314 / 2)) + (math.sin((currentBeat436) -(2) * 2) * 300), 0.0000001)
      noteTweenX('fake4', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat436) - (3) * 2) * 150), 0.0000001)

      noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat436) + 0) * 150), 0.001)
      noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (314 / 2)) + (math.sin((currentBeat436) + 1) * 300), 0.001)
      noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat436) + 2) * 150), 0.001)
      noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat436) + 3) * 150), 0.001)
 if curBeat == 35 then
        doTweenAlpha('camhudvisible', 'camHUD', 1, 3)

    end
      if lowQuality == false then
        addGlitchEffect('camHUD')
                addPulseEffect('camHUD')
        addBloomEffect('camGame')
        addChromaticAbberationEffect('camHUD')
        addChromaticAbberationEffect('camGame')

   
         runTimer('removeeffects', 0.009)
         end
end

function onTimerCompleted(tag)

    if tag == 'removeeffects' then
        clearEffects('game')
        clearEffects('hud') 
    end
end
function opponentNoteHit()
    cameraShake(game,0.1,0.15)
  
end

function onCreatePost()
    

    setProperty('iconP1.alpha', 1)
    setProperty('iconP2.alpha', 1)
    setProperty('healthBar.alpha', 0)
end



function goodNoteHit()
	
	health = getProperty('health')
	if health > 0 then
		setProperty('health', health + 0.025);	
	end
end