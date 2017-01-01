function  imp=CalTotalFitness(imp,data)

zeta=data.zeta;
nimp=numel(imp);

for i=1:nimp
   
    imp(i).totalfit=imp(i).fit+zeta*mean([imp(i).colony.fit]);
    
end






end







