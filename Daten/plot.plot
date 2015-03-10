reset
set term epslatex color
set output '1min.tex'

f(x)=a*exp(b*x)+c
a=711
b=-0.02
c=5
fit f(x) '1min.dat' via a,b,c
p '1min.dat', f(x)
set output


set output '2min.tex'

g(x)=d*exp(e*x)+f
d=711
e=-0.02
f=5
fit g(x) '2min.dat' via d,e,f
p '2min.dat', g(x)
set output


set output '4min.tex'

h(x)=g*exp(h*x)+i
g=711
h=-0.02
i=5
fit h(x) '4min.dat' via g,h,i
p '4min.dat', h(x)
set output



set output '8min.tex'

j(x)=j*exp(k*x)+l
j=827
k=-0.017
l=5
fit j(x) '8min.dat' via j,k,l
p '8min.dat', j(x)
set output
