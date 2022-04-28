!This is a subroutine to turn sequential vehicle type file into random access file.
!Written by Juan Carrasquilla, Section 1, 11/25/2013.

SUBROUTINE ldvtype

  INTEGER :: goodc, badc, RC, code
  CHARACTER :: data*11

  OPEN(15, FILE= "vtype.data")
  OPEN(16, FILE= "vtype.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=11)

  badc= 0
  goodc =0

  DO

    READ(15,"(I1,A11)",IOSTAT= RC) code, data
     IF (RC /= 0) EXIT
     IF (code< 1 .OR. code >9) THEN
       badc = badc + 1
       CYCLE
     END IF
    WRITE(16,"(A11)", REC=code+ 1) data
     goodc = goodc + 1
  
  END DO

    WRITE(16, "(A4)", REC= 1) goodc
    
  CLOSE (15)
  CLOSE (16)

  WRITE(*,"(10X, A, I2, T60, A, I2)") "Number of Vehicle Type Records Written: ", goodc, "Bad Codes: ", badc

  RETURN

END SUBROUTINE ldvtype
