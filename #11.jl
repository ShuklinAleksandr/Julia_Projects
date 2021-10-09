function movemod(::Robot,side1::HorizonSide,side2::HorizonSide,A)
    while isborder(r,side1)
        move!(r,side2),push!(A,side2)
    end
    move!(r,side1),push!(A,side1)
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
        move!(r,side),push!(A,side)
        move!(r,Ost),push!(A,Ost)
        movemod(r,inverse(side),Ost,A)
        putmarker!(r)
        goback(r,A)
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
        move!(r,side),push!(A,side)
        move!(r,Nord),push!(A,Nord)
        movemod(r,inverse(side),Nord,A)
        putmarker!(r)
        goback(r,A)
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
        move!(r,side),push!(A,side)
        move!(r,West),push!(A,West)
        movemod(r,inverse(side),West,A)
        putmarker!(r)
        goback(r,A)
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
        move!(r,side),push!(A,side)
        move!(r,Sud),push!(A,Sud)
        movemod(r,inverse(side),Sud,A)
        putmarker!(r)
        goback(r,A)
    end
end
    

