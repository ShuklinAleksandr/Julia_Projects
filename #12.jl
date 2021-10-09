function strok(::Robot,n::Int,A)
    while !isborder(r,Ost)
        i=1
        while (i<n+1) 
            putmarker!(r)
            if !isborder(r,Ost)
                move!(r,Ost),push!(A,Ost)
            else
                if i<n+1
                    putmarker!(r)
                end
            end
            i+=1
        end
        p=1
        while p<n+1  
            if !isborder(r,Ost)
                move!(r,Ost),push!(A,Ost)
                if isborder(r,Ost) && n==1
                    putmarker!(r)
                end
            end
            p+=1
        end
    end
end
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end
function Kvadrat_line(::Robot,n::Int)
    j=1
    A=[]
    i=1
    while j<n+1 
        strok(r,n,A)
        j+=1
        if !isborder(r,Nord)
            back(r,A)
            move!(r,Nord)
        end
    end
end
function back(::Robot,A)
    while length(A)>0
        side=pop!(A)
        move!(r,inverse(side))
    end
end

function gobackposition(::Robot,x::Int,y::Int)
    for i in 1:x
        move!(r,Ost)
    end
    for i in 1:y
        move!(r,Nord)
    end
end
function Glav(::Robot,n::Int)
    x=y=0
    m=1
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y=y+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x=x+1
    end
    while !isborder(r,Nord)
        Kvadrat_line(r,n)
        for m in 1:n
            if !isborder(r,Ost) || !isborder(r,Nord)
                move!(r,Ost)
            end
        end
        #if !isborder(r,Nord)
            Kvadrat_line(r,n)
        #end
        for m in 1:n
            if !isborder(r,West) || !isborder(r,Nord)
                move!(r,West)
            end
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
    kof=0
    while !isborder(r,Ost)
        move!(r,Ost)
        if ismarker(r)
            kof=1
        end
    end
    while !isborder(r,West)
        move!(r,West)
    end
    if kof==0
        while !isborder(r,Nord) || !isborder(r,Ost)
            move!(r,Sud)
            if !ismarker(r)
                move!(r,Nord)
                putmarker!(r)
            else
                move!(r,Nord)
            end
            move!(r,Ost)
        end
        move!(r,Sud)
        if !ismarker(r)
            move!(r,Nord)
            putmarker!(r)
        else
            move!(r,Nord)
        end
    end
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
    gobackposition(r,x,y)
end