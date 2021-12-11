function corner(::Robot,A)
    while !(isborder(r,West) && isborder(r,Sud))
        if (!isborder(r,Sud))
            move!(r,Sud); push!(A,Sud)
        end
        if (!isborder(r,West))
            move!(r,West); push!(A,West)
        end
    end
end
function movemod(::Robot,side::HorizonSide)
    while (!isborder(r,side))
        move!(r,side)
    end
    putmarker!(r)
end
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function goback(::Robot,A)
    while length(A)>0
        side=pop!(A)
        move!(r,inverse(r))
    end
end
function Glav(::Robot)
    A = [];
    corner(r,A)
    for i in 0:3
        movemod(r,HorizonSide(i))
    end
    goback(r,A)
end


