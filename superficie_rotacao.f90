program plot_superficie_rotacao
    implicit none
    integer :: i, j, nu, nv, ierr
    real(8) :: u, v, du, dv, pi
    real(8) :: x, y, z
    character(len=100) :: filename_data, filename_gp

    nu = 100  ! Número de pontos ao longo de u
    nv = 100  ! Número de pontos ao longo de v
    pi = acos(-1.d0)
    du = 4.0d0 / real(nu-1)  ! Intervalo de u de -2 a 2
    dv = 2.0d0 * pi / real(nv-1)  ! Intervalo de v de 0 a 2*pi

    ! Abrir arquivo de dados para escrita
    filename_data = "plot_dat/superficie_rotacao_data.dat"
    open(unit=10, file=filename_data, status="replace")

    ! Calcular pontos da superfície de rotação e escrever no arquivo
    do i = 0, nu-1
        u = -2.0d0 + real(i) * du
        do j = 0, nv-1
            v = real(j) * dv
            x = u * cos(v)
            y = u * sin(v)
            z = u**2
            write(10, *) x, y, z
        end do
        ! Adicionar uma linha em branco após cada seção completa de v
        write(10, *)
    end do

    close(10)

    ! Criar script do Gnuplot
    filename_gp = "plot_superficie_rotacao.gp"
    open(unit=20, file=filename_gp, status="replace")
    write(20, '(A)') "set terminal pngcairo enhanced"
    write(20, '(A)') "set output 'plots/superficie_rotacao_plot.png'"
    write(20, '(A)') "set title 'Superfície de Rotação'"
    write(20, '(A)') "set xlabel 'X'"
    write(20, '(A)') "set ylabel 'Y'"
    write(20, '(A)') "set zlabel 'Z'"
    write(20, '(A)') "set view 60, 120" ! Angles of view
    write(20, '(A)') "set style line 1 linecolor rgb '#FFA500' linewidth 1"
    write(20, '(A)') "splot 'plot_dat/superficie_rotacao_data.dat' with lines ls 1 title 'Superfície de Rotação'"
    close(20)

    ! Chamar Gnuplot para gerar o gráfico
    call execute_command_line("gnuplot plot_superficie_rotacao.gp", wait=.true., exitstat=ierr)
    if (ierr /= 0) then
        print *, "Erro ao chamar o Gnuplot"
    end if
end program plot_superficie_rotacao
