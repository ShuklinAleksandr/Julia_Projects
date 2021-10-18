function obhod(::Robot,side1::HorizonSide,side2::HorizonSide,B,D)
    C=[]
    while isborder(r,side1) 
        move!(r,side2),push!(B,side2),push!(C,side2)
    end
    move!(r,side1), push!(B,side1), pop!(D)
    while isborder(r,inverse(side2)) && length(D)>0
            move!(r,side1), push!(B,side1), pop!(D)
    end
    while length(C)>0 && !isborder(r,Sud)
        side=pop!(C)
        move!(r,inverse(side)),push!(B,inverse(side))
    end
    if length(C)==0 && length(D)==0
        putmarker!(r)
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
function ravenstvo_mass(C,D)
    A=[]
    while length(C)>0
        side=pop!(C)
        push!(D,side)
        push!(A,side)
    end
    while length(A)>0
        side=pop!(A)
        push!(C,side)
    end
end

function Glav(::Robot)
    A=[]
    C=[]
    corner(r,A)
    while !isborder(r,Ost)
        move!(r,Ost),push!(C,Ost)
    end
    while !isborder(r,West)
        move!(r,West)
    end
    while length(C)>0 && !isborder(r,Nord)
        B=[]
        D=[]
        ravenstvo_mass(C,D)
        while (length(D)>0)
            putmarker!(r)
            if !isborder(r,Ost)
                move!(r,Ost), push!(B,Ost),pop!(D)
                putmarker!(r)
            end
            if isborder(r,Ost) && length(D)>0
                obhod(r,Ost,Nord,B,D)
            end
        end
        goback(r,B)
        pop!(C)
        move!(r,Nord)
    end
    putmarker!(r)
    while length(C)>0
        side=pop!(C)
        move!(r,side)
        putmarker!(r)
    end
    corner(r,C)
    goback(r,A)
end
            

            
    