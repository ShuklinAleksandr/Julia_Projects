function obhod(::Robot,side1::HorizonSide,side2::HorizonSide,A,B, kef)
    global kef
    while isborder(r,side1) && !isborder(r,side2)
        move!(r,side2),push!(A,side2),push!(B,side2)
    end
    if !isborder(r,side1) 
        move!(r,side1), push!(A,side1)
        while isborder(r,inverse(side2))
            move!(r,side1),push!(A,side1)
        end
        while length(B)>0
            side=pop!(B)
            move!(r,inverse(side)),push!(A,inverse(side))
        end
    else
        goback(r,A)
        kef=1
    end
end
function movemod(::Robot,side::HorizonSide,A)
    while !isborder(r,side)
        move!(r,side), push!(A,side)
        putmarker!(r)
    end
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
    global kef=0
    while (kef==0)
        movemod(r,Ost,A)
        if isborder(r,Sud)
            side=Nord
        else 
            side=Sud
        end
        obhod(r,Ost,side,A,B,kef)
        if kef==0
            putmarker!(r)
        end
    end
    goback(r,A)
    B=[]
    kef=0
    while (kef==0)
        movemod(r,Nord,A)
        if isborder(r,West)
            side=Ost
        else 
            side=West
        end
        obhod(r,Nord,side,A,B,kef)
        if kef==0
            putmarker!(r)
        end
    end
    goback(r,A)
    B=[]
    kef=0
    while (kef==0)
        movemod(r,West,A)
        if isborder(r,Sud)
            side=Nord
        else 
            side=Sud
        end
        obhod(r,West,side,A,B,kef)
        if kef==0
            putmarker!(r)
        end
    end
    goback(r,A)
    B=[]
    kef=0
    while (kef==0)
        movemod(r,Sud,A)
        if isborder(r,West)
            side=Ost
        else 
            side=West
        end
        obhod(r,Sud,side,A,B,kef)
        if kef==0
            putmarker!(r)
        end
    end
    goback(r,A)
end
    