%%Constants

syms t;
syms R;
h = (1.054)*10^-27; %rationalized Planck's constant
m = (1.6749)*10^-24; %g
c =  (3)*10^10; %cm/s
%% Setup Equations


n = ((sinh((t)/(4)))^3) / 3 * (pi^2) * ((h / (m * c))^3);

e_n1 = n * (E1 + (m*(c^2)));
e_n2 = n * (E2 + (m*(c^2)));
e_n3 = n * (E3 + (m*(c^2)));

P_n1 = n^2 * dE1
P_n2 = n^2 * dE2
P_n3 = n^2 * dE3
%%
%%Eos Derivatives
dE1 = diff(E1);
dE2 = diff(E2);
dE3 = diff(E3);

%%
%%EoS
E1 = 2.6511+(76.744*n)-(138.611*(n^2))+(459.906*(n^3))-(122.832*(n^4));

E2 = 7.57891-(1.23275*n)+(227.384*(n^2))-(146.596*(n^3))+(324.823*(n^4))-(120.355*(n^5));

E3 = 6.33041-(28.1793*n)+(288.397*(n^2))-(65.2281*(n^3));

%%
%%du/dR
du_dR = 4 * pi * e_n1 * (R^2)
fplot(du_dR)