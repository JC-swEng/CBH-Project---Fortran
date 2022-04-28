!subroutine to opt2 to display vehicle types and codes.

SUBROUTINE dspvtype

  INTEGER :: cRow, cColumn, cPos, numRec
  INTEGER, PARAMETER :: column_width=18, nRows=9
  CHARACTER :: LINE(9)*90, data*11

  OPEN(16, FILE= "vtype.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=11)
  READ(16, "(A4)", REC=1)numRec

! PRINT*, "number of records is", numRec

    LINE= " "
  
  CALL SYSTEM("clear") 
  WRITE(*,"(5X,A)")"* * * POLICE INFORMATION SYSTEM * * *" 
  WRITE(*,"(/,13X,A,/)")"Vehicle Types and Codes"

  cRow=1
  cColumn= 1

  DO I= 1, numRec
    cPos= (cColumn-1)*column_width
    READ(16,"(A11)",REC=I+1) data
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
    100 FORMAT(14X, A80)
  END DO

  CLOSE (16)

  RETURN

END SUBROUTINE dspvtype
