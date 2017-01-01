function  imp=Assimilation(imp,data)

beta=data.beta;
nimp=numel(imp);
Size=data.Size;

for i=1:nimp
    
    ncolony=length(imp(i).colony);
    
    for j=1:ncolony
    
        d=imp(i).x-imp(i).colony(j).x;
        d=d.*rand(Size.x)*beta;
        imp(i).colony(j).x=imp(i).colony(j).x+d;
        imp(i).colony(j)=fitness(imp(i).colony(j),data);
        
        
    end
end






end







