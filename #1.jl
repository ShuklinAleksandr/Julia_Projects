function movemod(::Robot, side::HorizonSide)
    while (isborder(r,side)==false)
        move!(r,side)
        putmarker!(r)
    end
end
function goback(::Robot, side::HorizonSide)
    while (ismarker(r)==true)
        move!(r,side)
    end
end

function Glav(::Robot)
    movemod(r,Nord)
    goback(r,Sud)
    movemod(r,Sud)
    goback(r,Nord)
    movemod(r,West)
    goback(r,Ost)
    movemod(r,Ost)
    goback(r,West)
    putmarker!(r)
end
    