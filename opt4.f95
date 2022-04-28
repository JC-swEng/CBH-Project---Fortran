!This is a subroutine to the main cbh project for option 4 to add a record. 

SUBROUTINE opt4

  USE police
  IMPLICIT NONE
  INTEGER :: bsearch, SSNrec, nRecs
  CHARACTER :: ssnIn*11, ssnWant*9, YN*1, last*105, zipIn*10

  OPEN(9,FILE= "police.db",ACCESS="DIRECT",FORM= "FORMATTED",RECL=105)

  DO
    CALL SYSTEM("clear")
    WRITE(*,"(10X,A)")"* * * Police Information System Option 4- Add a Record * * *"
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter new SSN('Q' will return to main menu):"
    READ(*,"(A11)")ssnIn
    READ(9,"(A4)",rec=1)nRecs
      IF(ssnIn(4:4)== "-")THEN
        ssnWant = ssnIn(1:3) // ssnIn(5:6) // ssnIn(8:11)
      ELSE 
        ssnWant = ssnIn(1:9)
      END IF
      
      IF(ssnIn=="q" .OR. ssnIn=="Q")EXIT

    SSNrec =  bsearch(ssnWant)

    IF(SSNrec/=0)THEN
    CALL dspdata
      WRITE(*,"(/,10X,A)",ADVANCE="NO")"SSN already exists. Press Enter to continue..."
      READ*
      CYCLE
    ELSE
      ssn= ssnWant
    END IF

    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter name(last, first):"
    READ(*,"(A20)")name
  
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Street Address:"
    READ(*,"(A30)")street

    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter City:"
    READ(*,"(A19)")city

    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Zip Code:"
    READ(*,"(A10)")zipIn
      IF(zipIn(6:6)== "-")THEN
        zip = zipIn(1:5) // zipIn(7:10)
      ELSE 
        zip = zipIn(1:9)
      END IF

    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter License Plate Tag:"
    READ(*,"(A7)")tag

   CALL SYSTEM("clear")
   CALL dspstate
   DO 
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter State Code:"
    READ(*,"(I2.2)")stcode
      IF(stcode< 1 .OR. stcode> 51)THEN
        WRITE(*,"(/,10X,A)",ADVANCE="NO")"Invalid State Code. Press Enter to Continue..."
        READ*
        CYCLE
      ELSE
        EXIT
      END IF 
   END DO
   
   IF(stcode==02)THEN 
   CALL SYSTEM("clear")
   CALL dspcounty
   DO
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter County Code:"
    READ(*,"(I2.2)")ctycode
      IF(ctycode< 0 .OR. ctycode> 67)THEN
        WRITE(*,"(/,10X,A)",ADVANCE="NO")"Invalid County Code. Press Enter to Continue..."
        READ*
        CYCLE
      ELSE
        EXIT
      END IF 
   END DO
   ELSE
    ctycode=0
   END IF

   CALL SYSTEM("clear")
   CALL dspvmake
   DO
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Vehicle Make Code:"
    READ(*,"(I2.2)")vmcode
      IF(vmcode< 1 .OR. vmcode> 50)THEN
        WRITE(*,"(/,10X,A)",ADVANCE="NO")"Invalid Vehicle Make Code. Press Enter to Continue..."
        READ*
        CYCLE
      ELSE
        EXIT
      END IF 
   END DO

   CALL SYSTEM("clear")
   CALL dspvtype
   DO
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Vehicle Type Code:"
    READ(*,"(I2.2)")vtcode
      IF(vtcode< 1 .OR. vtcode> 9)THEN
        WRITE(*,"(/,10X,A)",ADVANCE="NO")"Invalid Vehicle Type Code. Press Enter to Continue..."
        READ*
        CYCLE
      ELSE
        EXIT
      END IF 
   END DO

   CALL SYSTEM("clear")
   CALL dspcolor
   DO
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Vehicle's Top Color Code:"
    READ(*,"(I2.2)")tcCode
      IF(tcCode< 1 .OR. tcCode> 30)THEN
        WRITE(*,"(/,10X,A)",ADVANCE="NO")"Invalid Color Code. Press Enter to Continue..."
        READ*
        CYCLE
      ELSE
        EXIT
      END IF 
   END DO
   DO
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Vehicle's Bottom Color Code:"
    READ(*,"(I2.2)")bcCode
      IF(bcCode< 1 .OR. bcCode> 51)THEN
        WRITE(*,"(/,10X,A)",ADVANCE="NO")"Invalid Color Code. Press Enter to Continue..."
        READ*
        CYCLE
      ELSE
        EXIT
      END IF 
   END DO

   CALL SYSTEM("clear")
   CALL dspdata

    WRITE(*,"(/,10X,A)",ADVANCE="NO")"Is this the new record you wish to add? (Y)es or (N)o:"
    READ(*,"(A1)")YN

     IF(YN=="Y" .OR. YN=="y")THEN
       WRITE(9,100,rec=nRecs+2)ssn,name,street,city,zip,&
                           stcode,ctycode,vtcode,tcCode,&
                           vmcode,bcCode,tag
        100 FORMAT(A9,A20,A30,A19,A9,I2,I2,I1,I2,I2,I2,A7)
       nRecs= nRecs +1
       WRITE(9,"(A4)",rec=1)nRecs
       CALL bubble
       WRITE(*,"(/,10X,A)",ADVANCE="NO")"Record was added. Press Enter to continue..."
       READ*
     ELSE
       WRITE(*,"(/,10X,A)",ADVANCE="NO")"Record was not added. Press Enter to continue..."
       READ*
     END IF

  END DO

  CLOSE (9)

  RETURN

END SUBROUTINE opt4
