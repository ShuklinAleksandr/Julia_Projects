function movemod(::Robot, side::HorizonSide)
    while (isborder(r,side)==false)
        putmarker!(r)
        move!(r,side)
    end
    putmarker!(r)
end
function gobackposition(::Robot,x::Int,y::Int)
    for i in 1:x
        move!(r,Ost)
    end
    for i in 1:y
        move!(r,Nord)
    end
end
function Glav(::Robot)
    x=0
    y=0
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y=y+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x=x+1
    end
    while (isborder(r,Nord)==false)
        if (isborder(r,Nord)==false)
            if (isborder(r,Sud)==false)                
                move!(r,Nord)
            end
            movemod(r,Ost)
        end
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            movemod(r,West)
        end
    end
    while (isborder(r,Sud)==false)
        move!(r,Sud)
    end
    while (isborder(r,West)==false)
        move!(r,West)
    end
    gobackposition(r,x,y)
end