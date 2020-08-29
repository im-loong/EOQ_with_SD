%%main
K=0
for J = 1:10
    J
    [x,fval,exitflag,output,population,score] = run_ga(5,[0 0 0 0 0],[2*pi 2*pi 2*pi 2*pi 2*pi]);
    K = K + 1
    X(K,:) = x;
end
clearvars -except X

%%
function [x,fval,exitflag,output,population,score] = run_ga(nvars,lb,ub)
    options = optimoptions('ga');
    options = optimoptions(options,'Display','off');
    options = optimoptions(options,'MaxGenerations',100);
    options = optimoptions(options,'CrossoverFraction',0.8);
    options = optimoptions(options,'PopulationSize',200);
    options = optimoptions(options,'InitialPopulationMatrix',[]);
    [x,fval,exitflag,output,population,score] = ...
    ga(@fun,nvars,[],[],[],[],lb,ub,@nonline,[],options);
end

%%
function S = fun(x)
    x1=x(1); x2=x(2); x3=x(3); x4=x(4); x5=x(5);
    S = fx(x1)*x1 + fx(x1+x2)*x2 + fx(x1+x2+x3)*x3 + fx(x1+x2+x3+x4)*x4 + fx(x1+x2+x3+x4+x5)*x5;
    S = -1*S
end

%%
function fxx = fx(x)
    fxx = cos(x) - 2*x + 4*pi - 1;
end

%%
function [c,ceq] = nonline(x)
    x1=x(1); x2=x(2); x3=x(3); x4=x(4); x5=x(5);
    c(1) =  -x1;
    c(2) =  -x2;
    c(3) =  -x3;
    c(4) =  -x4;
    ceq = x1 + x2 + x3 + x4 - 2*pi;
end

%%
