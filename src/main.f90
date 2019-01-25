program main
  use mod_model
  use mod_environment
  use mod_simulation
  implicit none

  type(model) mymodel
  type(environment) myenvironment
  type(simulation) mysimulation
!   integer(4) :: err = 0
  double precision :: beta = .0d0
  
  myenvironment = environment()
  mymodel = model()
  mysimulation = simulation()

  ! paramter input
  read(*, *) t, u, mu

  call mymodel%phase_set_hopping(t)

  call myenvironment%canonical%set_temperature(beta)
  call myenvironment%canonical%show_temperature()
end program main
