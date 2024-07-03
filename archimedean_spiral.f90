program plot_archimedean_spiral
  implicit none
  integer :: i, n, ierr
  real(8) :: theta, a, x, y
  real(8), parameter :: pi = 3.141592653589793
  n = 500
  a = 1.0 ! Parâmetro que define a distância entre as voltas da espiral
  
  open(unit=10, file="plot_dat/archimedean_spiral_data.dat", status="replace")
  do i = 0, n-1
      theta = 2.0 * pi * real(i) / real(n-1)
      x = a * theta * cos(theta)
      y = a * theta * sin(theta)
      write(10, *) x, y
  end do
  close(10)

  ! Criar script do Gnuplot
  open(unit=20, file="plot_archimedean_spiral.gp", status="replace")
  write(20, '(A)') "set terminal pngcairo"
  write(20, '(A)') "set output 'plots/archimedean_spiral_plot.png'"
  write(20, '(A)') "set title 'Archimedean Spiral Plot'"
  write(20, '(A)') "set xlabel 'x'"
  write(20, '(A)') "set ylabel 'y'"
  write(20, '(A)') "plot 'plot_dat/archimedean_spiral_data.dat' with lines title 'Archimedean Spiral'"
  close(20)

  ! Chamar Gnuplot para gerar o gráfico
  call execute_command_line("gnuplot plot_archimedean_spiral.gp", wait=.true., exitstat=ierr)
  if (ierr /= 0) then
      print *, "Erro ao chamar o Gnuplot"
  end if
end program plot_archimedean_spiral
