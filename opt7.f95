!This is a subroutine to the main cbh project for option 1.

SUBROUTINE opt7

  USE police
  INTEGER :: nRecs, I, remainder
  CHARACTER :: stname*2, ctyname*12, vmname*11, vtname*11, tcName*9, bcName*9

  OPEN(9,FILE="police.db", ACCESS="DIRECT",FORM="FORMATTED",RECL=105)
  READ(9,"(A4)",rec=1)nRecs

    CALL SYSTEM("clear")
    WRITE(*,100)"SSN","Street Address","County","Vehicle Make","Top Color","Tag"
    100 FORMAT(T3,A,T17,A,T52,A,T72,A,T94,A,T112,A)
    WRITE(*,150)"Name","City","State","Zip Code","Vehicle Type","Bottom Color"
    150 FORMAT(T3,A,T28,A,T48,A,T55,A,T72,A,T94,A)
    WRITE(*,"(A,A)")"========================================================================================================",&
                    "==============="

  DO I= 2, nRecs+1
 

    READ(9,200,rec=I)ssn,name,street,city,zip,stcode,ctycode,vtcode,tcCode,vmcode,bcCode,tag
    200 FORMAT(A9,A20,A30,A19,A9,I2,I2,I1,I2,I2,I2,A7)
    
    CALL getstate(stname)
    CALL getcounty(ctyname)
    CALL getvmake(vmname)
    CALL getvtype(vtname)
    CALL getcolor(tcName, bcName)

    WRITE(*,300)ssn(1:3),"-",ssn(4:5),"-",ssn(6:9),street,"(",ctycode,") ",ctyname,"(",vmcode,") ",vmname,"(",tcCode,") ",tcName,tag
    WRITE(*,400)name,city,"(",stcode,") ",stname,zip(1:5),"-",zip(6:9),"(",vtcode,") ",vtname,"(",bcCode,") ",bcName
    300 FORMAT(/,2X,A3,A,A2,A,A4,3X,A30,T50,A,I2.2,A,A12,T72,A,I2.2,A,A11,T94,A,I2.2,A,A9,T110,A7)
    400 FORMAT(2X,A20,T28,A19,T45,A,I2.2,A,A2,3X,A5,A,A4,T72,A,I2.2,A,A11,T94,A,I2.2,A,A9)

    remainder=MOD(I-1,7)
    IF(I == nRecs+1 .AND. remainder==0)THEN
      WRITE(*,"(//,T20,A)", ADVANCE="NO")"End of file. Press Enter to continue..."
      READ* 
    ELSE IF(remainder==0)THEN
      WRITE(*,"(//,T20,A)", ADVANCE="NO")"Press Enter to continue..."
      READ*
      CALL SYSTEM("clear")
      WRITE(*,100)"SSN","Street Address","County","Vehicle Make","Top Color","Tag"
      WRITE(*,150)"Name","City","State","Zip Code","Vehicle Type","Bottom Color"
      WRITE(*,"(A,A)")"========================================================================================================",&
                      "==============="
    ELSE IF(I == nRecs+1)THEN
      WRITE(*,"(//,T20,A)", ADVANCE="NO")"End of file. Press Enter to continue..."
      READ*
    END IF

  END DO

  RETURN

END SUBROUTINE opt7
