!This is a subroutine to turn sequential color file into random access file.
!Written by Juan Carrasquilla, Section 1, 11/25/2013.

SUBROUTINE ldcolor

  INTEGER :: goodc, badc, RC, code
  CHARACTER :: data*9

  OPEN(7, FILE= "color.data")
  OPEN(8, FILE= "color.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=9)

  badc= 0
  goodc =0

  DO

    READ(7,"(I2,A9)",IOSTAT= RC) code, data
     IF (RC /= 0) EXIT
     IF (code< 1 .OR. code >30) THEN
       badc = badc + 1
       CYCLE
     END IF
    WRITE(8,"(A9)", REC=code+ 1) data
     goodc = goodc + 1
  
  END DO

    WRITE(8, "(A4)", REC= 1) goodc
    
  CLOSE (7)
  CLOSE (8)

  WRITE(*,"(10X,A,I2,T60,A,I2)") "Number of Color Records Written: ", goodc, "Bad Codes: ", badc

END SUBROUTINE ldcolor
