!This is a subroutine to turn sequential county file into random access file.
!Written by Juan Carrasquilla, Section 1, 11/25/2013.

SUBROUTINE ldcounty

  INTEGER :: goodc, badc, RC, code
  CHARACTER :: data*12

  OPEN(9, FILE= "county.data")
  OPEN(10, FILE= "county.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=12)

  badc= 0
  goodc =0

  DO

    READ(9,"(I2,A12)",IOSTAT= RC) code, data
     IF (RC /= 0) EXIT
     IF (code< 0 .OR. code >67) THEN
       badc = badc + 1
       CYCLE
     END IF
    WRITE(10,"(A12)", REC=code+ 2) data
     goodc = goodc + 1
  
  END DO

    WRITE(10, "(A4)", REC= 1) goodc
    
  CLOSE (9)
  CLOSE (10)

  WRITE(*,"(10X,A,I2,T60,A,I2)") "Number of County Records Written: ", goodc, "Bad Codes: ", badc

  RETURN

END SUBROUTINE ldcounty
