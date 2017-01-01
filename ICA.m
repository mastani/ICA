clc
clear
close all
format shortG

%% Insert Data
data=InsertData();

%% parameters setting

nvar=data.N;              % Number of Decision Variables
lb=0*ones(1,nvar); % Lower Bound of Variables
ub=1*ones(1,nvar); % Upper Bound of Variables



ncountries=100;     % Population Size
nimp=10;            % Number of Empires/Imperialists
maxiter=200;        % Maximum Number of Iterations


beta=2;             % Assimilation Coefficient
P_revolve=0.1;      % Revolution Probability
zeta=0.1;           % Colonies Mean Cost Coefficient

data.Size.x=[1 nvar];   % Decision Variables Matrix Size
data.nvar=nvar;
data.lb=lb;
data.ub=ub;
data.ncountries=ncountries;
data.nimp=nimp;
data.beta=beta;
data.P_revolve=P_revolve;
data.zeta=zeta;

%% initial population algorithm
tic
imp=CreateInitialPopulation(data);

[value,index]=min([imp.fit]);
gimp=imp(index); % gimp = Best Of Solution

%% Main Loop Algorithm

BEST=zeros(maxiter,1);


for iter=1:maxiter
    
    % Assimilation
    imp=Assimilation(imp,data);
    
    % Revolution
    imp=Revolution(imp,data);
    
    % Exchange
    imp=Exchange(imp);
    
    % Totla Fitness
    imp=CalTotalFitness(imp,data);
    
    % Imperialistic Competition
    imp=ImperialisticCompetition(imp);
    
    
    [value,index]=min([imp.fit]);
    
    if value<gimp.fit
        gimp=imp(index);
    end
    
    
    BEST(iter)=gimp.fit;
    
    
    nimp=length(imp);
    
    disp([ ' Iter  = ' num2str(iter)...
           ' BEST = '  num2str(BEST(iter))...
           ' NIMP = '  num2str(nimp)]);
    
    
    
    
%     if nimp==1;break;end

  % Plot Best Solution
  PlotBestSol(gimp,data,iter)     
    
end


%% Results 

disp([ ' Best Fitness = '  num2str(gimp.fit)]);
disp([ ' Best X = '  num2str(gimp.x)]);
disp([ ' Time = '  num2str(toc)]);


figure()
semilogy(BEST(1:iter),'r')
xlabel('Iteration')
ylabel('Fitness')
legend('BEST')
title('ICA')























