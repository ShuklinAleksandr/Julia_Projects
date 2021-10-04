function gobackposition(::Robot,x::Int,y::Int)
    for i in 1:x
        move!(r,Ost)
    end
    for i in 1:y
        move!(r,Nord)
    end
end
function back(::Robot)
    while (isborder(r,West)==false)
        move!(r,West)
    end
end
function Glav(::Robot)
    x=0
    y=0
    maxx=0
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y=y+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x=x+1
    end
    while (isborder(r,Ost)==false)
        move!(r,Ost)
        maxx=maxx+1
    end
    back(r)
    while((maxx>0) || (isborder(r,Nord)==false))
        for i in 1:maxx
            putmarker!(r)
            move!(r,Ost)
        end
        putmarker!(r)
        if (isborder(r,Nord)==false)
            move!(r,Nord)
        end;
        maxx=maxx-1
        back(r)
    end
    while (isborder(r,Sud)==false)
        move!(r,Sud)
    end
    gobackposition(r,x,y)
end