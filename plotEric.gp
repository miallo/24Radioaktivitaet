reset
set term epslatex color solid
set output 'plot1.tex'
set title 'Übersicht'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'

N_a1=148
N_a2=181
N_a4=191
N_a8=221

N_b1=7
N_b2=10
N_b4=17
N_b8=20

N_0=0.378462

T_a=24
T_b=148

g(x)=N_a1*exp(-log(2)/T_a*x)
g_(x)=N_b1*exp(-log(2)/T_b*x)
h_(x)=N_b2*exp(-log(2)/T_b*x)
h(x)=N_a2*exp(-log(2)/T_a*x)
i(x)=N_a4*exp(-log(2)/T_a*x)
j(x)=N_a8*exp(-log(2)/T_a*x)
j_(x)=N_b8*exp(-log(2)/T_b*x)
i_(x)=N_b4*exp(-log(2)/T_b*x)
k(x)=N_0
max(x, y) = (x > y ? x : y)
f(x,y)=(y==0) ? N_a1*exp(-log(2)/T_a*x)+N_b1*exp(-log(2)/T_b*x)+N_0 : (y==1) ? N_a2*exp(-log(2)/T_a*x)+N_b2*exp(-log(2)/T_b*x)+N_0 : (y==2) ? N_a4*exp(-log(2)/T_a*x)+N_b4*exp(-log(2)/T_b*x)+N_0 : (y==3) ? N_a8*exp(-log(2)/T_a*x)+N_b8*exp(-log(2)/T_b*x)+N_0 : N_0
fit f(x,y) 'data.dat' using (($1)-2.5):-2:(($2)/5):(max(0.5,sqrt($2))) via N_a1,N_a2,N_a4,N_a8,N_b1,N_b2,N_b4,N_b8,T_a,T_b,N_0
set xrange [0:250]
set yrange [-10:150]
p g(x)+g_(x)+k(x) lc 1 t 'fit 1 min',h(x)+h_(x)+k(x) lc 2 t 'fit 2 min',i(x)+i_(x)+k(x) lc 3 t 'fit 4 min',j(x)+j_(x)+k(x) lc 4 t 'fit 8 min',k(x) lc 5 t 'fit Nullrate','1min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e lc 1 t 'Messwerte 1min','2min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e lc 2 t 'Messwerte 2min','4min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e lc 3 t 'Messwerte 4 min','8min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e lc 4 t 'Messwerte 8 min','Nullrate_ohne_Platte.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e lc 5 t 'Messwerte Nullrate'
set output
!epstopdf plot1.eps
set output 'plot1min.tex'
set title '1 Minute Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:250]
set yrange [-10:150]
p g(x)+k(x) t 'Isotop A',g_(x)+k(x) t 'Isotop B',g(x)+g_(x)+k(x) t 'Summe',k(x) t 'Nullrate','1min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 1 min' lc 'black'
set output
!epstopdf plot1min.eps
set output 'plot2min.tex'
set title '2 Minuten Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:250]
set yrange [-10:150]
p h(x)+k(x) t 'Isotop A',h_(x)+k(x) t 'Isotop B',h(x)+h_(x)+k(x) t 'Summe',k(x) t 'Nullrate','2min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 2 min' lc 'black'
set output
!epstopdf plot2min.eps
set output 'plot4min.tex'
set title '4 Minuten Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:250]
set yrange [-10:150]
p i(x)+k(x) t 'Isotop A',i_(x)+k(x) t 'Isotop B',i(x)+i_(x)+k(x) t 'Summe',k(x) t 'Nullrate','4min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 4 min' lc 'black'
set output
!epstopdf plot4min.eps
set output 'plot8min.tex'
set title '8 Minuten Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:250]
set yrange [-10:150]
p j(x)+k(x) t 'Isotop A',j_(x)+k(x) t 'Isotop B',j(x)+j_(x)+k(x) t 'Summe',k(x) t 'Nullrate','8min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 8 min' lc 'black'
set output
!epstopdf plot8min.eps

set logscale y
set output 'plot1minlog.tex'
set title '1 Minute Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:300]
set yrange [1:150]
p g(x)+k(x) t 'Isotop A',g_(x)+k(x) t 'Isotop B',g(x)+g_(x)+k(x) t 'Summe',k(x) t 'Nullrate','1min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 1 min' lc 'black'
set output
set output 'plot2minlog.tex'
set title '2 Minuten Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:300]
set yrange [1:150]
p h(x)+k(x) t 'Isotop A',h_(x)+k(x) t 'Isotop B',h(x)+h_(x)+k(x) t 'Summe',k(x) t 'Nullrate','2min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 2 min' lc 'black'
set output
set output 'plot4minlog.tex'
set title '4 Minuten Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:300]
set yrange [1:150]
p i(x)+k(x) t 'Isotop A',i_(x)+k(x) t 'Isotop B',i(x)+i_(x)+k(x) t 'Summe',k(x) t 'Nullrate','4min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 4 min' lc 'black'
set output
set output 'plot8minlog.tex'
set title '8 Minuten Aktivierungszeit'
set xlabel 'Zeit $t$ [s]'
set ylabel 'Anzahl der Zerfälle pro Sekunde $N$'
set xrange [0:300]
set yrange [1:150]
p j(x)+k(x) t 'Isotop A',j_(x)+k(x) t 'Isotop B',j(x)+j_(x)+k(x) t 'Summe',k(x) t 'Nullrate','8min.dat' using (($1)-2.5):(($2)/5):(max(0.5,sqrt($2))) w e t 'Messwerte 8 min' lc 'black'
set output
#unset logscale
#set autoscale
#Q=200
#W=30
#set output 'aktivierungA.tex'
#a(x)=Q*(1-exp(-log(2)/T_A*x))
#fit a(x) 'aktivierungA.dat' u 1:2:3 via Q,T_A
#p a(x) t 'Fit Isotop A', 'aktivierungA.dat' u 1:2:3 w e t'Anfangsaktivitäten Isotop A'
#set output 'aktivierungB.tex'
#b(x)=W*(1-exp(-log(2)/T_B*x))
#fit b(x) 'aktivierungB.dat' u 1:2:3 via W,T_B
#p b(x) t 'Fit Isotop B', 'aktivierungB.dat' u 1:2:3 w e t'Anfangsaktivitäten Isotop B'
