function  imp=Revolution(imp,data)


P_revolve=data.P_revolve;
nimp=numel(imp);
Size=data.Size;
nvar=data.nvar;

for i=1:nimp

    ncolony=length(imp(i).colony);
    
    for j=1:ncolony
         
        
        if rand<P_revolve
        k=randsample(nvar,ceil(0.05*nvar));   
        d=data.ub-data.lb;
        d=0.1*randn(Size.x).*d;
        imp(i).colony(j).x(k)=imp(i).colony(j).x(k)+d(k);
%         dd=unifrnd(data.lb,data.ub);imp(i).colony(j).x(k)=dd(k);
        imp(i).colony(j)=fitness(imp(i).colony(j),data);
        end
        
        
    end
end






end







