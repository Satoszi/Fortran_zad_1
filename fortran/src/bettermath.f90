module bettermath 

        implicit none
        private
        public :: better

        interface better
            procedure better4, better8, better16
        end interface better

        contains

        function better4 (A, B) result(C)
            implicit none
            real (kind = 4), intent(in), dimension(:, :) :: A, B
            real (kind = 4), dimension(size(B, 1), size(A, 2)) :: C
            integer :: i, j, k
            C = 0.
            do j = 1, size(B, 1)
                do k = 1, size(A, 1)
                    do i = 1, size(A, 2)
                        C(j, i) = C(j, i) + A(k, i) * B(j, k)
                    end do
                end do
            end do
        end function better4

        function better8 (A, B) result(C)
            implicit none
            real (kind = 8), intent(in), dimension(:, :) :: A, B
            real (kind = 8), dimension(size(B, 1), size(A, 2)) :: C
            integer :: i, j, k
            C = 0.
            do j = 1, size(B, 1)
                do k = 1, size(A, 1)
                    do i = 1, size(A, 2)
                        C(j, i) = C(j, i) + A(k, i) * B(j, k)
                    end do
                end do
            end do
        end function better8


        function better16 (A, B) result(C)
            implicit none
            real (kind = 16), intent(in), dimension(:, :) :: A, B
            real (kind = 16), dimension(size(B, 1), size(A, 2)) :: C
            integer :: i, j, k
            C = 0.
            do j = 1, size(B, 1)
                do k = 1, size(A, 1)
                    do i = 1, size(A, 2)
                        C(j, i) = C(j, i) + A(k, i) * B(j, k)
                    end do
                end do
            end do
        end function better16

    end module bettermath
