struct Side
    one::HorizonSide; two::HorizonSide
end
function movemod(::Robot,j::Int,storon::Side,B)
    global koeficient
    for i in 1:j
        if (isborder(r,storon.one) && !ismarker(r))
            koeficient=true
            if (length(B)>0)
                side3=pop!(B)
                if (side3==storon.two)
                    push!(B,side3,side3)
                end
            else
                push!(B,storon.two)
            end
            move!(r,storon.two)
        end
    end
end
function Pohod(::Robot,storon::Side,B)
    j=1
    while isborder(r,storon.one) && !ismarker(r)
        side2=storon.two
        for i in 1:4
            movemod(r,j,Side(storon.one,side2),B)
            if (i==1 || i==3)
                side2=inverse(side2)
            end
        end
        j=j+1
    end
end
function modefication_move(::Robot,storon::Side)
    B=[]
    global koeficient=false
    Pohod(r,storon,B)
    if (!ismarker(r))
        move!(r,storon.one)
    end
    if (koeficient)
        while ((isborder(r,storon.two) || isborder(r,inverse(storon.two))) && !ismarker(r))
            move!(r,storon.one)
        end
    end
    while (length(B)>0)
        side=pop!(B)
        if !ismarker(r)
            move!(r,inverse(side))
        end
    end
end
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function moved(::Robot,side::HorizonSide)
    side1=HorizonSide(mod(Int(side)+1,4))
    for i in 1:n
        if !ismarker(r)
            modefication_move(r,Side(side,side1))
        end
    end
end
function Glav(::Robot)
    global n=2;
    while !ismarker(r)
        modefication_move(r,Side(Nord,West))
        modefication_move(r,Side(West,Nord))
        for i in (Ost,Sud,West,Nord)
            moved(r,i)
        end
        n+=2
    end
end