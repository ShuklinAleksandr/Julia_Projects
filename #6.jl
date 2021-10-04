function gobackposition(::Robot,x1::Int,x2::Int,y1::Int,y2::Int)
    for i in 1:x2
        move!(r,Ost)
    end
    for i in 1:y2
        move!(r,Nord)
    end
    for i in 1:x1
        move!(r,Ost)
    end
    for i in 1:y1
        move!(r,Nord)
    end
end
function movemod(::Robot, side1::HorizonSide, side2::HorizonSide)
    while (isborder(r,side1)==true)
        putmarker!(r)
        move!(r,side2)
    end
end
function Glav(::Robot)
    x1=x2=y1=y2=0
    chetn=1
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y1=y1+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x1=x1+1
    end
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y2=y2+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x2=x2+1
    end
    while (isborder(r,Nord)==false)
        while (isborder(r,Nord)==false && isborder(r,Ost)==false)
            move!(r,Ost)
        end
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            chetn=2;
        end
        while (isborder(r,Nord)==false && isborder(r,West)==false)
            move!(r,West)
        end
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            chetn=1
        end
    end
    if (chetn==1)
        movemod(r,Nord,Ost)
        putmarker!(r)
        move!(r,Nord)
        movemod(r,West,Nord)
        putmarker!(r)
        move!(r,West)
        movemod(r,Sud,West)
        putmarker!(r)
        move!(r,Sud)
        movemod(r,Ost,Sud)
        putmarker!(r)
    else
        movemod(r,Nord,West)
        putmarker!(r)
        move!(r,Nord)
        movemod(r,Ost,Nord)
        putmarker!(r)
        move!(r,Ost)
        movemod(r,Sud,Ost)
        putmarker!(r)
        move!(r,Sud)
        movemod(r,West,Sud)
        putmarker!(r)
    end
    while (isborder(r,Sud)==false)
        move!(r,Sud)
    end
    while (isborder(r,West)==false)
        move!(r,West)
    end
    gobackposition(r,x1,x2,y1,y2)
end
