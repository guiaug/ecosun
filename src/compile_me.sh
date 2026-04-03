rm *.o *.mod read_netcdf
gfortran -c ecosunfunc.f90 ecosun.f90 -lnetcdf -lnetcdff $(nc-config --cflags) $(nc-config --fflags)
gfortran ecosunfunc.o ecosun.o -lnetcdf -lnetcdff $(nc-config --cflags) $(nc-config --fflags) -o read_netcdf
