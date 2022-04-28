!This is a subroutine to opt1 load the master police files.

SUBROUTINE ldpolice

  CHARACTER :: p1*3, p2*2,p3*78,p4*22
  INTEGER :: RC, nRecs

  OPEN(7, FILE="police1.data")
  OPEN(8, FILE="police2.data")
  OPEN(9, FILE= "police.db", ACCESS= "DIRECT",FORM= "FORMATTED", RECL=105)

  nRecs= 0

  DO
    READ(7,100,IOSTAT=RC)p1,p2,p3,p4
    IF(RC /= 0) EXIT
    nRecs = nRecs + 1
    WRITE(9, 200, rec= nRecs +1)p1,p2,p3,p4
     100 FORMAT(A3,1X,A2,1X,A78,1X,A22)
     200 FORMAT(A3,A2,A78,A22)
  END DO

  CLOSE(7)

  DO
    READ(8,100,IOSTAT=RC)p1,p2,p3,p4
    IF(RC /= 0) EXIT
    nRecs = nRecs + 1
    WRITE(9, 200, rec= nRecs +1)p1,p2,p3,p4
  END DO

  CLOSE(8)

  WRITE(9,"(A4)",rec=1)nRecs

  CALL bubble

  CLOSE(9)

  WRITE(*,"(/,15X,A)")"Loading records..."
  WRITE(*,"(/,10X,I2,A)")nRecs, " records were processed."

END SUBROUTINE ldpolice
