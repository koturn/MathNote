#!/usr/bin/env/ gnuplot

set terminal epslatex color
set output 'img/first_incdec.eps'
set output 'img/first_incdec.tex'
func(t) = t**4 - 2 * t**2 + 4 * t + 1

set xtics 1
set ytics 1
set mxtics 1
set mytics 1
set grid xtics ytics mxtics mytics

set xlabel '$t$'
set ylabel '$y$'
set dummy t
set xrange [-2.5 : 0.5]
set yrange [-5.5 : 1.5]

x1 = -1 / sqrt(3)
x2 = -1.325
set label 1 point pt 7 ps 1.5 at x1, func(x1)
set label 2 '$\left( - \dfrac{1}{\sqrt{3}}, \: \dfrac{4}{9} \left( 1 - 3 \sqrt{3} \right) \right)$' at -1 / sqrt(3) + 0.1, -2
set label 3 point pt 7 ps 1.5 at x2, func(x2)
set label 4 '$\left( \alpha, f(\alpha) \right)$' at -1.35,-5.2 center

plot t**4 - 2 * t**2 + 4 * t + 1 title '$y = f(t) = t^4 - 2t^2 + 4t + 1$'
