!This is a sort bubble subroutine to ldpolice.f95 

SUBROUTINE bubble

  LOGICAL :: sort
  CHARACTER :: string1*105, string2*105
  INTEGER :: pass, nRecs, I

  pass= 1
 
  READ(9,"(A4)",rec=1)nRecs

  sort= .FALSE.

  DO
    IF(sort .EQV. .TRUE.) EXIT
    sort= .TRUE.

     DO I= 2, nRecs- pass+1
       READ(9,"(A105)",rec= I)string1
       READ(9,"(A105)",rec= I+1)string2
        IF(string1(1:9)<string2(1:9))CYCLE
       WRITE(9,"(A105)",rec= I+1)string1
       WRITE(9,"(A105)",rec= I)string2
       sort= .FALSE.
     END DO

  pass= pass +1

  END DO

END SUBROUTINE bubble
