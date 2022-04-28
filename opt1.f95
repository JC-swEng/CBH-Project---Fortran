!This is a subroutine to the main cbh project for option 1.

SUBROUTINE opt1

  CALL SYSTEM("clear")

  CALL ldcounty
  CALL ldstate
  CALL ldvmake
  CALL ldvtype
  CALL ldcolor

  READ*
  RETURN

END SUBROUTINE opt1
