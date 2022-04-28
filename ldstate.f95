!This is a subroutine to turn sequential state file into random access file.
!Written by Juan Carrasquilla, Section 1, 11/25/2013.

SUBROUTINE ldstate

  INTEGER :: goodc, badc, RC, code
  CHARACTER :: data*2

  OPEN(11, FILE= "state.data")
  OPEN(12, FILE= "state.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=2)

  badc= 0
  goodc =0

  DO

    READ(11,"(I2,A2)",IOSTAT= RC) code, data
     IF (RC /= 0) EXIT
     IF (code< 1 .OR. code >51) THEN
       badc = badc + 1
       CYCLE
     END IF
    WRITE(12,"(A2)", REC=code+ 1) data
     goodc = goodc + 1
  
  END DO

    WRITE(12, "(A2)", REC= 1) goodc
    
  CLOSE (11)
  CLOSE (12)

  WRITE(*,"(10X,A,I2,T60,A,I2)") "Number of State Records Written: ", goodc, "Bad Codes: ", badc

  RETURN

END SUBROUTINE ldstate
