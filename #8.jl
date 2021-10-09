function movemod(::Robot,j::Int,side::HorizonSide)
    for i in 1:j
        if isborder(r,Nord)
            move!(r,side)
        end
    end
end
function Glav(::Robot)
    i=1
    while isborder(r,Nord)
        movemod(r,i,West)
        movemod(r,i,Ost)
        movemod(r,i,Ost)
        movemod(r,i,West)
        i=i+1
    end
end
