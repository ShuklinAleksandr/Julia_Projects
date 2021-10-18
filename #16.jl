function obhod(::Robot,side1::HorizonSide,side2::HorizonSide,B, kef)
    global kef
    while isborder(r,side1) && !isborder(r,side2)
        move!(r,side2),push!(B,side2)
    end
    if !isborder(r,side1) 
        move!(r,side1), 
        while isborder(r,inverse(side2))
            move!(r,side1)
        end
        while length(B)>0
            side=pop!(B)
            move!(r,inverse(side))
        end
    else
        goback(r,B)
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
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function Glav(::Robot)
    A=[]
    global kef=0
    corner(r,A)
    side=Ost
    while !isborder(r,Nord) 
        global kef=0
        while kef==0
            putmarker!(r)
            if !isborder(r,side)
                move!(r,side)
                putmarker!(r)
            end
            B=[]
            if isborder(r,side)
                obhod(r,side,Nord,B,kef)
            end
        end
        move!(r,Nord)
        side=inverse(side)
    end
    putmarker!(r)
    while !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end
    B=[]
    corner(r,B)
    goback(r,A)
end
            

            
    