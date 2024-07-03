set terminal pngcairo
set output 'plots/lissajous_figure_plot.png'
set title 'Lissajous Figure Plot'
set xlabel 'x'
set ylabel 'y'
plot 'plot_dat/lissajous_figure_data.dat' with lines title 'Lissajous Figure'
