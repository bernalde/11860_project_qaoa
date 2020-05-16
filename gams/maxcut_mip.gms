set n /0*4/;
alias(n,i,j);
set e(i,j)
/
0.1
0.2
1.2
3.2
3.4
4.2
/
Variable
   x(n)     'decides on what side of the cut'
   cut(i,j) 'edge is in the cut'
   z        'objective';

Binary Variable x;

Equation obj, xor1(i,j), xor2(i,j), xor3(i,j), xor4(i,j);

obj..          z      =e= sum(e, cut(e));

xor1(e(i,j)).. cut(e) =l= x(i) + x(j);

xor2(e(i,j)).. cut(e) =l= 2 - x(i) - x(j);

xor3(e(i,j)).. cut(e) =g= x(i) - x(j);

xor4(e(i,j)).. cut(e) =g= x(j) - x(i);

x.fx('0') = 0;
x.fx('1') = 1;
x.fx('2') = 1;
x.fx('3') = 0;
x.fx('4') = 0;

Model maxcut / all /;

option mip = cplex;
maxcut.optfile = 1;

solve maxcut max z using mip;
