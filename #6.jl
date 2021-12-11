function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function povorot_na_90(side::HorizonSide, delta)
    HorizonSide(mod(Int(side)+delta,4))
end
function gobackposition(::Robot,A)
    while length(A)>0
        side=pop!(A)
        move!(r,inverse(side))
    end
end
function movemod(::Robot, side1::HorizonSide, side2::HorizonSide)
    while (isborder(r,side1))
        putmarker!(r)
        move!(r,side2)
    end
end
function corner(::Robot,A)
    while !(isborder(r,West) && isborder(r,Sud))
        if (!isborder(r,Sud))
            move!(r,Sud); push!(A,Sud)
        end
        if (!isborder(r,West))
            move!(r,West); push!(A,West)
        end
    end
end
function Glav(::Robot)
    A=[]
    chetn=0
    corner(r,A)
    side=Ost
    while (!isborder(r,Nord))
        while (!isborder(r,Nord) && !isborder(r,side))
            move!(r,side)
        end
        if (!isborder(r,Nord))
            move!(r,Nord)
            chetn=mod(chetn+1,2);
        end
        side=inverse(side)
    end
    if (chetn==0)
        for i in 0:3
            movemod(r,HorizonSide(i),povorot_na_90(HorizonSide(i),3))
            putmarker!(r)
            move!(r,HorizonSide(i))
        end
    else
        for i in (Nord, Ost, Sud, West)
            movemod(r,i,povorot_na_90(i,1))
            putmarker!(r)
            move!(r,i)
        end
    end
    B=[]
    corner(r,B)
    gobackposition(r,A)
end
