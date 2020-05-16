variables gamma, beta, F1;

gamma.lo = 0;
gamma.up = pi;
beta.lo = 0;
beta.up = pi;

equation objective;

objective.. F1 =e= 3-(sqr(sin(2*beta))*sqr(sin(2*gamma))
                - 1/2*sin(4*beta)*sin(4*gamma))*(1+sqr(cos(4*gamma)));

model QAOA /all/;

option nlp = couenne, optcr = 0;

solve QAOA using nlp max F1;