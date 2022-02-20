       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE.
       AUTHOR. CHRISTOPHER HILL.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-INPUT-FILE ASSIGN TO 'EMPLOYEE.DAT'
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT EMPLOYEE-OUTPUT-FILE  ASSIGN TO 'EMPLOYEE.DOC'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLOYEE-INPUT-FILE.
       01                          PIC X(80).
       FD  EMPLOYEE-OUTPUT-FILE.
       01  PRINT-ONE-LINE          PIC X(132).

       WORKING-STORAGE SECTION.
       01 WORKING-AREAS.
           05  EOF-DATA-WS           PIC X(3)    VALUE 'NO'.
           05  LN-CNT-WS             PIC 99      VALUE ZERO.
           05  PAGE-WS               PIC 99      VALUE ZERO.
           05  FICA-RATE             PIC 9V9999  VALUE 0.0765.
           05  FICA-MAX              PIC 999999  VALUE 132900.

           05  HOLD-DATE-WS.
               10 YEAR-WS            PIC 9999.
               10 MONTH-WS           PIC 99.
               10 DAY-WS             PIC 99.
               10 HOURS-WS           PIC 99.
               10 MINUTES-WS         PIC 99.
               10 SECONDS-WS         PIC 99.


           05  FICA-CAL-WS           PIC 9(6)V99 VALUE ZERO.
           05  GROSS-WS              PIC 9(7)V99 VALUE ZERO.
           05  EXEMPT-AMT-WS         PIC 9(7)V99 VALUE ZERO.

      *********************
       COPY "EMPLOYIN.CPY".
      *********************

       01  HEADER-1ST-LN.
           05 CC1                 PIC X      VALUE SPACE.
           05 FILLER              PIC X(39)  VALUE SPACES.
           05 FILLER              PIC X(33)
              VALUE 'CAAPIRS INTERNATIONAL, INC.  2020'.
           05 FILLER              PIC X(50)  VALUE SPACE.

       01  HEADER-2ND-LN.
           05 CC2                 PIC X      VALUE SPACE.
           05 FILLER              PIC X(10)  VALUE SPACES.
           05 FILLER              PIC X(9)   VALUE 'RUN DATE:'.
           05 FILLER              PIC X      VALUE SPACE.

           05 RUN-DATE-OUT.
               10 MONTH-OUT       PIC 99.
               10 FILLER          PIC X      VALUE '/'.
               10 DAY-OUT         PIC 99.
               10 FILLER          PIC X      VALUE '/'.
               10 YEAR-OUT        PIC 9999.
               10 FILLER          PIC X      VALUE SPACE.
               10 HOURS-OUT       PIC 99.
               10 FILLER          PIC X      VALUE ':'.
               10 MINUTES-OUT     PIC 99.
               10 FILLER          PIC X      VALUE ':'.
               10 SECONDS-OUT     PIC 99.
               10 FILLER          PIC X      VALUE SPACE.

           05 FILLER              PIC X(51)  VALUE SPACES.
           05 FILLER              PIC X(4)   VALUE 'PAGE'.
           05 FILLER              PIC X(4)   VALUE SPACES.
           05 PAGE-OUT            PIC Z99    VALUE ZERO.
           05 FILLER              PIC X(20)  VALUE SPACES.


       COPY "COLHEAD.CPY".

       COPY "EMPLYOUT.CPY".


      **********************************************************


       PROCEDURE DIVISION.
       100-MAINLINE.
           PERFORM 200-OPEN
           PERFORM 300-PROCESS UNTIL EOF-DATA-WS = 'YES'
           PERFORM 900-CLOSE
           STOP RUN.

       200-OPEN.
           OPEN INPUT EMPLOYEE-INPUT-FILE
           OUTPUT EMPLOYEE-OUTPUT-FILE

           CALL "HOLDDATE" USING HOLD-DATE-WS, RUN-DATE-OUT.

           PERFORM 400-HEADER-LN
           WRITE PRINT-ONE-LINE FROM DETAIL-HEADER1-LN AFTER 2
           PERFORM 250-READ-DATA-REC.

       250-READ-DATA-REC.
           READ EMPLOYEE-INPUT-FILE INTO INPUT-DATA-REC
           AT END MOVE 'YES' TO EOF-DATA-WS
           END-READ.

       300-PROCESS.

           IF LN-CNT-WS GREATER THAN 15
               THEN PERFORM 400-HEADER-LN
               WRITE PRINT-ONE-LINE FROM DETAIL-HEADER1-LN AFTER 2
           END-IF

           MOVE GROSS-IN TO GROSS-WS

      * CONVERT THE 310 PARAGRAPH TO A SUBPROGRAM ****************
           CALL "FICATEST" USING GROSS-WS, FICA-MAX, FICA-RATE,
           FICA-CAL-WS.
      *************************************************************


      * ****CONVERT THE 405 PARAGRAPH TO A SUBPROGRAM  ************
           CALL "EXMPAMT" USING MARITAL-IN, EXEMPT-NUM-IN,
           EXEMPT-AMT-WS.
      *************************************************************

           PERFORM 410-DETAIL-PRINT
           PERFORM 250-READ-DATA-REC.




       400-HEADER-LN.
           ADD 1 TO PAGE-WS
           MOVE PAGE-WS TO PAGE-OUT
           WRITE PRINT-ONE-LINE FROM HEADER-1ST-LN AFTER PAGE
           WRITE PRINT-ONE-LINE FROM HEADER-2ND-LN AFTER 2
           MOVE ZEROS TO LN-CNT-WS.



       410-DETAIL-PRINT.
           ADD 1 TO LN-CNT-WS
           MOVE SSN-IN TO SSN-OUT
           MOVE F-INIT-IN TO F-INIT-OUT
           MOVE M-INIT-IN TO M-INIT-OUT
           MOVE LAST-IN TO LAST-OUT
           MOVE GROSS-IN TO GROSS-OUT
           MOVE WH-IN TO WH-OUT
           MOVE FICA-CAL-WS TO FICA-OUT
           MOVE MARITAL-IN TO MARITAL-OUT
           MOVE EXEMPT-NUM-IN TO EXEMPT-NUM-OUT
           MOVE EXEMPT-AMT-WS TO EXEMPT-AMT-OUT
           WRITE PRINT-ONE-LINE FROM DETAIL-LN AFTER 2
           INITIALIZE DETAIL-LN.

       900-CLOSE.
           CLOSE EMPLOYEE-INPUT-FILE
           CLOSE EMPLOYEE-OUTPUT-FILE.


