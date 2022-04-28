!Subroutine to get vehicle type using code.

SUBROUTINE getvtype(vtname)
  
  USE police
  
  INTEGER :: nRecs
  CHARACTER, INTENT(out) :: vtname*11

  OPEN(16,FILE="vtype.db",ACCESS="DIRECT",FORM="FORMATTED",RECL=11)
  READ(16,"(A4)",rec=1)nRecs

  vtname= "***********"

  IF(vtcode >=0 .AND. vtcode<= nRecs)THEN
    READ(16,"(A11)",rec=vtcode+1)vtname
  END IF
  CLOSE(16)

END SUBROUTINE getvtype

