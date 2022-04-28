!Subroutine to get state using code.

SUBROUTINE getstate(stname)
  
  USE police
  
  INTEGER(KIND=2) :: nRecs
  CHARACTER, INTENT(out) :: stname*2

  OPEN(8,FILE="state.db",ACCESS="DIRECT",FORM="FORMATTED",RECL=2)
  READ(8,"(A2)",rec=1)nRecs

  stname= "**"

  IF(stcode >=1 .AND. stcode<= nRecs)THEN
    READ(8,"(A2)",rec=stcode+1)stname
  END IF
  CLOSE(8)

END SUBROUTINE getstate

