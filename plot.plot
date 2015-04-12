reset
set term epslatex color
set output '1min.tex'

f(x)=a*exp(b*x)+c
a=711
b=-0.02
c=5
set fit logfile 'log1min.log'
fit f(x) '1min.dat' via a,b,c
p '1min.dat' t'$1\si\minute$ Aktivierung', f(x) t'Fit'
set output
!epstopdf 1min.eps

set output '2min.tex'

g(x)=d*exp(e*x)+f
d=711
e=-0.02
f=5
set fit logfile 'log2min.log'
fit g(x) '2min.dat' via d,e,f
p '2min.dat' t'$2\si\minute$ Aktivierung', g(x) t'Fit'
set output
!epstopdf 2min.eps

set output '4min.tex'

h(x)=g*exp(h*x)+i
g=711
h=-0.02
i=5
set fit logfile 'log4min.log'
fit h(x) '4min.dat' via g,h,i
p '4min.dat' t'$4\si\minute$ Aktivierung', h(x) t'Fit'
set output
!epstopdf 4min.eps


set output '8min.tex'

j(x)=j*exp(k*x)+l
j=827
k=-0.017
l=5
set fit logfile 'log8min.log'
fit j(x) '8min.dat' via j,k,l
p '8min.dat' t'$8\si\minute$ Aktivierung', j(x) t'Fit'
set output
!epstopdf 8min.eps

set output 'null.tex'
set yrange [0:*]
k(x)=m
fit k(x) 'Nullrate_ohne_Platte.dat' via m
p 'Nullrate_ohne_Platte.dat' t'Nullrate', k(x) t'Fit'
set output
!epstopdf null.eps
