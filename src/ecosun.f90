program ecosun
	use netcdf 
	use iso_fortran_env, only: real64
	use ecosunfunc
	implicit none


	character(len=256) :: filename_netcdf
	integer :: ncid
	integer :: status

	filename_netcdf = "../SuntansOutputs/CHQ_CaseStudy_AVG_0000.nc"

  ! -------------------------------------------------------
  ! 1. Open the NetCDF file (read-only)
  ! -------------------------------------------------------
  status = nf90_open(trim(filename_netcdf), NF90_NOWRITE, ncid)
  call check(status, "Opening file")

	call read_netcdf(ncid)

end 
