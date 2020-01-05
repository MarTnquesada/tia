include "alldifferent.mzn";
% modelo de asfaltado

int: N;

enum aplicacion = {A, B};
array [1..N, aplicacion] of var int: E;

constraint alldifferent (i in 1..N, j in aplicacion) (E[i,j]);
constraint forall (i in 1..N, j in aplicacion) (E[i,j] > 0);

% Regla a)
constraint abs(E[2,A]-E[1,A])>1;
constraint abs(E[2,A]-E[5,A])>1;
constraint abs(E[2,A]-E[9,A])>1;
constraint abs(E[2,A]-E[4,B])>1;
% Regla b)
constraint forall (i in 1..N where i!=7) (abs(E[7,A]-E[i,A])>1);
% Regla c)
constraint abs(E[4,A]-E[4,B])>4;
% Regla d)
constraint abs(E[8,A]-E[8,B])=2;
% Regla e)
constraint abs(E[5,A]-E[5,B])=1;
% Regla f)
constraint abs(E[4,A]-E[1,A])=1 \/ abs(E[4,A]-E[1,B])=1 \/ abs(E[4,A]-E[9,A])=1 \/ abs(E[4,A]-E[9,B])=1;
% Regla g)
constraint abs(E[6,A]-E[7,A])>1;
% Regla h)
constraint abs(E[5,A]-E[4,B])=1 \/ abs(E[5,A]-E[8,B])=1 \/ abs(E[5,A]-E[2,A])=1 \/ abs(E[5,A]-E[3,A])=1 \/ abs(E[5,A]-E[7,A])=1;
constraint abs(E[5,B]-E[6,A])>1;
% Regla i)
constraint forall (i in 1..N , j in 1..N where i > j) (E[i,A] > E[j,A]);
% Regla j)
constraint forall (i in 1..N , j in 1..N where i<7 /\ i>j) (E[i,B] < E[j,B]);

% Satisfaciendo todas las restricciones
solve satisfy;

% Minimizar la separación entre las capas E8A y E9A y entre E1B y E2B
% solve minimize (abs(E[8,A]-E[9,A]) + abs(E[1,B]-E[2,B]));

% Minimizar la separación entre las capas E7A y E7B, pero maximizando la sep entre E3A y E9B
% solve minimize (abs(E[7,A]-E[7,B]) - abs(E[1,B]-E[2,B]));

output [("E[" ++ show(i) ++ "," ++ show(j) ++ "]=" ++ show(E[i,j]) ++ "\n") | i in 1..N, j in aplicacion];