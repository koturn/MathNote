#!/usr/bin/env/ gnuplot

set terminal epslatex color
set output 'img/second_incdec.eps'
set output 'img/second_incdec.tex'
func(t) = 4 * t**3 - 4 * t + 4

set xtics 1
set ytics 1
set mxtics 1
set mytics 1
set grid xtics ytics mxtics mytics

set xlabel '$t$'
set ylabel '$y$'
set dummy t
set xrange [-1.5 : 1.5]
set yrange [-1 : 8]

x1 = 1 / sqrt(3)
x2 = -1 / sqrt(3)
set label 1 point pt 7 ps 1.5 at x1, func(x1)
set label 2 '$\left( \dfrac{1}{\sqrt{3}}, \: 4 \left( - \dfrac{2 \sqrt{3}}{9} + 1 \right) \right)$' at 1 / sqrt(3), 1.5 center
set label 3 point pt 7 ps 1.5 at x2, func(x2)
set label 4 '$\left( - \dfrac{1}{\sqrt{3}}, \: 4 \left( \dfrac{2 \sqrt{3}}{9} + 1 \right) \right)$' at -1 / sqrt(3), 6.5 center
set label 5 point pt 7 ps 1.5 at -1.325, 0
set label 6 '$\left( \alpha, f(\alpha) \right)$' at -0.8, 0 right

plot 4 * t**3 - 4 * t + 4 title "$y = f'(t) = 4t^3 - 4t + 4$"
