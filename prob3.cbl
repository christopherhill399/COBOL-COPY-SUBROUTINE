       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROB3.
       AUTHOR. CHRISTOPHER HILL
       DATE-WRITTEN. SEPTEMBER 10TH 2021



       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

               SELECT USER-INPUT-FILE ASSIGN TO 'PAYROLL.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

               SELECT USER-OUTPUT-FILE ASSIGN TO 'PAYROLL.DOC'
               ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.

       FILE SECTION.
       FD  USER-INPUT-FILE RECORDING MODE IS F.
       01                              PIC X(80).

       FD  USER-OUTPUT-FILE RECORDING MODE IS F.
       01  PRINT-LINE      PIC X(132).

       WORKING-STORAGE SECTION.
       01  USER-INPUT-RECORD.
           05  SSN-IN          PIC 9(9).
           05  RATE-IN         PIC 99V99.
           05  HOURS-IN        PIC 99.
           05  NAME-IN         PIC X(20).

       01  USER-OUTPUT-RECORD.
           05  SSN-OUT         PIC 9(9).
           05  FILLER          PIC X(12) VALUE SPACES.
           05  RATE-OUT        PIC $$9.99BCR.
           05  FILLER          PIC X(12) VALUE SPACES.
           05  HOURS-OUT       PIC 9(2).
           05  FILLER          PIC X(12) VALUE SPACES.
           05  PAYCHECK-OUT    PIC $$$,$$9.99BCR.
           05  FILLER          PIC X(12) VALUE SPACES.
           05  NAME-OUT        PIC X(20).


       01  PAYCHECK-VARIABLE.
           05  PAYCHECK-WS     PIC 9(5)V99.
           05  EOF-PAYROLL-WS  PIC X(3) VALUE 'NO'.




       PROCEDURE DIVISION.

       100-MAINLINE.
           PERFORM 200-OPEN
           PERFORM 300-PROCESS UNTIL EOF-PAYROLL-WS = 'YES'
           PERFORM 900-CLOSE
           STOP RUN.


       200-OPEN.
           OPEN INPUT   USER-INPUT-FILE
           OPEN OUTPUT  USER-OUTPUT-FILE
           PERFORM      250-READ-A-RECORD.

       250-READ-A-RECORD.
           READ USER-INPUT-FILE INTO USER-INPUT-RECORD
           AT END MOVE 'YES' TO EOF-PAYROLL-WS
           END-READ.

       300-PROCESS.
      *MOVE INPUT TO OUTPUT

           MOVE  NAME-IN       TO      NAME-OUT
           MOVE  SSN-IN        TO      SSN-OUT
           MOVE  RATE-IN       TO      RATE-OUT
           MOVE  HOURS-IN      TO      HOURS-OUT

           COMPUTE  PAYCHECK-WS = RATE-IN * HOURS-IN
           MOVE     PAYCHECK-WS  TO  PAYCHECK-OUT
           DISPLAY  PAYCHECK-OUT

      *MOVE OUTPUT TO PRINT-LINE

           MOVE  USER-OUTPUT-RECORD  TO  PRINT-LINE

           WRITE  PRINT-LINE AFTER ADVANCING 1 LINE

           PERFORM 250-READ-A-RECORD.

       900-CLOSE.

           CLOSE USER-INPUT-FILE  USER-OUTPUT-FILE.








































