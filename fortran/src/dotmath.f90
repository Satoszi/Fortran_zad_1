module dotmath 

        implicit none
        private
        public :: dotmull

        interface dotmull
            procedure dot4, dot8, dot16
        end interface dotmull

        contains

        function dot4 (A, B) result (C)
            implicit none
            real(kind = 4), intent(in), dimension(:, :) :: A, B
            real(kind = 4), dimension(size(B, 1), size(A, 2)) :: C
            integer :: i, j
            C = 0.
            do i = 1, size(A, 2)
                do j = 1, size(B, 1)
                    C(j, i) = dot_product(A(:, i), B(j, :))
                end do
            end do
        end function dot4

		
        function dot8 (A, B) result (C)
            implicit none
            real(kind = 8), intent(in), dimension(:, :) :: A, B
            real(kind = 8), dimension(size(B, 1), size(A, 2)) :: C
            integer :: i, j
            C = 0.
            do i = 1, size(A, 2)
                do j = 1, size(B, 1)
                    C(j, i) = dot_product(A(:, i), B(j, :))
                end do
            end do
        end function dot8

		
        function dot16 (A, B) result (C)
            implicit none
            real(kind = 16), intent(in), dimension(:, :) :: A, B
            real(kind = 16), dimension(size(B, 1), size(A, 2)) :: C
            integer :: i, j
            C = 0.
            do i = 1, size(A, 2)
                do j = 1, size(B, 1)
                    C(j, i) = dot_product(A(:, i), B(j, :))
                end do
            end do
        end function dot16

		
    end module dotmath
