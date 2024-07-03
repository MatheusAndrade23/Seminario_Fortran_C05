program plot_cardioid
  implicit none
  integer :: i, n, ierr
  real(8) :: theta, a, x, y
  real(8), parameter :: pi = 3.141592653589793
  n = 100
  a = 1.0 ! Parâmetro que define o tamanho do cardioide
  theta = 0.0
  open(unit=10, file="plot_dat/cardioid_data.dat", status="replace")
  do i = 0, n-1
      theta = i * 2.0 * pi / real(n-1)
      x = 2.0 * a * cos(theta) * (1.0 - cos(theta))
      y = 2.0 * a * sin(theta) * (1.0 - cos(theta))
      write(10, *) x, y
  end do
  close(10)

  ! Criar script do Gnuplot
  open(unit=20, file="plot_cardioid.gp", status="replace")
  write(20, '(A)') "set terminal pngcairo"
  write(20, '(A)') "set output 'plots/cardioid_plot.png'"
  write(20, '(A)') "set title 'Cardioid Plot'"
  write(20, '(A)') "set xlabel 'x'"
  write(20, '(A)') "set ylabel 'y'"
  write(20, '(A)') "plot 'plot_dat/cardioid_data.dat' using 1:2 with lines title 'Cardioid'"
  close(20)

  ! Chamar Gnuplot para gerar o gráfico
  call execute_command_line("gnuplot plot_cardioid.gp", wait=.true., exitstat=ierr)
  if (ierr /= 0) then
      print *, "Erro ao chamar o Gnuplot"
  end if
end program plot_cardioid