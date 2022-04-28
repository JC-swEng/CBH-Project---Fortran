#
#Makefile for cbhproj
#
CC=f95
CFLAGS=
OBJ= cbhproj.o police.o ldstate.o ldcounty.o ldvmake.o ldvtype.o ldcolor.o \
    opt2.o opt3.o dspstate.o ldpolice.o bubble.o dspcounty.o dspvmake.o \
    dspvtype.o dspcolor.o bsearch.o dspdata.o getstate.o getcounty.o \
    getvmake.o getvtype.o getcolor.o opt5.o opt4.o opt6.o opt7.o

cbhproj:  $(OBJ)
	$(CC) -o cbhproj $(OBJ)

police.o: police.f95
	$(CC) $(CFLAGS) -c police.f95

cbhproj.o: cbhproj.f95
	$(CC) $(CFLAGS) -c cbhproj.f95

ldstate.o: ldstate.f95
	$(CC) $(CFLAGS) -c ldstate.f95

ldcounty.o: ldcounty.f95
	$(CC) $(CFLAGS) -c ldcounty.f95

ldvmake.o: ldvmake.f95
	$(CC) $(CFLAGS) -c ldvmake.f95

ldvtype.o: ldvtype.f95
	$(CC) $(CFLAGS) -c ldvtype.f95

ldcolor.o: ldcolor.f95
	$(CC) $(CFLAGS) -c ldcolor.f95

ldpolice.o: ldpolice.f95
	$(CC) $(CFLAGS) -c ldpolice.f95

bubble.o: bubble.f95
	$(CC) $(CFLAGS) -c bubble.f95

opt2.o: opt2.f95
	$(CC) $(CFLAGS) -c opt2.f95

opt3.o: opt3.f95
	$(CC) $(CFLAGS) -c opt3.f95

dspstate.o: dspstate.f95
	$(CC) $(CFLAGS) -c dspstate.f95

dspcounty.o: dspcounty.f95
	$(CC) $(CFLAGS) -c dspcounty.f95

dspvmake.o: dspvmake.f95
	$(CC) $(CFLAGS) -c dspvmake.f95

dspvtype.o: dspvtype.f95
	$(CC) $(CFLAGS) -c dspvtype.f95

dspcolor.o: dspcolor.f95
	$(CC) $(CFLAGS) -c dspcolor.f95

bsearch.o: bsearch.f95
	$(CC) $(CFLAGS) -c bsearch.f95

dspdata.o: dspdata.f95
	$(CC) $(CFLAGS) -c dspdata.f95

getstate.o: getstate.f95
	$(CC) $(CFLAGS) -c getstate.f95

getcounty.o: getcounty.f95
	$(CC) $(CFLAGS) -c getcounty.f95

getvmake.o: getvmake.f95
	$(CC) $(CFLAGS) -c getvmake.f95

getvtype.o: getvtype.f95
	$(CC) $(CFLAGS) -c getvtype.f95

getcolor.o: getcolor.f95
	$(CC) $(CFLAGS) -c getcolor.f95

opt5.o: opt5.f95
	$(CC) $(CFLAGS) -c opt5.f95

opt4.o: opt4.f95
	$(CC) $(CFLAGS) -c opt4.f95

opt6.o: opt6.f95
	$(CC) $(CFLAGS) -c opt6.f95

opt7.o: opt7.f95
	$(CC) $(CFLAGS) -c opt7.f95

clean:
	rm cbhproj *.o *.db core jscarrasquilla.tar jscarrasquilla.tar.gz
