!This is a subroutine to turn sequential vehicle make file into random access file.
!Written by Juan Carrasquilla, Section 1, 11/25/2013.

SUBROUTINE ldvmake

  INTEGER :: goodc, badc, RC, code
  CHARACTER :: data*11

  OPEN(13, FILE= "vmake.data")
  OPEN(14, FILE= "vmake.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=11)

  badc= 0
  goodc =0

  DO

    READ(13,"(I2,A11)",IOSTAT= RC) code, data
     IF (RC /= 0) EXIT
     IF (code< 1 .OR. code >50) THEN
       badc = badc + 1
       CYCLE
     END IF
    WRITE(14,"(A11)", REC=code+ 1) data
     goodc = goodc + 1
  
  END DO

    WRITE(14, "(A4)", REC= 1) goodc
    
  CLOSE (13)
  CLOSE (14)

  WRITE(*,"(10X,A,I2,T60,A,I2)") "Number of Vehicle Make Records Written: ", goodc, "Bad Codes: ", badc


  RETURN

END SUBROUTINE ldvmake
