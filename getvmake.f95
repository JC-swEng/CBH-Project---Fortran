!Subroutine to get vmake using code.

SUBROUTINE getvmake(vmname)
  
  USE police
  
  INTEGER :: nRecs
  CHARACTER, INTENT(out) :: vmname*11

  OPEN(17,FILE="vmake.db",ACCESS="DIRECT",FORM="FORMATTED",RECL=11)
  READ(17,"(A4)",rec=1)nRecs

  vmname= "***********"

  IF(vmcode >=1 .AND. vmcode<= nRecs)THEN
    READ(17,"(A11)",rec=vmcode+1)vmname
  END IF
  CLOSE(17)

END SUBROUTINE getvmake

