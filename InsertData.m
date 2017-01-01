function data=InsertData()

Pos=[
   10 12 63 28 21 15 54 80 42 80 12 
   91 12 50 55 44 98 10 64 92 96 55  
   
];


minpos=min(Pos,[],2);
maxpos=max(Pos,[],2);

minpos=minpos*0.8;
maxpos=maxpos*1.2;

N=size(Pos,2);

Dis=zeros(N,N);

for i=1:N
    for j=i+1:N
        Dis(i,j)=norm(Pos(:,i)-Pos(:,j),2);
        Dis(j,i)=Dis(i,j);
    end
end





data.N=N;
data.Pos=Pos;
data.Dis=Dis;
data.minpos=minpos;
data.maxpos=maxpos;





 end