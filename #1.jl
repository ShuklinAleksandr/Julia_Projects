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
    for i in 0:3
        movemod(r,HorizonSide(i))
        goback(r,HorizonSide(mod(i+2,4)))
    end
    putmarker!(r)
end
    