function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function gobackposition(::Robot,A)
    while(length(A)>0)
        side=pop!(A)
        move!(r,inverse(side))
    end
end
function back(::Robot)
    while (!isborder(r,West))
        move!(r,West)
    end
end
function Glav(::Robot)
    A=[]
    maxx=0
    while (!isborder(r,Sud))
        move!(r,Sud); push!(r,Sud)
    end
    while (!isborder(r,West))
        move!(r,West); push!(r,West)
    end
    while (!isborder(r,Ost))
        move!(r,Ost)
        maxx=maxx+1
    end
    back(r)
    while((maxx>0) || (!isborder(r,Nord)))
        for i in 1:maxx
            putmarker!(r)
            move!(r,Ost)
        end
        putmarker!(r)
        if (!isborder(r,Nord))
            move!(r,Nord)
        end
        maxx=maxx-1
        back(r)
    end
    while (!isborder(r,Sud))
        move!(r,Sud)
    end
    gobackposition(r,A)
end