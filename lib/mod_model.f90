module mod_model
  implicit none

  ! Qiita記事「fortranでもオブジェクト指向したい！」を参考に書きました．
  ! URL: https://qiita.com/Bluepost59/items/ca560c49a8c19484db9d#fn1

  type model_size
     private
     integer(4) :: l = 0
  contains
     procedure :: set_length => size_set_length
     procedure :: show_length => size_show_length
  end type model_size

  type model_phase
     private
     double precision :: t = .0d0
     double precision :: u = .0d0
     double precision :: mu = .0d0
   contains
     procedure :: set_hopping => phase_set_hopping
     procedure :: set_onsiteInt => phase_set_onsiteInt
     procedure :: set_chemPotential => phase_set_chemPotential
     procedure :: show_hopping => phase_show_hopping
     procedure :: show_onsiteInt => phase_show_onsiteInt
     procedure :: show_chemPotential => phase_show_chemPotential
  end type model_phase

  type model
     type(model_size) :: size
     type(model_phase) :: phase
  end type model

  interface model_size
     module procedure init_model_size
  end interface model_size

  interface model_phase
     module procedure init_model_phase
  end interface model_phase

  interface model
     module procedure init_model
  end interface model

contains

  type(model_size) function init_model_size()
  end function init_model_size

  type(model_phase) function init_model_phase()
  end function init_model_phase
  
  type(model) function init_model()
     type(model_size) :: size
     type(model_phase) :: phase

     size = model_size()
     phase = model_phase()
  end function init_model

  subroutine size_set_length(self, l)
    class(model_size) :: self
    integer(4) :: l

    self%l = l
  end subroutine size_set_length

  subroutine size_show_length(self)
    class(model_size) :: self

    write(*, *) self%l
  end subroutine size_show_length

  subroutine phase_set_hopping(self, t)
    class(model_phase) :: self
    double precision :: t

    self%t = t
  end subroutine phase_set_hopping

  subroutine phase_show_hopping(self)
    class(model_phase) :: self

    write(0, *) self%t
  end subroutine phase_show_hopping

  subroutine phase_set_onsiteInt(self, u)
    class(model_phase) :: self
    double precision :: u

    self%u = u
  end subroutine phase_set_onsiteInt

  subroutine phase_show_onsiteInt(self)
    class(model_phase) :: self

    write(0, *) self%u
  end subroutine phase_show_onsiteInt

  subroutine phase_set_chemPotential(self, mu)
    class(model_phase) :: self
    double precision :: mu

    self%mu = mu
  end subroutine phase_set_chemPotential

  subroutine phase_show_chemPotential(self)
    class(model_phase) :: self

    write(0, *) self%mu
  end subroutine phase_show_chemPotential

end module mod_model
