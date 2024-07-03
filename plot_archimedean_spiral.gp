set terminal pngcairo
set output 'plots/archimedean_spiral_plot.png'
set title 'Archimedean Spiral Plot'
set xlabel 'x'
set ylabel 'y'
plot 'plot_dat/archimedean_spiral_data.dat' with lines title 'Archimedean Spiral'
