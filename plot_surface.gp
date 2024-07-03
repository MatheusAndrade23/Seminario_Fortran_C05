set terminal pngcairo enhanced
set output 'plots/surface_plot.png'
set title 'Surface Plot of z = sin(x) * cos(y)'
set xlabel 'x'
set ylabel 'y'
set zlabel 'z'
set dgrid3d 100,100
set hidden3d
splot 'plot_dat/surface_data.dat' using 1:2:3 with lines title 'sin(x) * cos(y)'
