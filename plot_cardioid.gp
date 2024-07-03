set terminal pngcairo
set output 'plots/cardioid_plot.png'
set title 'Cardioid Plot'
set xlabel 'x'
set ylabel 'y'
plot 'plot_dat/cardioid_data.dat' using 1:2 with lines title 'Cardioid'
