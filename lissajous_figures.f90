program plot_lissajous_figure
  implicit none
  integer :: i, n, ierr
  real(8) :: t, A, B, a_freq, b_freq, delta_x, delta_y, x, y
  real(8), parameter :: pi = 3.141592653589793
  n = 1000
  A = 1.0  ! Amplitude no eixo x
  B = 1.0  ! Amplitude no eixo y
  a_freq = 3.0  ! Frequência no eixo x
  b_freq = 2.0  ! Frequência no eixo y
  delta_x = pi / 2.0  ! Fase no eixo x
  delta_y = 0.0       ! Fase no eixo y

  open(unit=10, file="plot_dat/lissajous_figure_data.dat", status="replace")
  do i = 0, n-1
      t = 2.0 * pi * real(i) / real(n-1)
      x = A * sin(a_freq * t + delta_x)
      y = B * sin(b_freq * t + delta_y)
      write(10, *) x, y
  end do
  close(10)

  ! Criar script do Gnuplot
  open(unit=20, file="plot_lissajous_figure.gp", status="replace")
  write(20, '(A)') "set terminal pngcairo"
  write(20, '(A)') "set output 'plots/lissajous_figure_plot.png'"
  write(20, '(A)') "set title 'Lissajous Figure Plot'"
  write(20, '(A)') "set xlabel 'x'"
  write(20, '(A)') "set ylabel 'y'"
  write(20, '(A)') "plot 'plot_dat/lissajous_figure_data.dat' with lines title 'Lissajous Figure'"
  close(20)

  ! Chamar Gnuplot para gerar o gráfico
  call execute_command_line("gnuplot plot_lissajous_figure.gp", wait=.true., exitstat=ierr)
  if (ierr /= 0) then
      print *, "Erro ao chamar o Gnuplot"
  end if
end program plot_lissajous_figure
