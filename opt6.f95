!This is a subroutine to the main cbh project for option 6 to update a record. 

SUBROUTINE opt6

  USE police
  IMPLICIT NONE
  INTEGER :: bsearch, SSNrec, nRecs, SSNrec2
  CHARACTER :: ssnIn*11, ssnWant*9, YN*1, last*105, zipIn*10, opt*2, ssnWant2*9, ssnIn2*11

  OPEN(9,FILE= "police.db",ACCESS="DIRECT",FORM= "FORMATTED",RECL=105)

  DO
    CALL SYSTEM("clear")
    WRITE(*,"(10X,A)")"* * * Police Information System Option 6- Update a Record * * *"
    WRITE(*,"(/,15X,A)",ADVANCE="NO")"Search for a record to update by SSN('Q' will return to main menu):"
    READ(*,"(A11)")ssnIn
    READ(9,"(A4)",rec=1)nRecs
      IF(ssnIn(4:4)== "-")THEN
        ssnWant = ssnIn(1:3) // ssnIn(5:6) // ssnIn(8:11)
      ELSE 
        ssnWant = ssnIn(1:9)
      END IF
      
      IF(ssnIn=="q" .OR. ssnIn=="Q")EXIT

    SSNrec =  bsearch(ssnWant)

   DO
    IF(SSNrec/=0)THEN
    CALL SYSTEM("clear")
    WRITE(*,"(10X,A,/)")"* * * Police Information System Option 6- Update a Record * * *"
    CALL dspdata
      WRITE(*,"(/,T10,A,T30,A,T50,A,T70,A)")"1. SSN",   "4. City",   "7. Zip Code",  "10. Top Color"
      WRITE(*,"(T10,A,T30,A,T50,A,T70,A)")"2. Name",   "5. County",  "8. Vehicle Make",  "11. Bottom Color"
      WRITE(*,"(T10,A,T30,A,T50,A,T70,A)")"3. Street Address","6. State","9. Vehicle Type","12. License Plate Tag"
      WRITE(*,"(/,10X,A)",ADVANCE="NO")"Enter a number to edit,'S' to Save, or 'C' to Cancel:"
      READ(*,"(A2)")opt
    ELSE
      WRITE(*,"(/,15X,A)",ADVANCE="NO")"Record does not exist. Press Enter to continue..."
      READ*
      EXIT
    END IF

   SELECT CASE(opt)
    
    CASE("1")
      WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter SSN:"
      READ(*,"(A11)")ssnIn2
       IF(ssnIn2(4:4)== "-")THEN
        ssnWant2 = ssnIn2(1:3) // ssnIn2(5:6) // ssnIn2(8:11)
       ELSE 
        ssnWant2 = ssnIn2(1:9)
       END IF

    SSNrec2 =  bsearch(ssnWant2)
      IF(SSNrec2/=0)THEN
       WRITE(*,"()",ADVANCE="NO")"SSN already exists. Press Enter to continue..."
       READ*
      ELSE
       ssn= ssnWant2
      END IF
      
    CASE("2")
      WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter name(last, first):"
      READ(*,"(A20)")name

    CASE("3")
      WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Street Address:"
      READ(*,"(A30)")street

    CASE("4")
      WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter City:"
      READ(*,"(A19)")city

    CASE("7")
      WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter Zip Code:"
      READ(*,"(A10)")zipIn
      IF(zipIn(6:6)== "-")THEN
        zip = zipIn(1:5) // zipIn(7:10)
      ELSE 
        zip = zipIn(1:9)
      END IF

    CASE("12")
      WRITE(*,"(/,15X,A)",ADVANCE="NO")"Enter License Plate Tag:"
      READ(*,"(A7)")tag

    CASE("6")
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
   
    CASE("5")
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

    CASE("8")
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

    CASE("9")
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

    CASE("10")
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

    CASE("11")
     CALL SYSTEM("clear")
     CALL dspcolor
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

    CASE("S","s")
         WRITE(9,100,rec=SSNrec)ssn,name,street,city,zip,&
                           stcode,ctycode,vtcode,tcCode,&
                           vmcode,bcCode,tag
          100 FORMAT(A9,A20,A30,A19,A9,I2,I2,I1,I2,I2,I2,A7)
         WRITE(9,"(A4)",rec=1)nRecs
         
         IF(SSNrec2==0) CALL bubble
     
         WRITE(*,"(/,10X,A)",ADVANCE="NO")"Record updated. Press Enter to continue..."
         READ*
         EXIT
     CASE("C","c")
         WRITE(*,"(/,10X,A)",ADVANCE="NO")"Record was not updated. Press Enter to continue..."
         READ*
         EXIT
     END SELECT
   END DO
  END DO

  CLOSE (9)

  RETURN

END SUBROUTINE opt6
