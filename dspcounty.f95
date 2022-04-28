!subroutine to opt2 to display counties and codes.

SUBROUTINE dspcounty

  INTEGER :: cRow, cColumn, cPos, numRec
  INTEGER, PARAMETER :: column_width=18, nRows=17
  CHARACTER :: LINE(17)*90, data*12

  OPEN(10, FILE= "county.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=12)
  READ(10, "(A4)", REC=1)numRec

! PRINT*, "number of records is", numRec

    LINE= " "
  
  CALL SYSTEM("clear") 
  WRITE(*,"(5X,A)")"* * * POLICE INFORMATION SYSTEM * * *" 
  WRITE(*,"(/,13X,A,/)")"County Names and Codes"

  cRow=1
  cColumn= 1

  DO I= 1, numRec
    cPos= (cColumn-1)*column_width
    READ(10,"(A12)",REC=I+1) data
    LINE(cRow)(cPos+4:cPos+15)= data
    WRITE(LINE(cRow)(cPos+1:cPos+2),"(I2.2)")I-1
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

  CLOSE (10)

  RETURN

END SUBROUTINE dspcounty
