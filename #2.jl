function movemod(::Robot, side::HorizonSide)
    while (isborder(r,side)==false)
        move!(r,side)
        putmarker!(r)
    end
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
    movemod(r,Ost)
    movemod(r,Nord)
    movemod(r,West)
    movemod(r,Sud)
    gobackposition(r,x,y)
end