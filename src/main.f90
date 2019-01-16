program main
  use mod_model
  use mod_environment
  implicit none

  type(model) mymodel
  type(environment) myenvironment
!   integer(4) :: err = 0
  double precision :: beta = .0d0
  
  myenvironment = environment()

  read(*, *) beta
  call myenvironment%canonical%set_temperature(beta)
  call myenvironment%canonical%show_temperature()
end program main
