function movemod(::Robot,side::HorizonSide,A)
    while !isborder(r,side)
        if ismarker(r)
            push!(A,temperature(r))
        end      
        move!(r,side)
    end
    if !isborder(r,Nord)
        move!(r,Nord)
    end
end
function Glav(::Robot)
    A = []
    Sum=0
    side=Ost
    while !isborder(r,Nord)
        movemod(r,side,A)
        if side==Ost
            side=West
        else
            side=Ost
        end
    end
    movemod(r,side,A)
    k=length(A)
    while length(A)>0
        Sum+=pop!(A)
    end
    println(Sum/k)
end