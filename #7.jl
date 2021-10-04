function movemod(::Robot, side::HorizonSide,kof::Int)
    while (isborder(r,side)==false)
        if (kof==1)
            putmarker!(r)
        end
        if (kof==1)
            kof=0
        else
            kof=1
        end
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
    x=y=0
    kof=1
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y=y+1
        if (kof==1)
            kof=0
        else
            kof=1
        end
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x=x+1
        if (kof==1)
            kof=0
        else
            kof=1
        end
    end
    while (isborder(r,Nord)==false)
        if (isborder(r,Nord)==false)
            if (isborder(r,Sud)==false)                
                move!(r,Nord)
            end
            movemod(r,Ost,kof)
        end
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            movemod(r,West,kof)
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