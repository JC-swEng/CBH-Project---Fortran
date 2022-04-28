!Bsearch subroutine to opt3

INTEGER FUNCTION  bsearch(ssnWant)

  USE police

  IMPLICIT NONE
  CHARACTER, INTENT(in) :: ssnWant*9
  INTEGER :: first, last, nRecs, mid
  CHARACTER :: ssnRead*9

  READ(9,"(A4)",rec=1)nRecs

  first= 2
  last= nRecs+1
  bsearch= 0

  DO
    IF(first > last)RETURN
    mid = (first + last)/2
    READ(9,"(A9)",rec=mid)ssnRead
     IF(ssnWant < ssnRead)THEN
       last = mid - 1
     ELSE IF(ssnWant > ssnRead)THEN
       first = mid + 1
     ELSE IF(ssnWant == ssnRead)THEN
       bsearch = mid
       READ(9,100,rec=mid )ssn,name,street,city,zip,&
                           stcode,ctycode,vtcode,tcCode,&
                           vmcode,bcCode,tag
100 FORMAT(A9,A20,A30,A19,A9,I2,I2,I1,I2,I2,I2,A7)
       RETURN
     END IF
  END DO


END FUNCTION bsearch
