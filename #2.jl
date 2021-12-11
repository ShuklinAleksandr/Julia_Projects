function movemod(::Robot, side::HorizonSide)
    while (isborder(r,side)==false)
        move!(r,side)
        putmarker!(r)
    end
end
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function gobackposition(::Robot,A)
    while(length(A)>0)
        side=pop!(A)
        move!(r,inverse(side))
    end
end
function Glav(::Robot)
    A=[]
    while (!isborder(r,Sud))
        move!(r,Sud); push!(A,Sud)
    end
    while (!isborder(r,West))
        move!(r,West); push!(A,West)
    end
    for i in (Ost,Nord,West,Sud)
        movemod(r,i)
    end
    gobackposition(r,A)
end