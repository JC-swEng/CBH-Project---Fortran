!Subroutine to get color using code.

SUBROUTINE getcolor(tcName,bcName)
  
  USE police
  
  INTEGER :: nRecs
  CHARACTER, INTENT(out) :: tcName*9, bcName*9

  OPEN(15,FILE="color.db",ACCESS="DIRECT",FORM="FORMATTED",RECL=9)
  READ(15,"(A4)",rec=1)nRecs

  tcName= "*********"
  bcName= "*********"

  IF(tcCode >=1 .AND. tcCode<= nRecs)THEN
    READ(15,"(A9)",rec=tcCode+1)tcName
  END IF

  IF(bcCode >=1 .AND. bcCode<= nRecs)THEN
    READ(15,"(A9)",rec=bcCode+1)bcName
  END IF

  CLOSE(15)

END SUBROUTINE getcolor

