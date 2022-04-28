!Subroutine to get county using code.

SUBROUTINE getcounty(ctyname)
  
  USE police
  
  INTEGER :: nRecs
  CHARACTER, INTENT(out) :: ctyname*12

  OPEN(18,FILE="county.db",ACCESS="DIRECT",FORM="FORMATTED",RECL=12)
  READ(18,"(A4)",rec=1)nRecs

  ctyname= "************"

  IF(ctycode >=0 .AND. ctycode<= nRecs+1)THEN
    READ(18,"(A12)",rec=ctycode+2)ctyname
  END IF
  CLOSE(18)

END SUBROUTINE getcounty

