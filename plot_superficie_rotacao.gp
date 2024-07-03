set terminal pngcairo enhanced
set output 'plots/superficie_rotacao_plot.png'
set title 'Superfície de Rotação'
set xlabel 'X'
set ylabel 'Y'
set zlabel 'Z'
set view 60, 120
set style line 1 linecolor rgb '#FFA500' linewidth 1
splot 'plot_dat/superficie_rotacao_data.dat' with lines ls 1 title 'Superfície de Rotação'
