function imp=CreateInitialPopulation(data)

nimp=data.nimp;
ncountries=data.ncountries;

emp.x=[];
emp.fit=[];
emp.info=[];

colony=repmat(emp,ncountries,1);


for i=1:ncountries
    colony(i).x=unifrnd(data.lb,data.ub);
    colony(i)=fitness(colony(i),data);
end



[~,ind]=sort([colony.fit]);

colony=colony(ind);

imp=colony(1:nimp);

colony=colony(nimp+1:end);


ncolony=length(colony);
colony=colony(randperm(ncolony));




k=0;
j=1;
for i=1:ncolony
    k=k+1;
    imp(k).colony(j)=colony(i);

    if k==nimp
        k=0;
        j=j+1;
    end  
end


end