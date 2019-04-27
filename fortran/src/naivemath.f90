    module naivemath 
        implicit none

        private
        public :: naive

        interface naive
            procedure naive4, naive8, naive16
        end interface naive

        contains

        function naive4 (A, B) result(C)
            implicit none
            real (kind = 4), intent (in), dimension (:, :) :: A, B
            real (kind = 4), dimension (size(B,1), size(A,2)) :: C
            integer :: i, j, k
            C = 0.
            do i = 1, size(A, 2)
                do j = 1, size(B, 1)
                    do k = 1, size(A, 1)
                        C(j, i) = C(j, i) + A(k, i) * B(j, k)
                    end do
                end do
            end do
        end function naive4

        function naive8 (A, B) result(C)
            implicit none
            real (kind = 8), intent (in), dimension (:, :) :: A, B
            real (kind = 8), dimension (size(B,1), size(A,2)) :: C
            integer :: i, j, k
            C = 0.
            do i = 1, size(A, 2)
                do j = 1, size(B, 1)
                    do k = 1, size(A, 1)
                        C(j, i) = C(j, i) + A(k, i) * B(j, k)
                    end do
                end do
            end do
        end function naive8


        function naive16 (A, B) result(C)
            implicit none
            real (kind = 16), intent (in), dimension (:, :) :: A, B
            real (kind = 16), dimension (size(B,1), size(A,2)) :: C
            integer :: i, j, k
            C = 0.
            do i = 1, size(A, 2)
                do j = 1, size(B, 1)
                    do k = 1, size(A, 1)
                        C(j, i) = C(j, i) + A(k, i) * B(j, k)
                    end do
                end do
            end do
        end function naive16
		
    end module naivemath
