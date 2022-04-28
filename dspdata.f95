!Displays all info for a person.

SUBROUTINE dspdata

  USE police
  
  CHARACTER :: stname*2, ctyname*12, vmname*11, vtname*11, tcName*9, bcName*9

  CALL getstate(stname)
  CALL getcounty(ctyname)
  CALL getvmake(vmname)
  CALL getvtype(vtname)
  CALL getcolor(tcName, bcName)

  WRITE(*,"(/,15X,A,/)")"***Personal Record Information***"
  WRITE(*,"(7X,A,T35,A3,A,A2,A,A4)")"Social Security Number: ", ssn(1:3), "-", ssn(4:5), "-", ssn(6:9)
  WRITE(*,"(7X,A,T35,A20)")"Name(Last, First): ", name
  WRITE(*,"(7X,A,T35,A30)")"Street Address: ", street
  WRITE(*,"(7X,A,T35,A19)")"City: ", city
  WRITE(*,"(7X,A,T35,A,I2.2,A2,A12)")"County:","(", ctycode, ") ", ctyname
  WRITE(*,"(7X,A,T35,A,I2.2,A2,A2)")"State: ","(", stcode, ") ", stname
  WRITE(*,"(7X,A,T35,A5,A1,A4)")"Zip Code: ",zip(1:5),"-",zip(6:9)

  WRITE(*,"(/,15X,A,/)")"***Vehicle Record Information***"
  WRITE(*,"(7X,A,T35,A,I2.2,A2,A11)")"Vehicle Make: ","(", vmcode, ") ", vmname
  WRITE(*,"(7X,A,T35,A,I2.2,A2,A11)")"Vehicle Type: ","(", vtcode, ") ", vtname
  WRITE(*,"(7X,A,T35,A,I2.2,A2,A9)")"Top Color: ","(", tcCode, ") ", tcName
  WRITE(*,"(7X,A,T35,A,I2.2,A2,A9)")"Bottom Color: ","(", bcCode, ") ", bcName
  WRITE(*,"(7X,A,T35,A7)")"License Plate Tag: ", tag

END SUBROUTINE dspdata
  
