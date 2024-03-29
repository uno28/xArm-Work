clear
clc
close all

%Joint1 v = 1.25 a =4
%Joint2 v =  a =    v= 1.5 a = 5 at 65 (for 1 second of 0)
%BOM IS 84 and that 1.4 seconds per beat
initial_position = [0 0 0 90 0 0 0];
initial_position = initial_position;

%defines the limits of the velocity and acceleration of the panda to ensure
%it never exceeds P_phase4(n) = Strumming_pattern(2,n);
vel_max = [180 180 180 180 180 180 180]; %rad/s
a_max = [1000 1000 1000 1000 1000 1000 1000]; %rad/s^2

%sets initial position of panda (must match initial in cpp code)
Initial_position = [0, -pi/4, 0, -3 * pi/4, 0, pi/2, pi/4];


%% Desired Inputs 
BPM = 60; %BPM of your song
Time_factor = 60/BPM;
a=2;
%% robot 8
a8 = {0; [-76.6 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-76.6d
a8_t = {22; [4 18]; 22; 22; 22; 22; [2 2 14 2 2]};

b8 = {0; [21.76 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-54.84d
b8_t = {22; [4 18]; 22; 22; 22; 22; [2 2 14 2 2]};

c8= {0; [10.64 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-44.2d
c8_t = {22; [4 18]; 22; 22; 22; 22; [2 2 14 2 2]};

d8 = {0; [-32.4 0]; 0; 0; 0; 0; [0 45 0 -45]}; %-76.6d
d8_t = {16; [2 14]; 16; 16; 16; 16; [2 2 10 2]};

e1 = {0; [-13.4 0]; 0; 0; 0; 0; [0 45 0 -45]}; %-90d
e1_t = {16; [2 14]; 16; 16; 16; 16; [2 2 10 2]};

f1 = {0; [25.7 0]; 0; 0; 0; 0; [0 45 0 -45]}; %-64.3d
f1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 8 2]};

g1 = {0; [20.1 0]; 0; 0; 0; 0; [0 45 0 -45]}; %-44.2d
g1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 8 2]};

h1 = {0; [-32.4 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %-76.6d
h1_t = {10; [2 8]; 10; 10; 10; 10; [2 2 2 2 2]};

i1 = {0; [-7.1 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 0 -45 0]}; %-83.7d
i1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 2 2 2 2 2]};

j1 = {0; [-6.3 0]; 0; 0; 0; 0; [12.25 32.75 -45 0]}; %-90d
j1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

k1 = {0; 0; 0; 0; 0; 0; [12.25 32.75 -32.75 0]}; %-90d
k1_t = {8; 8; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [6.3 0]; 0; 0; 0; 0; [12.25 32.75 -32.75 0 -12.25]}; %-90d
l1_t = {12; [2 10]; 12; 12; 12; 12; [2 2 2 4 2]};

pause1 = {0; 180; 0; 0; 0; 0; 0}; %-90d
pause1_t = {8; 8; 8; 8; 8; 8; 8};

m1 = {0; [0 -154.3 0]; 0; 0; 0; 0; [12.25 77.75 0 -90]}; %90 -> -64.3d
m1_t = {18; [2 2 14]; 18; 18; 18; 18; [2 2 8 6]};
%% robot 9
a8 = {0; [-78.9 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-78.9
a8_t = {22; [4 18]; 22; 22; 22; 22; [4 2 10 2 4]};

b8 = {0; [50.4 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-28.5
b8_t = {24; [4 20]; 24; 24; 24; 24; [4 2 10 2 6]};

c8= {0; 0; 0; 0; 0; 0; [45 0 -45 0]}; %-28.5
c8_t = {18; 18; 18; 18; 18; 18; [2 12 2 2]};

d8 = {0; [-38.1 0]; 0; 0; 0; 0; [0 45 0 -45]}; %-66.6
d8_t = {14; [3 14]; 17; 17; 17; 17; [3 2 10 2]};

e1 = {0; [-23.4 0]; 0; 0; 0; 0; [0 45 0 -45]}; %-90
e1_t = {16; [2 14]; 16; 16; 16; 16; [2 2 10 2]};

f1 = {0; [44.9 0]; 0; 0; 0; 0; [45 0 -45]}; %-45.1
f1_t = {14; [2 12]; 14; 14; 14; 14; [2 10 2]};

g1 = {0; [16.6 0]; 0; 0; 0; 0; [45 0 -45]}; %-28.5
g1_t = {14; [2 13]; 15; 15; 15; 15; [2 11 2]};

h1 = {0; [-38.1 0]; 0; 0; 0; 0; [0 45 -45 45 -45]}; %-66.6
h1_t = {10; [2 8]; 10; 10; 10; 10; [2 2 2 2 2]};

i1 = {0; [-23.4 0]; 0; 0; 0; 0; [0 45 -45 45 0 -45 0]}; %-90
i1_t = {16; [2 14]; 16; 16; 16; 16; [3 2 2 2 2 2 3]};

j1 = {0; 0; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-90
j1_t = {9; 9; 9; 9; 9; 9; [3 2 2 2]};

k1 = {0; 0; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-90
k1_t = {8; 8; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [6.3 0]; 0; 0; 0; 0; [12.25 0 32.75 -32.75 0 -12.25]}; %-90
l1_t = {12; [2 10]; 12; 12; 12; 12; [3 2 2 2 4 2]};

pause1 = {0; 180; 0; 0; 0; 0; 0}; %-90
pause1_t = {6; 6; 6; 6; 6; 6; 6};

m1 = {0; [0 -154.3 0]; 0; 0; 0; 0; [12.25 77.75 0 -90]}; %90 -> -64.3
m1_t = {18; [2 2 14]; 18; 18; 18; 18; [2 2 8 6]};
%% robot 7
a8 = {0; [0 -34.3 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %34.3d
a8_t = {22; [4 4 14]; 22; 22; 22; 22; [8 2 4 2 6]};

b8 = {0; [0 -53.8 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
b8_t = {22; [2 4 16]; 22; 22; 22; 22; [8 2 4 2 6]};

c8 = {0; [0 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
c8_t = {22; [4 18]; 22; 22; 22; 22; [4 2 10 2 4]};

d8 = {0; [80 0]; 0; 0; 0; 0; [0 45 0 -45]}; %60.5d
d8_t = {16; [2 14]; 16; 16; 16; 16; [2 2 10 2]};

e1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
e1_t = {16; [2 14]; 16; 16; 16; 16; [2 2 12]};

f1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
f1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 10]};

g1 = {0; [0 29.5 0]; 0; 0; 0; 0; [-45 45 0 -45]}; %90d
g1_t = {16; [2 2 12]; 16; 16; 16; 16; [2 2 10 2]};

h1 = {0; [-135.1 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %-45.1d
h1_t = {10; [2 8]; 10; 10; 10; 10; [3 2 2 2 1]};

i1 = {0; [-14.8 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45 0]}; %-59.9d
i1_t = {14; [2 12]; 14; 14; 14; 14; [4 2 2 2 2 2]};

j1 = {0; [-13.1 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-73d
j1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

k1 = {0; [-17 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-90d
k1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [6.3 0]; 0; 0; 0; 0; [0 12.25 32.75 -32.75 0 -12.25]}; %-90d
l1_t = {16; [3 13]; 16; 16; 16; 16; [3 2 2 2 5 2]};

pause1 = {0; 150.5; 0; 0; 0; 0; 0}; %-90d
pause1_t = {4; 4; 4; 4; 4; 4; 4};

m1 = {0; [0 -38.3 0]; 0; 0; 0; 0; [0 12.25 77.75 0]}; %60.5 -> 22.2d
m1_t = {14; [4 2 8]; 14; 14; 14; 14; [1 3 2 8]};
%% robot 6
a8 = {0; [0 90 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %90d
a8_t = {22; [4 4 14]; 22; 22; 22; 22; [8 2 4 2 6]};

b8 = {0; [0 -136.4 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-46.4d
b8_t = {22; [2 4 16]; 22; 22; 22; 22; [8 2 4 2 6]};

c8 = {0; [0 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-12.9d
c8_t = {22; [4 18]; 22; 22; 22; 22; [4 2 10 2 4]};

d8 = {0; [102.9 0]; 0; 0; 0; 0; [0 45 0]}; %90d
d8_t = {16; [2 14]; 16; 16; 16; 16; [3 2 11]};

e1 = {0; [0 -65.2 0]; 0; 0; 0; 0; [0 -45 45 0]}; %90 - 24.8d
e1_t = {16; [3 2 11]; 16; 16; 16; 16; [1 2 2 11]};

f1 = {0; [0 0]; 0; 0; 0; 0; [0 -45 45 0]}; %24.8d
f1_t = {14; [2 12]; 14; 14; 14; 14; [1 2 2 9]};

g1 = {0; [0 44.2 0]; 0; 0; 0; 0; [0 -45 45 0 -45]}; %24.8 - 67d
g1_t = {16; [3 2 11]; 16; 16; 16; 16; [1 2 2 9 2]};

h1 = {0; [-44.2 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %24.8d
h1_t = {10; [2 8]; 10; 10; 10; 10; [2 2 2 2 2]};

i1 = {0; [-86.7 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -32.75 12.25 0]}; %-61.9d
i1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 2 2 2 2 2]};

j1 = {0; [-28.1 0]; 0; 0; 0; 0; [12.25 32.75 -45 0]}; %-90d
j1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

k1 = {0; [0 0]; 0; 0; 0; 0; [12.25 32.75 -45 0]}; %-90d
k1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [28.1 0]; 0; 0; 0; 0; [12.25 32.75 -32.75 0 -12.25]}; %-61.9d
l1_t = {18; [2 16]; 18; 18; 18; 18; [2 2 2 10 2]};

pause1 = {0; 49; 0; 0; 0; 0; 0}; %-12.9d
pause1_t = {2; 2; 2; 2; 2; 2; 2};

m1 = {0; [0 102.9 0]; 0; 0; 0; 0; [12.25 77.75 0]}; %-12.9 -> 90d
m1_t = {14; [4 2 8]; 14; 14; 14; 14; [4 2 8]};
%% robot 5
a8 = {0; [0 90 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %90d
a8_t = {22; [4 4 14]; 22; 22; 22; 22; [8 2 4 2 6]};

b8 = {0; [0 -102.9 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-12.9d
b8_t = {22; [2 4 16]; 22; 22; 22; 22; [8 2 4 2 6]};

c8 = {0; [0 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-12.9d
c8_t = {22; [4 18]; 22; 22; 22; 22; [6 2 8 2 4]};

d8 = {0; [37.6 0]; 0; 0; 0; 0; [0 45 0]}; %24.7d
d8_t = {16; [2 14]; 16; 16; 16; 16; [4 2 10]};

e1 = {0; [0 -54.9 0]; 0; 0; 0; 0; [0 -45 45 0]}; %24.7 - -30.2d
e1_t = {16; [4 2 10]; 16; 16; 16; 16; [2 2 2 10]};

f1 = {0; [0 0]; 0; 0; 0; 0; [0 -45 45 0]}; %-30.2d
f1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 2 8]};

g1 = {0; [0 17.3 0]; 0; 0; 0; 0; [0 -45 45 0 -45]}; %-30.2 - -12.9d
g1_t = {16; [4 2 10]; 16; 16; 16; 16; [2 2 2 8 2]};

h1 = {0; [17.3 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %-30.2d
h1_t = {10; [2 8]; 10; 10; 10; 10; [3 2 2 2 1]};

i1 = {0; [-31.6 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 0 -45 0]}; %-61.8d
i1_t = {14; [2 12]; 14; 14; 14; 14; [3 2 2 2 1 2 2]};

j1 = {0; [0 0]; 0; 0; 0; 0; [0 12.25 32.75 -45 0]}; %-61.8d
j1_t = {8; [2 6]; 8; 8; 8; 8; [1 2 2 2 1]};

k1 = {0; [-28.2 0]; 0; 0; 0; 0; [0 12.25 32.75 -45 0]}; %-90d
k1_t = {8; [2 6]; 8; 8; 8; 8; [1 2 2 2 1]};

l1 = {0; [0 0]; 0; 0; 0; 0; [0 12.25 32.75 -32.75 0]}; %-90d
l1_t = {18; [2 16]; 18; 18; 18; 18; [2 2 2 2 10]};

m1 = {0; [0 157 0]; 0; 0; 0; 0; [0 77.75 0]}; %-90 -> 67d
m1_t = {16; [6 2 8]; 16; 16; 16; 16; [6 2 8]};
%% robot 4
a8 = {0; [0 90 0]; 0; 0; 0; 0; [0 45 -45 0]}; %90d
a8_t = {22; [6 4 12]; 22; 22; 22; 22; [10 2 2 8]};

b8 = {0; [0 -39.3 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %50.7d
b8_t = {22; [4 4 14]; 22; 22; 22; 22; [8 2 4 2 6]};

c8 = {0; [0 18 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %32.7d
c8_t = {22; [2 4 16]; 22; 22; 22; 22; [6 2 8 2 4]};

d8 = {0; [0 57.3 0]; 0; 0; 0; 0; [0 45 0]}; %90d
d8_t = {16; [3 2 11]; 16; 16; 16; 16; [3 2 11]};

e1 = {0; [0 -90 0]; 0; 0; 0; 0; [0 -45 45 0]}; %90 - 0d
e1_t = {16; [5 2 9]; 16; 16; 16; 16; [3 2 2 9]};

f1 = {0; [0 0]; 0; 0; 0; 0; [0 -45 45 0]}; %0d
f1_t = {14; [2 12]; 14; 14; 14; 14; [3 2 2 7]};

g1 = {0; [0 32.7 0]; 0; 0; 0; 0; [0 -45 45 0 -45]}; %0 - 32.7d
g1_t = {16; [5 2 9]; 16; 16; 16; 16; [3 2 2 7 2]};

h1 = {0; [-57 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %-29.7d
h1_t = {10; [2 8]; 10; 10; 10; 10; [3 2 2 2 1]};

i1 = {0; [-13.5 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 0 -45 0]}; %-43.2d
i1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 2 2 2 2 2]};

j1 = {0; [0 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-43.2d
j1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

k1 = {0; [-28.2 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-68d
k1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [0 0]; 0; 0; 0; 0; [0 12.25 32.75 -32.75 0 -12.25]}; %-68d
l1_t = {18; [2 16]; 18; 18; 18; 18; [3 2 2 2 7 2]};

pause1 = {0; -22; 0; 0; 0; 0; 0}; %-90d
pause1_t = {2; 2; 2; 2; 2; 2; 2};

m1 = {0; [0 180 0]; 0; 0; 0; 0; [0 77.75 0]}; %-90 -> 90d
m1_t = {16; [4 2 8]; 16; 16; 16; 16; [6 2 8]};
%% robot 3
a8 = {0; [0 -34.3 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %34.3d
a8_t = {22; [4 4 14]; 22; 22; 22; 22; [8 2 4 2 6]};

b8 = {0; [0 -53.8 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
b8_t = {22; [2 4 16]; 22; 22; 22; 22; [8 2 4 2 6]};

c8 = {0; [0 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
c8_t = {22; [4 18]; 22; 22; 22; 22; [4 2 10 2 4]};

d8 = {0; [80 0]; 0; 0; 0; 0; [0 45 0 -45]}; %60.5d
d8_t = {16; [2 14]; 16; 16; 16; 16; [2 2 10 2]};

e1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
e1_t = {16; [2 14]; 16; 16; 16; 16; [2 2 12]};

f1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
f1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 10]};

g1 = {0; [0 29.5 0]; 0; 0; 0; 0; [-45 45 0 -45]}; %90d
g1_t = {16; [2 2 12]; 16; 16; 16; 16; [2 2 10 2]};

h1 = {0; [-135.1 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %-45.1d
h1_t = {10; [2 8]; 10; 10; 10; 10; [3 2 2 2 1]};

i1 = {0; [-14.8 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45 0]}; %-59.9d
i1_t = {14; [2 12]; 14; 14; 14; 14; [4 2 2 2 2 2]};

j1 = {0; [-13.1 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-73d
j1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

k1 = {0; [-17 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-90d
k1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [6.3 0]; 0; 0; 0; 0; [0 12.25 32.75 -32.75 0 -12.25]}; %-90d
l1_t = {16; [3 13]; 16; 16; 16; 16; [3 2 2 2 5 2]};

pause1 = {0; 150.5; 0; 0; 0; 0; 0}; %-90d
pause1_t = {4; 4; 4; 4; 4; 4; 4};

m1 = {0; [0 -38.3 0]; 0; 0; 0; 0; [0 12.25 77.75 0]}; %60.5 -> 22.2d
m1_t = {14; [4 2 8]; 14; 14; 14; 14; [1 3 2 8]};
%% robot 2
a8 = {0; [0 -34.3 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %34.3d
a8_t = {22; [4 4 14]; 22; 22; 22; 22; [8 2 4 2 6]};

b8 = {0; [0 -53.8 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
b8_t = {22; [2 4 16]; 22; 22; 22; 22; [8 2 4 2 6]};

c8 = {0; [0 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
c8_t = {22; [4 18]; 22; 22; 22; 22; [4 2 10 2 4]};

d8 = {0; [80 0]; 0; 0; 0; 0; [0 45 0 -45]}; %60.5d
d8_t = {16; [2 14]; 16; 16; 16; 16; [2 2 10 2]};

e1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
e1_t = {16; [2 14]; 16; 16; 16; 16; [2 2 12]};

f1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
f1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 10]};

g1 = {0; [0 29.5 0]; 0; 0; 0; 0; [-45 45 0 -45]}; %90d
g1_t = {16; [2 2 12]; 16; 16; 16; 16; [2 2 10 2]};

h1 = {0; [-135.1 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %-45.1d
h1_t = {10; [2 8]; 10; 10; 10; 10; [3 2 2 2 1]};

i1 = {0; [-14.8 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45 0]}; %-59.9d
i1_t = {14; [2 12]; 14; 14; 14; 14; [4 2 2 2 2 2]};

j1 = {0; [-13.1 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-73d
j1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

k1 = {0; [-17 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-90d
k1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [6.3 0]; 0; 0; 0; 0; [0 12.25 32.75 -32.75 0 -12.25]}; %-90d
l1_t = {16; [3 13]; 16; 16; 16; 16; [3 2 2 2 5 2]};

pause1 = {0; 150.5; 0; 0; 0; 0; 0}; %-90d
pause1_t = {4; 4; 4; 4; 4; 4; 4};

m1 = {0; [0 -38.3 0]; 0; 0; 0; 0; [0 12.25 77.75 0]}; %60.5 -> 22.2d
m1_t = {14; [4 2 8]; 14; 14; 14; 14; [1 3 2 8]};
%% robot 1
a8 = {0; [0 -34.3 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %34.3d
a8_t = {22; [4 4 14]; 22; 22; 22; 22; [8 2 4 2 6]};

b8 = {0; [0 -53.8 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
b8_t = {22; [2 4 16]; 22; 22; 22; 22; [8 2 4 2 6]};

c8 = {0; [0 0]; 0; 0; 0; 0; [0 45 0 -45 0]}; %-19.5d
c8_t = {22; [4 18]; 22; 22; 22; 22; [4 2 10 2 4]};

d8 = {0; [80 0]; 0; 0; 0; 0; [0 45 0 -45]}; %60.5d
d8_t = {16; [2 14]; 16; 16; 16; 16; [2 2 10 2]};

e1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
e1_t = {16; [2 14]; 16; 16; 16; 16; [2 2 12]};

f1 = {0; [0 0]; 0; 0; 0; 0; [-45 45 0]}; %60.5d
f1_t = {14; [2 12]; 14; 14; 14; 14; [2 2 10]};

g1 = {0; [0 29.5 0]; 0; 0; 0; 0; [-45 45 0 -45]}; %90d
g1_t = {16; [2 2 12]; 16; 16; 16; 16; [2 2 10 2]};

h1 = {0; [-135.1 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45]}; %-45.1d
h1_t = {10; [2 8]; 10; 10; 10; 10; [3 2 2 2 1]};

i1 = {0; [-14.8 0]; 0; 0; 0; 0; [12.25 32.75 -45 45 -45 0]}; %-59.9d
i1_t = {14; [2 12]; 14; 14; 14; 14; [4 2 2 2 2 2]};

j1 = {0; [-13.1 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-73d
j1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

k1 = {0; [-17 0]; 0; 0; 0; 0; [0 12.25 32.75 -45]}; %-90d
k1_t = {8; [2 6]; 8; 8; 8; 8; [2 2 2 2]};

l1 = {0; [6.3 0]; 0; 0; 0; 0; [0 12.25 32.75 -32.75 0 -12.25]}; %-90d
l1_t = {16; [3 13]; 16; 16; 16; 16; [3 2 2 2 5 2]};

pause1 = {0; 150.5; 0; 0; 0; 0; 0}; %-90d
pause1_t = {4; 4; 4; 4; 4; 4; 4};

m1 = {0; [0 -38.3 0]; 0; 0; 0; 0; [0 12.25 77.75 0]}; %60.5 -> 22.2d
m1_t = {14; [4 2 8]; 14; 14; 14; 14; [1 3 2 8]};
%% Dance time Left to right is 1 through 5

timetoreturn = 5; %Beats to return all robots at the end to home position
xarmfilename = sprintf('\Users\kanan_2kavhtj\Desktop'); %Change to match your dance
% ROW 1
%Dance Routines for each robot
num = 1;
Dance_routine1 = {a8, b8, c8,d8, e1, f1, g1, h1, i1, j1, k1, l1, pause1, m1}; % Breath allows a robot to WAIT
Dance_routine1_t = {a8_t, b8_t, c8_t, d8_t, e1_t, f1_t, g1_t, h1_t, i1_t, j1_t, k1_t, l1_t, pause1_t, m1_t};

num = num+1;

Dance_routine2 = {breath(20)};
Dance_routine2_t = {breath_t(20)};

num = num+1;

Dance_routine3 = {};
Dance_routine3_t = {};

num = num+1;

Dance_routine4 = {};
Dance_routine4_t = {};

num = num+1;

Dance_routine5 = {};
Dance_routine5_t = {};

num = num+1;

% ROW 2
Dance_routine6 = {};
Dance_routine6_t = {};

num = num+1;

Dance_routine7 = {};
Dance_routine7_t = {};

num = num+1;

Dance_routine8 = {};
Dance_routine8_t = {};

num = num+1;

%  ROW 3

Dance_routine9 = {};
Dance_routine9_t = {};

num = num+1;

Dance_routine10 = {};
Dance_routine10_t = {};



% Assigns each dance routine to a robot)IE dance routine 1 goes to robot
% 1). Can be changed based on # of robots and what robot is doing what
% routine
Dances = {Dance_routine1};

%MAKE SURE THESE MATCH
Dances_t = {Dance_routine1_t};

numrobots = numel(Dances);

%%


%%

function [Trajectory,Velocity] = TrajectoryGeneration(Dances,Dances_t,BPM,timetoreturn);

for robot = 1:numrobots
    robotpos = 7*(robot-1);
figure
for i = 1:7
    Trajectory(i+robotpos,:) = Trajectory(i+robotpos,:) + initial_position(i);
    plot(Trajectory((i+robotpos),:))
    hold on
end
title('Position plot of each joint')
legend('Joint 1','Joint 2','Joint 3','Joint 4','Joint 5','Joint 6','Joint 7')

figure
for i = 1:7
    plot(Velocity(i+robotpos,:))
    hold on
end
legend('Joint 1','Joint 2','Joint 3','Joint 4','Joint 5','Joint 6','Joint 7')
title('Velocity plot of each joint')

%pause
end
final_position_db = transpose(Trajectory);
final_position = final_position_db(1:6:end,:);

delete(xarmfilename);
csvwrite(xarmfilename,final_position);

final_trajectory = Velocity;
final_trajectory = transpose(final_trajectory);
%csvwrite(pandafilename,final_trajectory);
end


function [dance,dance_t] = delaymod(robotnum,wave_wait,step,step_t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for k =1:robotnum
    step_t{1} = -1*center_angles(k);
    for i =1:72
    if k ==1
        Move{k}{i}=[step{i} 0];
        Move_t{k}{i} = [step_t{i} wave_wait*(robotnum-1)];
    elseif k == robotnum
        Move{k}{i}=[0 step{i}];
        Move_t{k}{i} = [wave_wait*(robotnum-1) step_t{i}];
    else
        Move{k}{i}= [0 step{i} 0];
        second_wait = wave_wait*(robotnum-1)- wave_wait*(k-1);
        Move_t{k}{i}=[wave_wait*(k-1) step_t{i} second_wait];
    end
    

    end
end
dance = transpose(Move);
dance_t = transpose(Move_t);
end

function [traj] = breath(dur)

move = [];
repeats = floor(dur/4);
remainder = mod(dur,4);
for j = 1:2*repeats
    move(j) = (-1)^j*2;
end
if dur<4
    traj = {0;0;0;0;0;0;0};
else
    traj = {0;[0 -move];0;-move;0;0;0};
end

end

function [traj_t] = breath_t(dur)



if dur<4
    traj_t = {dur;dur;dur;dur;dur;dur;dur};
else
    repeats = floor(dur/4);
    remainder = mod(dur,4);
    move = zeros(1,2*repeats)+2;
    move4 = move;
    move4(2*repeats) = 2+remainder;
    move(2*repeats) = 1.5+remainder;
    traj_t = {dur;[0.5 move];dur;move4;dur;dur;dur};
end

end
