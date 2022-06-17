local x0,x1,x2,x3,x4,x5,x6,x7
local y0,y1,y2,y3,y4,y5,y6,y7

function opponentNoteHit(id, noteData, noteType, isSustainNote)

    for i = 0, getProperty('strumLineNotes.length')-1 do
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x')+math.random(-16, 16))
        setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y')+math.random(-16, 16))
        setPropertyFromGroup('strumLineNotes', i, 'angle', getPropertyFromGroup('strumLineNotes', i, 'angle')+math.random(-16, 16))
    end


    for i = 0, getProperty('strumLineNotes.length')-1 do
        if getPropertyFromGroup('strumLineNotes', i, 'x') < 0 then
            setPropertyFromGroup('strumLineNotes', i, 'x', 0)
        end

        if getPropertyFromGroup('strumLineNotes', i, 'y') < 0 then
            setPropertyFromGroup('strumLineNotes', i, 'y', 0)
        end

        if getPropertyFromGroup('strumLineNotes', i, 'x') > screenWidth-getPropertyFromGroup('strumLineNotes', i, 'width') then
            setPropertyFromGroup('strumLineNotes', i, 'x', screenWidth-getPropertyFromGroup('strumLineNotes', i, 'width'))
        end

        if getPropertyFromGroup('strumLineNotes', i, 'y') > screenHeight-getPropertyFromGroup('strumLineNotes', i, 'height') then
            setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight-getPropertyFromGroup('strumLineNotes', i, 'height'))
        end

    end

    setProperty('health', getProperty('health')-0.02)

end

