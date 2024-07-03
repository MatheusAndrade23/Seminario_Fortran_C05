program sin_data
  implicit none
  integer :: i, n, ierr
  real(8) :: x, dx
  real(8), parameter :: pi = 3.141592653589793
  n = 100
  dx = 2.0 * pi / (n - 1)
  
  ! Gerar dados para sin(x)
  open(unit=10, file="plot_dat/sin_data.dat", status="replace")
  do i = 0, n-1
      x = i * dx
      write(10, *) x, sin(x)
  end do
  close(10)

  ! Criar script do Gnuplot
  open(unit=20, file="plot_sin.gp", status="replace")
  write(20, '(A)') "set terminal pngcairo"
  write(20, '(A)') "set output 'plots/sin_plot.png'"
  write(20, '(A)') "set title 'Plot of sin(x)'"
  write(20, '(A)') "set xlabel 'x'"
  write(20, '(A)') "set ylabel 'sin(x)'"
  write(20, '(A)') "plot 'plot_dat/sin_data.dat' using 1:2 with lines title 'sin(x)'"
  close(20)

  ! Chamar Gnuplot para gerar o gráfico
  call execute_command_line("gnuplot plot_sin.gp", wait=.true., exitstat=ierr)
  if (ierr /= 0) then
      print *, "Erro ao chamar o Gnuplot"
  end if
end program sin_data
