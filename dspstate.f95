!subroutine to opt2 to display state abrv and codes.

SUBROUTINE dspstate

  INTEGER :: cRow, cColumn, cPos
  INTEGER, PARAMETER :: column_width=10, nRows=17
  INTEGER (KIND=2) :: numRec
  CHARACTER :: LINE(17)*90, data*2

  OPEN(8, FILE= "state.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=2)
  READ(8, "(A2)", REC=1)numRec

!  PRINT*, "number of records is", numRec

    LINE= " "
  
  CALL SYSTEM("clear") 
  WRITE(*,"(5X,A)")"* * * POLICE INFORMATION SYSTEM * * *" 
  WRITE(*,"(/,9X,A,/)")"STATE CODES AND ABBREVIATIONS"

  cRow=1
  cColumn= 1

  DO I= 1, numRec
    cPos= (cColumn-1)*column_width
    READ(8,"(A2)",REC=I+1) data
    LINE(cRow)(cPos+4:cPos+5)= data
    WRITE(LINE(cRow)(cPos+1:cPos+2),"(I2.2)")I
    cRow= cRow +1
    
    IF (cRow> nRows)THEN
      cRow=1
      cColumn = cColumn+1
    END IF
  END DO

  DO I = 1, nRows
    WRITE(*,100) LINE(I)
    100 FORMAT(10X, A90)
  END DO

  CLOSE (8)

  RETURN

END SUBROUTINE dspstate
