function corner(::Robot)
    while !(isborder(r,West) && isborder(r,Sud))
        if (!isborder(r,Sud))
            move!(r,Sud)
        end
        if (!isborder(r,West))
            move!(r,West)
        end
    end
end
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function movemod(::Robot,side::HorizonSide)::Bool
    A=[]
    global Sum
    koeficient = false
    if !isborder(r,side)
        move!(r,side)
    else
        while (isborder(r,side) && !isborder(r,Ost))
            move!(r,Ost); push!(A,Ost)
        end
        if isborder(r,side) && isborder(r,Ost)
            koeficient=true
        else 
            move!(r,side)
            check_line=false
            while (isborder(r,West))
                move!(r,side)
                check_line=true
            end
        end
        if !koeficient 
            if (!check_line)  #если линия то +1, если четырехугольник то +2
                Sum+=1
            else
                Sum+=2
            end
        end
        while (length(A)>0)
            side1=pop!(A); move!(r,inverse(side1))
        end
    end
    return koeficient
end
function Snake_cout(::Robot)
    side=Nord
    while !isborder(r,Ost)
        koeficient=false
        while (!koeficient)
            koeficient=movemod(r,side)
        end
        side=inverse(side)
        move!(r,Ost)
    end
end
function Glav(::Robot)
    corner(r)
    global Sum=0
    Snake_cout(r)
    print(Sum)
end