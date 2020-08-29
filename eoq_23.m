
        
%%main
tic

K=0;

for J = 1:20
    J
    [x,fval,exitflag,output,population,score] = run_ga(23,[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0],...
    [2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi 2*pi ]);
    K = K + 1;
    X_23(K,:) = x;
    Y_23(K,:) = (4*pi*pi - 2*pi + fval) * 1/2 * 1/pi * 12500/pi + 40 * 23;

end

clearvars -except X_22 Y_22 X_23 Y_23 

toc

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
    x1 = x(1);x2 = x(2); x3 = x(3);x4 = x(4); x5 = x(5);
    x6 = x(6);x7 = x(7); x8 = x(8);x9 = x(9); x10 = x(10);
    x11 = x(11);x12 = x(12); x13 = x(13);x14 = x(14); x15 = x(15);
    x16 = x(16);x17 = x(17); x18 = x(18);x19 = x(19); x20 = x(20);
    x21 = x(21); x22 = x(22); x23 = x(23);
    S = fx(x1)*x1 + fx(x1+x2)*x2 + fx(x1+x2+x3)*x3 + fx(x1+x2+x3+x4)*x4 + fx(x1+x2+x3+x4+x5)*x5 + ...
            fx(x1+x2+x3+x4+x5+x6)*x6 + fx(x1+x2+x3+x4+x5++x6+x7)*x7 + fx(x1+x2+x3+x4+x5+x6+x7+x8)*x8 + ...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9)*x9 + fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10)*x10 + ...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11)*x11 + fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12)*x12+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13)*x13+ fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14)*x14+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15)*x15+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16)*x16+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17)*+x17+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17+x18)*x18+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17+x18+x19)*x19+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17+x18+x19+x20)*x20+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17+x18+x19+x20+x21)*x21+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17+x18+x19+x20+x21+x22)*x22+...
            fx(x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17+x18+x19+x20+x21+x22+x23)*x23

            

    S = -1*S
end

%%
function fxx = fx(x)
    fxx = cos(x) - 2*x + 4*pi - 1;
end

%%
function [c,ceq] = nonline(x)
    x1 = x(1);x2 = x(2); x3 = x(3);x4 = x(4); x5 = x(5);
    x6 = x(6);x7 = x(7); x8 = x(8);x9 = x(9); x10 = x(10);
    x11 = x(11);x12 = x(12); x13 = x(13);x14 = x(14); x15 = x(15);
    x16 = x(16);x17 = x(17); x18 = x(18);x19 = x(19); x20 = x(20);
    x21 = x(21); x22=x(22);  x23=x(23);
    c(1) = -x1;
    c(2) = -x2;
    c(3) = -x3;
    c(4) = -x4;
    c(5) = -x5;
    c(6) = -x6;
    c(7) = -x7
    c(8) = -x8;
    c(9) = -x9;
    c(10) = -x10;
    c(11) = -x11;
    c(12) = -x12;
    c(13) = -x13;
    c(14) = -x14;
    c(15) = -x15;
    c(16) = -x16;
    c(17) = -x17;
    c(18) = -x18;
    c(19) = -x19;
    c(20) = -x20;
    c(21) = -x21;
    c(22) = -x22;
    c(23) = -x23;
    ceq = x1 + x2 + x3 + x4 + x5 +x6 + x7 + x8 + x9 + x10+ x11 + x12 + x13 + x14 + x15 + x16 + x17 + x18 + x19 + x20...
        + x21 + x22 + x23...
        - 2*pi;
end


%%