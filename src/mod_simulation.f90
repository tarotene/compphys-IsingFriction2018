module mod_model
  implicit none

  ! Qiita記事「fortranでもオブジェクト指向したい！」を参考に書きました．
  ! URL: https://qiita.com/Bluepost59/items/ca560c49a8c19484db9d#fn1

  type model
     private
     real(8) :: t = .0d0
     real(8) :: u = .0d0
     real(8) :: mu = .0d0
   contains
     procedure :: set_hopping => model_set_hopping
     procedure :: set_onsiteInt => model_set_onsiteInt
     procedure :: set_chemPotential => model_set_chemPotential

     procedure :: show_hopping => model_show_hopping
     procedure :: show_onsiteInt => model_show_onsiteInt
     procedure :: show_chemPotential => model_show_chemPotential
  end type model

  interface model
     module procedure init_model
  end interface model

contains

  type(model) function init_model()
    write(0, *) "model instance generated"
  end function init_model

  subroutine model_set_hopping(self, t)
    class(model) self
    double precision t

    self%t = t
  end subroutine model_set_hopping

  subroutine model_show_hopping(self)
    class(model) self

    write(0, *) self%t
  end subroutine model_show_hopping

  subroutine model_set_onsiteInt(self, u)
    class(model) self
    double precision u

    self%u = u
  end subroutine model_set_onsiteInt

  subroutine model_show_onsiteInt(self)
    class(model) self

    write(0, *) self%u
  end subroutine model_show_onsiteInt

  subroutine model_set_chemPotential(self, mu)
    class(model) self
    double precision mu

    self%mu = mu
  end subroutine model_set_chemPotential

  subroutine model_show_chemPotential(self)
    class(model) self

    write(0, *) self%mu
  end subroutine model_show_chemPotential

end module mod_model
