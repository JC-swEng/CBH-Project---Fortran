!This is a subroutine to the main cbh project for option 5 to delete a record. 

SUBROUTINE opt5

  IMPLICIT NONE
  INTEGER :: bsearch, DELrec, nRecs
  CHARACTER :: ssnIn*11, ssnWant*9, YN*1, last*105

  OPEN(9,FILE= "police.db",ACCESS="DIRECT",FORM= "FORMATTED",RECL=105)

  DO
    CALL SYSTEM("clear")
    WRITE(*,"(10X,A)")"* * * Police Information System Option 5- Delete a Record * * *"
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Search for a file to delete by SSN('Q' will return to main menu):"
    READ(*,"(A11)")ssnIn
    READ(9,"(A4)",rec=1)nRecs
      IF(ssnIn(4:4)== "-")THEN
        ssnWant = ssnIn(1:3) // ssnIn(5:6) // ssnIn(8:11)
      ELSE 
        ssnWant = ssnIn(1:9)
      END IF
      
      IF(ssnIn=="q" .OR. ssnIn=="Q")EXIT

    DELrec =  bsearch(ssnWant)

    IF(DELrec==0)THEN
      WRITE(*,"(/,10X,A)",ADVANCE="NO")"SSN does not exist. Press Enter to continue..."
      READ*
      CYCLE
    END IF
    CALL dspdata

    WRITE(*,"(/,10X,A)",ADVANCE="NO")"Is this the record you wish to delete? (Y)es or (N)o:"
    READ(*,"(A1)")YN

     IF(YN=="Y" .OR. YN=="y")THEN
       READ(9,"(A105)",rec=nRecs+1)last
       WRITE(9,"(A105)",rec=DELrec)last
       nRecs= nRecs -1
       WRITE(9,"(A4)",rec=1)nRecs
       CALL bubble
       WRITE(*,"(/,10X,A)",ADVANCE="NO")"Record was deleted. Press Enter to continue..."
       READ*
     ELSE
       WRITE(*,"(/,10X,A)",ADVANCE="NO")"Record was not deleted. Press Enter to continue..."
       READ*
     END IF

  END DO

  CLOSE (9)

  RETURN

END SUBROUTINE opt5
