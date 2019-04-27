program main
        use naivemath
        use bettermath
        use dotmath

        implicit none

        character(len = :), allocatable :: path
	print *, "kind 4"
        path = '../res/kind4.dat'
        print *, mtrx_mult4(path)
		print *, "kind 8"
        path = '../res/kind8.dat'
        print *, mtrx_mult8(path)
		print *, "kind 16"
        path = '../res/kind16.dat'
        print *, mtrx_mult16(path)

		call RANDOM_SEED()

        contains


        function mtrx_mult4(path) result (r)
            implicit none
            character(len = :), intent(in), allocatable :: path
            real(kind = 4), allocatable, dimension(:, :) :: A, B, C
            real :: clk_start, clk_stop, native_time, better_time, dot_time, matmul_time
            integer :: n, i,r
            n = 10
            open(unit = 1, file = path)
            write (1,*) '       N   ', '   naive  ', '   better    ', '   dotmull    ' , '    matmull'
            do i = 1, 7
                n = 2 * n
                A = generateMatrix(n)
                B = generateMatrix(n)
				
                call CPU_TIME(clk_start)
                C = naive(A, B)
                call CPU_TIME(clk_stop)
                native_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = better(A, B)
                call CPU_TIME(clk_stop)
                better_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = dotmull(A, B)
                call CPU_TIME(clk_stop)
                dot_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = matmul(A, B)
                call CPU_TIME(clk_stop)
				
                matmul_time = clk_stop-clk_start
                write (1,*) n, native_time, better_time, dot_time, matmul_time
            end do
            close(1)
			r=0
        end function mtrx_mult4

        function mtrx_mult8(path) result (r)
            implicit none
            character(len = :), intent(in), allocatable :: path
			
            real(kind = 8), allocatable, dimension(:, :) :: A, B, C
            real :: clk_start, clk_stop, native_time, better_time, dot_time, matmul_time
            integer :: n, i,r
            n = 10
            open(unit = 1, file = path)
            write (1,*) '        N   ', '   naive    ', '   better    ', '   dotmull    ' , '    matmull'
            do i = 1, 7
                n = 2 * n
                A = generateMatrix(n)
                B = generateMatrix(n)
                call CPU_TIME(clk_start)
                C = naive(A, B)
                call CPU_TIME(clk_stop)
                native_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = better(A, B)
                call CPU_TIME(clk_stop)
                better_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = dotmull(A, B)
                call CPU_TIME(clk_stop)
                dot_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = matmul(A, B)
                call CPU_TIME(clk_stop)
                matmul_time = clk_stop-clk_start
                write (1,*) n, native_time, better_time, dot_time, matmul_time
            end do
            close(1)
			r=0
        end function mtrx_mult8

        function mtrx_mult16(path) result (r)
            implicit none
            character(len = :), intent(in), allocatable :: path
            real(kind = 16), allocatable, dimension(:, :) :: A, B, C
            real :: clk_start, clk_stop, native_time, better_time, dot_time, matmul_time
            integer :: n, i,r
            n = 10
			
            open(unit = 1, file = path)
			
            write (1,*) '        N   ', '   naive    ', '   better    ', '   dotmull    ' , '    matmull'
            do i = 1, 7
                n = 2 * n
                A = generateMatrix(n)
                B = generateMatrix(n)
				
                call CPU_TIME(clk_start)
                C = naive(A, B)
                call CPU_TIME(clk_stop)
                native_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = better(A, B)
                call CPU_TIME(clk_stop)
                better_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = dotmull(A, B)
                call CPU_TIME(clk_stop)
                dot_time = clk_stop-clk_start
                call CPU_TIME(clk_start)
                C = matmul(A, B)
                call CPU_TIME(clk_stop)
                matmul_time = clk_stop-clk_start
                write (1,*) n, native_time, better_time, dot_time, matmul_time
            end do
            close(1)
			r=0
	
        end function mtrx_mult16
		
		
		function generateMatrix (n) result (mx)
            implicit none
            integer, intent(in) :: n
            real, dimension (n, n) :: mx
            integer :: i, j
            do i = 1, n
                do j = 1, n
				
                    call RANDOM_NUMBER(mx(i, j))
					
                end do
            end do
        end function generateMatrix
		
    end program main
