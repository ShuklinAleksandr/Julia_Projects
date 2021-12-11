function movemod(::Robot, side::HorizonSide)
    while (!isborder(r,side))
        putmarker!(r)
        move!(r,side)
    end
    putmarker!(r)
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
function corner(::Robot,A)
    while (!isborder(r,Sud))
        move!(r,Sud); push!(A,Sud)
    end
    while (!isborder(r,West))
        move!(r,West); push!(A,West)
    end
end
function Glav(::Robot)
    A=[]
    corner(r,A)
    side=Ost
    movemod(r,side)
    while (!isborder(r,Nord))
        move!(r,Nord)
        side=inverse(side)
        movemod(r,side)
    end
    B=[]
    corner(r,B)
    gobackposition(r,A)
end