function movemod(::Robot,n::Int)
    for i in 1:n
        if !ismarker(r)
            move!(r,Ost)
        end
    end
    for i in 1:n
        if !ismarker(r)
            move!(r,Sud)
        end
    end
    for i in 1:n
        if !ismarker(r)
            move!(r,West)
        end
    end
    for i in 1:n
        if !ismarker(r)
            move!(r,Nord)
        end
    end
end
function Glav(::Robot)
    n=2;
    while !ismarker(r)
        if !ismarker(r)
            move!(r,Nord)
        end
        if !ismarker(r)
            move!(r,West)
        end
        movemod(r,n)
        n=n+2;
    end
end