       IDENTIFICATION DIVISION.
       PROGRAM-ID. FICATEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  GROSS-WS              PIC 9(7)V99 VALUE ZERO.
       01  FICA-MAX              PIC 999999  VALUE 132900.
       01  FICA-RATE             PIC 9V9999  VALUE 0.0765.
       01  FICA-CAL-WS           PIC 9(6)V99 VALUE ZERO.


       LINKAGE SECTION.

       01  GROSS-LS              PIC 9(7)V99.
       01  FICA-MAX-LS           PIC 999999.
       01  FICA-RATE-LS          PIC 9V9999.
      *01  FICA-CAL-LS           PIC 9(6)V99.

       PROCEDURE DIVISION USING GROSS-LS, FICA-MAX-LS, FICA-RATE-LS,
       FICA-CAL-WS.
       315-FICA-TEST.
           IF GROSS-LS > FICA-MAX-LS
              MOVE FICA-MAX-LS TO GROSS-LS
           END-IF

           COMPUTE FICA-CAL-WS = GROSS-LS * FICA-RATE-LS.



           EXIT PROGRAM.

