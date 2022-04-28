!subroutine to opt2 to display vehicle colors and codes.

SUBROUTINE dspcolor

  INTEGER :: cRow, cColumn, cPos, numRec
  INTEGER, PARAMETER :: column_width=16, nRows=15
  CHARACTER :: LINE(15)*90, data*9

  OPEN(10, FILE= "color.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=9)
  READ(10, "(A4)", REC=1)numRec

! PRINT*, "number of records is", numRec

    LINE= " "
  CALL SYSTEM("clear") 
  WRITE(*,"(5X,A)")"* * * POLICE INFORMATION SYSTEM * * *" 
  WRITE(*,"(/,13X,A,/)")"Vehicle Colors and Codes"

  cRow=1
  cColumn= 1

  DO I= 1, numRec
    cPos= (cColumn-1)*column_width
    READ(10,"(A9)",REC=I+1) data
    LINE(cRow)(cPos+4:cPos+13)= data
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

  CLOSE (10)

  RETURN

END SUBROUTINE dspcolor
