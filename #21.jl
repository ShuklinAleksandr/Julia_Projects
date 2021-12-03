struct data_side
    one::HorizonSide; two::HorizonSide
end
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
function movemod(::Robot,side::data_side)::Bool
    A=[]
    global Sum
    koeficient = false
    if !isborder(r,side.one)
        move!(r,side.one)
    else
        while (isborder(r,side.one) && !isborder(r,side.two))
            move!(r,side.two); push!(A,side.two)
        end
        if isborder(r,side.one) && isborder(r,side.two)
            koeficient=true
        else 
            move!(r,side.one)
            check_line=false
            while (isborder(r,inverse(side.two)))
                move!(r,side.one)
                check_line=true
            end
        end
        if !koeficient 
            if (!check_line)  #если линия то +1, если четырехугольник то +2
                Sum+=1
            end
        end
        while (length(A)>0)
            side1=pop!(A); move!(r,inverse(side1))
        end
    end
    return koeficient
end
function Snake_cout(::Robot,side::data_side)
    side_one=side.one
    while !isborder(r,side.two)
        koeficient=false
        while (!koeficient)
            koeficient=movemod(r,data_side(side_one,side.two))
        end
        side_one=inverse(side_one)
        move!(r,side.two)
    end
end
function Glav(::Robot)
    corner(r)
    global Sum=0
    Snake_cout(r,data_side(Nord,Ost))
    corner(r)
    Snake_cout(r,data_side(Ost,Nord))
    print(Sum)
end