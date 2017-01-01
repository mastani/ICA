function  imp=Exchange(imp)

nimp=numel(imp);

for i=1:nimp
    
    [value,index]=min([imp(i).colony.fit]);
    
    if value<imp(i).fit
        
        bestcolony=imp(i).colony(index);
        
        imp(i).colony(index).x=imp(i).x;
        imp(i).colony(index).fit=imp(i).fit;
        imp(i).colony(index).info=imp(i).info;
        
        imp(i).x=bestcolony.x;
        imp(i).fit=bestcolony.fit;
        imp(i).info=bestcolony.info;
        
        
        
    end
    
end






end







