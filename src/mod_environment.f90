module mod_environment
  implicit none

  ! Qiita記事「fortranでもオブジェクト指向したい！」を参考に書きました．
  ! URL: https://qiita.com/Bluepost59/items/ca560c49a8c19484db9d#fn1

  type environment_canonical
     private
     double precision :: beta = .0d0
  contains
     procedure :: set_temperature => canonical_set_temperature
     procedure :: show_temperature => canonical_show_temperature
  end type environment_canonical

  type environment_grandCanonical
  ! To be implemented
     private
     double precision :: beta = .0d0
     double precision :: mu = .0d0
  contains
     procedure :: set_temperature => grandCanonical_set_temperature
     procedure ::set_chemPotential => grandCanonical_set_chemPotential

     procedure :: show_temperature => grandCanonical_show_temperature
     procedure ::show_chemPotential => grandCanonical_show_chemPotential
  end type environment_grandCanonical

  type environment
  ! TODO: 戻り値の総称型を使ってgrandCanonicalも呼び出せるようにする．
     type(environment_canonical) :: canonical
  end type environment

  interface environment_canonical
     module procedure init_environment_canonical
  end interface environment_canonical

  interface environment_grandCanonical
     module procedure init_environment_grandCanonical
  end interface environment_grandCanonical

  interface environment
     module procedure init_environment
  end interface environment

contains

  type(environment_canonical) function init_environment_canonical()
  end function init_environment_canonical

  type(environment_canonical) function init_environment_grandCanonical()
  end function init_environment_grandCanonical
  
  type(environment) function init_environment()
     type(environment_canonical) :: canonical

     canonical = environment_canonical()
  end function init_environment

  subroutine canonical_set_temperature(self, beta)
    class(environment_canonical) self
    double precision beta

    self%beta = beta
  end subroutine canonical_set_temperature

  subroutine canonical_show_temperature(self)
    class(environment_canonical) self

    write(0, *) self%beta
  end subroutine canonical_show_temperature

  subroutine grandCanonical_set_temperature(self, beta)
    class(environment_grandCanonical) self
    double precision beta

    self%beta = beta
  end subroutine grandCanonical_set_temperature
  
  subroutine grandCanonical_set_chemPotential(self, mu)
    class(environment_grandCanonical) self
    double precision mu

    self%mu = mu
  end subroutine grandCanonical_set_chemPotential

  subroutine grandCanonical_show_temperature(self)
    class(environment_grandCanonical) self

    write(0, *) self%beta
  end subroutine grandCanonical_show_temperature

  subroutine grandCanonical_show_chemPotential(self)
    class(environment_grandCanonical) self

    write(0, *) self%mu
  end subroutine grandCanonical_show_chemPotential
end module mod_environment
