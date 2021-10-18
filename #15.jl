function corner(::Robot,A)
    while !(isborder(r,West) && isborder(r,Sud))
        if (!isborder(r,Sud))
            move!(r,Sud)
            push!(A,Sud)
        end
        if (!isborder(r,West))
            move!(r,West)
            push!(A,West)
        end
    end
end
function movemod(::Robot,side::HorizonSide)
    while (!isborder(r,side))
        putmarker!(r)
        move!(r,side)
    end
    putmarker!(r)
end
function goback(::Robot,A)
    while length(A)>0
        side=pop!(A)
        if (side==Sud)
            move!(r,Nord)
        else
            move!(r,Ost)
        end
    end
end
function Glav(::Robot)
    A = [];
    corner(r,A)
    movemod(r,Nord)
    movemod(r,Ost)
    movemod(r,Sud)
    movemod(r,West)
    goback(r,A)
end


