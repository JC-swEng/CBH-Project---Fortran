!This is a subroutine to the main cbh project for option 2. It is a submenu.

SUBROUTINE opt2

  CHARACTER :: opt*1

  Do
   CALL SYSTEM("clear")

  WRITE(*, "(10X, A,//)") "* * * Police Information System- Display Files Menu * * *"
  WRITE(*,100) "1- Display County File" 
  WRITE(*,100) "2- Display State File"
  WRITE(*,100) "3- Display Vehicle Make File"
  WRITE(*,100) "4- Display Vehicle Type File"
  WRITE(*,100) "5- Display Color File"
  WRITE(*,100) "6- Return to Main Menu"
  100 FORMAT(20X, A) 

  WRITE(*,"(//,20X,A)",ADVANCE= 'NO') "Enter an option number:"

  READ(*,"(A1)") opt
 

   SELECT CASE (opt)
    CASE ("1")
     CALL dspcounty
    CASE ("2")
     CALL dspstate
    CASE ("3")
     CALL dspvmake
    CASE ("4")
    CALL dspvtype
    CASE ("5")
     CALL dspcolor
    CASE ("6","Q","q","E","e")
     CALL SYSTEM("clear")
     EXIT
     
   END SELECT

  WRITE(*,"(/,15X,A)",ADVANCE="NO")"Press Enter to continue..."
  READ*

  END DO

END SUBROUTINE opt2
