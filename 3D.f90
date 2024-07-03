program complex_plot
  implicit none
  integer :: i, j, n, ierr
  real(8) :: x, y, z, dx, dy
  real(8), parameter :: pi = 3.141592653589793
  n = 100
  dx = 2.0 * pi / (n - 1)
  dy = 2.0 * pi / (n - 1)
  
  ! Gerar dados para z = sin(x) * cos(y)
  open(unit=10, file="plot_dat/surface_data.dat", status="replace")
  do i = 0, n-1
      x = i * dx
      do j = 0, n-1
          y = j * dy
          z = sin(x) * cos(y)
          write(10, *) x, y, z
      end do
      ! Adiciona uma linha em branco entre as linhas de dados
      write(10, *)
  end do
  close(10)

  ! Criar script do Gnuplot
  open(unit=20, file="plot_surface.gp", status="replace")
  write(20, '(A)') "set terminal pngcairo enhanced"
  write(20, '(A)') "set output 'plots/surface_plot.png'"
  write(20, '(A)') "set title 'Surface Plot of z = sin(x) * cos(y)'"
  write(20, '(A)') "set xlabel 'x'"
  write(20, '(A)') "set ylabel 'y'"
  write(20, '(A)') "set zlabel 'z'"
  write(20, '(A)') "set dgrid3d 100,100"
  write(20, '(A)') "set hidden3d"
  write(20, '(A)') "splot 'plot_dat/surface_data.dat' using 1:2:3 with lines title 'sin(x) * cos(y)'"
  close(20)

  ! Chamar Gnuplot para gerar o gráfico
  call execute_command_line("gnuplot plot_surface.gp", wait=.true., exitstat=ierr)
  if (ierr /= 0) then
      print *, "Erro ao chamar o Gnuplot"
  end if
end program complex_plot
