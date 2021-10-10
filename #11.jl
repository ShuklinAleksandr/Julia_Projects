function movemod(::Robot,side1::HorizonSide,side2::HorizonSide,A,B)
    while isborder(r,side1)
        move!(r,side2),push!(A,side2)
    end
    while length(B)>0
        side=pop!(B)
        move!(r,inverse(side)),push!(A,inverse(side))
    end
        putmarker!(r)
end
function goback(::Robot,A)
    while length(A)>0
        side=pop!(A)
        move!(r,inverse(side))
    end
end
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function Glav(::Robot)
    A=[]
    B=[]
    if !isborder(r,Ost)
        move!(r,Ost)
        putmarker!(r)
        move!(r,West)
    else
        if isborder(r,Sud)
            side=Nord
        else 
            side=Sud
        end
        while isborder(r,Ost) && !isborder(r,side)
            move!(r,side),push!(A,side), push!(B,side)
        end
        if !isborder(r,side) && !isborder(r,Ost)
            move!(r,Ost),push!(A,Ost)
            movemod(r,inverse(side),Ost,A,B)
            putmarker!(r)
            goback(r,A)
        else
            goback(r,A)
            B=[]
        end
    end
    if !isborder(r,Nord)
        move!(r,Nord)
        putmarker!(r)
        move!(r,Sud)
    else
        if isborder(r,West)
            side=Ost
        else 
            side=West
        end
        while isborder(r,Nord) && !isborder(r,side)
            move!(r,side),push!(A,side),push!(B,side)
        end
        if !isborder(r,side) && !isborder(r,Nord)
            move!(r,Nord),push!(A,Nord)
            movemod(r,inverse(side),Nord,A,B)
            putmarker!(r)
            goback(r,A)
        else
            goback(r,A)
            B=[]
        end
    end
    if !isborder(r,West)
        move!(r,West)
        putmarker!(r)
        move!(r,Ost)
    else
        if isborder(r,Sud)
            side=Nord
        else 
            side=Sud
        end
        while isborder(r,West) && !isborder(r,side)
            move!(r,side),push!(A,side),push!(B,side)
        end
        if !isborder(r,side) && !isborder(r,West)
            move!(r,West),push!(A,West)
            movemod(r,inverse(side),West,A,B)
            putmarker!(r)
            goback(r,A)
        else
            goback(r,A)
            B=[]
        end
    end
    if !isborder(r,Sud)
        move!(r,Sud)
        putmarker!(r)
        move!(r,Nord)
    else
        if isborder(r,West)
            side=Ost
        else 
            side=West
        end
        while isborder(r,Sud) && !isborder(r,side)
            move!(r,side),push!(A,side),push!(B,side)
        end
        if !isborder(r,side) && !isborder(r,Sud)
            move!(r,Sud),push!(A,Sud)
            movemod(r,inverse(side),Sud,A,B)
            putmarker!(r)
            goback(r,A)
        else
            goback(r,A)
        end
    end
end
    

