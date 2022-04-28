!subroutine to opt2 to display vehicle makes and codes.

SUBROUTINE dspvmake

  INTEGER :: cRow, cColumn, cPos, numRec
  INTEGER, PARAMETER :: column_width=18, nRows=25
  CHARACTER :: LINE(25)*90, data*11

  OPEN(14, FILE= "vmake.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=11)
  READ(14, "(A4)", REC=1)numRec

! PRINT*, "number of records is", numRec

    LINE= " "
  
  CALL SYSTEM("clear") 
  WRITE(*,"(5X,A)")"* * * POLICE INFORMATION SYSTEM * * *" 
  WRITE(*,"(/,15X,A,/)")"Vehicle Makes and Codes"

  cRow=1
  cColumn= 1

  DO I= 1, numRec
    cPos= (cColumn-1)*column_width
    READ(14,"(A11)",REC=I+1) data
    LINE(cRow)(cPos+4:cPos+14)= data
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

  CLOSE (14)

  RETURN

END SUBROUTINE dspvmake
