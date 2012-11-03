#Données
param nbpostes;

set T:=1..nbpostes;
set T2:=0..nbpostes;
param M:=25;

param d{T};
param h{T};
param p{T};
param f{T};

#Variables de décision
var x{T} >=0;
var y{T} >=0;
var s{T2}>=0;

#Fonction objectif
minimize couts : sum{i in T} (y[i]*f[i] + x[i]*p[i] + h[i]*s[i]);


#Contraintes

s.t. Equilibre{i in T} : (s[i-1]+x[i])=(s[i]+d[i]);
s.t. Activation{i in T}: y[i]*sum{j in i..nbpostes}d[j] >= x[i];
s.t. contr1 :s[0]=0;
s.t. contr2 :s[nbpostes]=0;


#s.t. contr3 :y[1]=1;
#s.t. contr4 :y[2]=1;
#s.t. contr5 :y[3]=1;
#s.t. contr6 :y[4]=1;
#s.t. contr7 :y[5]=1;

#Résolution
solve;

#Affichange des res
display : s;
display : x;
display : y;
display : sum{i in T} (y[i]*f[i] + x[i]*p[i] + h[i]*s[i]); #fonction objectif à recopier

data;

param nbpostes:= 5;
param d:= 1 3 2 5 3 6 4 3 5 8;
param p:= 1 2 2 4 3 6 4 8 5 10 ;
param h:= 1 3 2 2 3 3 4 2 5 0;
param f:= 1 10 2 8 3 6 4 4 5 2;

end;




