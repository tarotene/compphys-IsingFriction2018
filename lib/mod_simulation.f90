module mod_simulation
  implicit none

  ! Qiita記事「fortranでもオブジェクト指向したい！」を参考に書きました．
  ! URL: https://qiita.com/Bluepost59/items/ca560c49a8c19484db9d#fn1

  type simulation
     private
     integer(4) :: mctime = 0
   contains
     procedure :: set_mctime => simulation_set_mctime

     procedure :: show_mctime => simulation_show_mctime
  end type simulation

  interface simulation
     module procedure init_simulation
  end interface simulation

contains

  type(simulation) function init_simulation()
  end function init_simulation

  subroutine simulation_set_mctime(self, mctime)
    class(simulation) :: self
    integer(4) :: mctime

    self%mctime = mctime
  end subroutine simulation_set_mctime

  subroutine simulation_show_mctime(self)
    class(simulation) :: self

    write(0, *) self%mctime
  end subroutine simulation_show_mctime

end module mod_simulation
