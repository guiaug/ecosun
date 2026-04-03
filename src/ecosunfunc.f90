module ecosunfunc

	use netcdf

	contains
		subroutine read_netcdf(ncid)

			integer, 				intent(in) :: ncid

			integer :: nx, ny, ntime
			integer :: dimid, status			


			status = nf90_inq_dimid(ncid, "time", dimid)
			call check(status, "Getting time dim ID")
			status = nf90_inquire_dimension(ncid, dimid, len=ntime)
			call check(status, "Getting lon size")
			
			print *,  ntime

		end subroutine read_netcdf


		! -----------------------------------------------------------
		! Error-checking helper: stops execution on NetCDF errors
		! -----------------------------------------------------------
		subroutine check(status, context)
			integer,          intent(in) :: status
			character(len=*), intent(in) :: context
			if (status /= NF90_NOERR) then
				write(*,'(A,A,A,A)') "NetCDF error in [", trim(context), "]: ", &
						trim(nf90_strerror(status))
				stop 1
			end if
		end subroutine check
end module ecosunfunc
