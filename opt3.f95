!This is a subroutine to the main cbh project for option 3 to search for a SSN and display the information. 

SUBROUTINE opt3

  IMPLICIT NONE
  INTEGER :: bsearch, SSNrec
  CHARACTER :: ssnIn*11, ssnWant*9

  OPEN(9,FILE= "police.db",ACCESS="DIRECT",FORM= "FORMATTED",RECL=105)

  DO
    CALL SYSTEM("clear")
    WRITE(*,"(10X,A)")"* * * Police Information System Option 3 * * *"
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Search for a file by SSN('Q' will return to main menu):"
    READ(*,"(A11)")ssnIn
      IF(ssnIn(4:4)== "-")THEN
        ssnWant = ssnIn(1:3) // ssnIn(5:6) // ssnIn(8:11)
      ELSE 
        ssnWant = ssnIn(1:9)
      END IF
      
      IF(ssnIn=="q" .OR. ssnIn=="Q")EXIT

    SSNrec =  bsearch(ssnWant)
   
    IF(SSNrec==0)THEN
      WRITE(*,"(/,10X,A)",ADVANCE="NO")"SSN not found in records. Press Enter to continue..."
      READ*
    CYCLE
    END IF
    CALL dspdata

    WRITE(*,"(/,10X,A)",ADVANCE="NO")"Press Enter to continue..."
    READ*
  END DO

  CLOSE (9)

  RETURN

END SUBROUTINE opt3