function onBeatHit()
    x0 = getPropertyFromGroup('strumLineNotes', 0, 'x') -- this code is worse than yanderedev's
    x1 = getPropertyFromGroup('strumLineNotes', 1, 'x')
    x2 = getPropertyFromGroup('strumLineNotes', 2, 'x')
    x3 = getPropertyFromGroup('strumLineNotes', 3, 'x')
    x4 = getPropertyFromGroup('strumLineNotes', 4, 'x')
    x5 = getPropertyFromGroup('strumLineNotes', 5, 'x')
    x6 = getPropertyFromGroup('strumLineNotes', 6, 'x')
    x7 = getPropertyFromGroup('strumLineNotes', 7, 'x')

    y0 = getPropertyFromGroup('strumLineNotes', 0, 'y')
    y1 = getPropertyFromGroup('strumLineNotes', 1, 'y')
    y2 = getPropertyFromGroup('strumLineNotes', 2, 'y')
    y3 = getPropertyFromGroup('strumLineNotes', 3, 'y')
    y4 = getPropertyFromGroup('strumLineNotes', 4, 'y')
    y5 = getPropertyFromGroup('strumLineNotes', 5, 'y')
    y6 = getPropertyFromGroup('strumLineNotes', 6, 'y')
    y7 = getPropertyFromGroup('strumLineNotes', 7, 'y')

    if curBeat == 128 then -- note swap with worse code than yandere sim
        setPropertyFromGroup('strumLineNotes', 0, 'x', x4) -- if anyone knows how to optimise this please tell me
        setPropertyFromGroup('strumLineNotes', 1, 'x', x5)
        setPropertyFromGroup('strumLineNotes', 2, 'x', x6)
        setPropertyFromGroup('strumLineNotes', 3, 'x', x7)
        setPropertyFromGroup('strumLineNotes', 4, 'x', x0)
        setPropertyFromGroup('strumLineNotes', 5, 'x', x1)
        setPropertyFromGroup('strumLineNotes', 6, 'x', x2)
        setPropertyFromGroup('strumLineNotes', 7, 'x', x3)

        setPropertyFromGroup('strumLineNotes', 0, 'y', y4)
        setPropertyFromGroup('strumLineNotes', 1, 'y', y5)
        setPropertyFromGroup('strumLineNotes', 2, 'y', y6)
        setPropertyFromGroup('strumLineNotes', 3, 'y', y7)
        setPropertyFromGroup('strumLineNotes', 4, 'y', y0)
        setPropertyFromGroup('strumLineNotes', 5, 'y', y1)
        setPropertyFromGroup('strumLineNotes', 6, 'y', y2)
        setPropertyFromGroup('strumLineNotes', 7, 'y', y3)
    end
    if curBeat == 224 then
        setPropertyFromGroup('strumLineNotes', 1, 'x', x5)
        setPropertyFromGroup('strumLineNotes', 3, 'x', x7)
        setPropertyFromGroup('strumLineNotes', 5, 'x', x1)
        setPropertyFromGroup('strumLineNotes', 7, 'x', x3)

        setPropertyFromGroup('strumLineNotes', 1, 'y', y5)
        setPropertyFromGroup('strumLineNotes', 3, 'y', y7)
        setPropertyFromGroup('strumLineNotes', 5, 'y', y1)
        setPropertyFromGroup('strumLineNotes', 7, 'y', y3)
    end
    if curBeat == 260 then
        setPropertyFromGroup('strumLineNotes', 0, 'x', x4)
        setPropertyFromGroup('strumLineNotes', 1, 'x', x5)
        setPropertyFromGroup('strumLineNotes', 2, 'x', x6)
        setPropertyFromGroup('strumLineNotes', 3, 'x', x7)
        setPropertyFromGroup('strumLineNotes', 4, 'x', x0)
        setPropertyFromGroup('strumLineNotes', 5, 'x', x1)
        setPropertyFromGroup('strumLineNotes', 6, 'x', x2)
        setPropertyFromGroup('strumLineNotes', 7, 'x', x3)

        setPropertyFromGroup('strumLineNotes', 0, 'y', y4)
        setPropertyFromGroup('strumLineNotes', 1, 'y', y5)
        setPropertyFromGroup('strumLineNotes', 2, 'y', y6)
        setPropertyFromGroup('strumLineNotes', 3, 'y', y7)
        setPropertyFromGroup('strumLineNotes', 4, 'y', y0)
        setPropertyFromGroup('strumLineNotes', 5, 'y', y1)
        setPropertyFromGroup('strumLineNotes', 6, 'y', y2)
        setPropertyFromGroup('strumLineNotes', 7, 'y', y3)
    end

    if curBeat > 304 then
        local s0,s1,s2,s3,s4,s5,s6,s7
        local i0,i1,i2,i3,i4,i5,i6,i7

        s0 = math.random(0, 7)
        s1 = math.random(0, 7)
        s2 = math.random(0, 7)
        s3 = math.random(0, 7)
        s4 = math.random(0, 7)
        s5 = math.random(0, 7)
        s6 = math.random(0, 7)
        s7 = math.random(0, 7)

        swaps = {}
        ySwaps = {}
        for i=0, 7 do
            swaps[i] = 0 -- lua ARRAY!??!?!?!?!?!??!
        end

        for i=0, 7 do
            ySwaps[i] = 0
        end

        swaps[0] = s0
        swaps[1] = s1
        swaps[2] = s2
        swaps[3] = s3
        swaps[4] = s4
        swaps[5] = s5
        swaps[6] = s6
        swaps[7] = s7

        ySwaps[0] = i0
        ySwaps[1] = i1
        ySwaps[2] = i2
        ySwaps[3] = i3
        ySwaps[4] = i4
        ySwaps[5] = i5
        ySwaps[6] = i6
        ySwaps[7] = i7

        local check1,check2
        for i = 0, 7 do -- this code wont work trust me
            check1 = swaps[i]
            for j = 0, 7 do
                check2 = swaps[j]
            end

            if check1 == check2 then
                swaps[i] = math.random(0, 7)
                i = 0
            end
        end

        for i = 0, 7 do 
            check1 = ySwaps[i]
            for j = 0, 7 do
                check2 = ySwaps[j]
            end

            if check1 == check2 then
                ySwaps[i] = math.random(0, 7)
                i = 0
            end
        end

        

        setPropertyFromGroup('strumLineNotes', swaps[0], 'x', x4)
        setPropertyFromGroup('strumLineNotes', swaps[1], 'x', x5)
        setPropertyFromGroup('strumLineNotes', swaps[2], 'x', x6)
        setPropertyFromGroup('strumLineNotes', swaps[3], 'x', x7)
        setPropertyFromGroup('strumLineNotes', swaps[4], 'x', x0)
        setPropertyFromGroup('strumLineNotes', swaps[5], 'x', x1)
        setPropertyFromGroup('strumLineNotes', swaps[6], 'x', x2)
        setPropertyFromGroup('strumLineNotes', swaps[7], 'x', x3)

        setPropertyFromGroup('strumLineNotes', ySwaps[0], 'y', y4)
        setPropertyFromGroup('strumLineNotes', ySwaps[1], 'y', y5)
        setPropertyFromGroup('strumLineNotes', ySwaps[2], 'y', y6)
        setPropertyFromGroup('strumLineNotes', ySwaps[3], 'y', y7)
        setPropertyFromGroup('strumLineNotes', ySwaps[4], 'y', y0)
        setPropertyFromGroup('strumLineNotes', ySwaps[5], 'y', y1)
        setPropertyFromGroup('strumLineNotes', ySwaps[6], 'y', y2)
        setPropertyFromGroup('strumLineNotes', ySwaps[7], 'y', y3)
    end
end
