function movemod(::Robot, side::HorizonSide,kof::Int)
    if (kof==1)
        putmarker!(r)
    end
    while (!isborder(r,side))
        move!(r,side)
        kof=(kof+1)%2
        if (kof==1)
            putmarker!(r)
        end
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
    x=y=0
    kof=1
    while (!isborder(r,Sud))
        move!(r,Sud)
        y+=1
        kof=(kof+1)%2
    end
    while (!isborder(r,West))
        move!(r,West)
        x+=1
        kof=(kof+1)%2
    end
    movemod(r,Ost,kof)
    while (!isborder(r,Nord))
        for i in (West,Ost)
            if (!isborder(r,Nord))      
                move!(r,Nord)         
                movemod(r,i,kof)
            end
        end
    end
    while (!isborder(r,Sud))
        move!(r,Sud)
    end
    while (!isborder(r,West))
        move!(r,West)
    end
    gobackposition(r,x,y)
end