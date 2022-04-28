!Main program for the cbh project.
!Written by Juan Carrasquilla, Section 1, 11/20/2013.

PROGRAM cbhproj

  IMPLICIT NONE
  CHARACTER*1 :: opt

  DO

  CALL SYSTEM("clear")

  WRITE(*, "(10X, A)") "* * * Police Information System Main Menu * * *"
  WRITE(*,"(//,20X,A)") "1- Initial Data Load"
  WRITE(*,100) "2- Display Auxiliary Files"
  WRITE(*,100) "3- Display Records"
  WRITE(*,100) "4- Add Record"
  WRITE(*,100) "5- Delete Record"
  WRITE(*,100) "6- Update Record"
  WRITE(*,100) "7- Print Master Report"
  WRITE(*,100) "8- Exit"
  100 FORMAT(20X, A) 

  WRITE(*,200, ADVANCE= 'NO') "Enter an option number:"
  200 FORMAT(//, 15X, A)

  READ*, opt

   SELECT CASE (opt)
    CASE ("1")
      CALL SYSTEM("clear")
      WRITE(*,"(7X,A,/)")"* * * Police Information System- Initial Data Load * * *"
      CALL ldcounty
      CALL ldstate
      CALL ldvmake
      CALL ldvtype
      CALL ldcolor
      CALL ldpolice
      WRITE(*,"(/,15X,A)",ADVANCE= 'NO')"Press Enter to continue..."
      READ*
    CASE ("2")
     CALL opt2  
    CASE ("3")
     CALL opt3
    CASE ("4")
     CALL opt4
    CASE ("5")
     CALL opt5
    CASE ("6")
     CALL opt6
    CASE ("7")
     CALL opt7
    CASE ("8","Q","q","E","e")
     CALL SYSTEM("clear")
     EXIT
   END SELECT

  END DO

END PROGRAM cbhproj
