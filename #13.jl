function Polozhenie(::Robot)
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
    Risovat(r)
    for i in 1:x
        move!(r,Ost)
    end
    for i in 1:y
        move!(r,Nord)
    end
end
function Risovat(::Robot)
    putmarker!(r)
    while ((isborder(r,Nord)==false) && (isborder(r,Ost)==false)) 
        move!(r,Nord)
        move!(r,Ost)
        putmarker!(r)
    end
    while (isborder(r,West)==false)
        move!(r,West)
    end
    putmarker!(r)
    while ((isborder(r,Sud)==false) && (isborder(r,Ost)==false)) 
        move!(r,Sud)
        move!(r,Ost)
        putmarker!(r)
    end
    while (isborder(r,West)==false)
        move!(r,West)
    end
end

    


         