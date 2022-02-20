       IDENTIFICATION DIVISION.

       PROGRAM-ID. RUNDATE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *01  HOLD-DATE-WS.
      *    05 YEAR-WS      PIC 9999.
      *    05 MONTH-WS     PIC 99.
      *    05 DAY-WS       PIC 99.

       01  REPORT-HEADER-DATE-OUT.
           05 MONTH-OUT    PIC 99.
           05              PIC X    VALUE '/'.
           05 DAY-OUT      PIC 99.
           05              PIC X    VALUE '/'.
           05 YEAR-OUT     PIC 9999.


       LINKAGE SECTION.

       01  HOLD-DATE-LS.
           05 YEAR-LS      PIC 9999.
           05 MONTH-LS     PIC 99.
           05 DAY-LS       PIC 99.


       01  DATE-OUT-LS.
           05 MONTH-OUT-LS    PIC 99.
           05              PIC X.
           05 DAY-OUT-LS      PIC 99.
           05              PIC X.
           05 YEAR-OUT-LS     PIC 9999.



       PROCEDURE DIVISION USING HOLD-DATE-LS, DATE-OUT-LS.
       225-RUNDATE.

           MOVE FUNCTION CURRENT-DATE TO HOLD-DATE-LS

           MOVE MONTH-LS TO MONTH-OUT-LS
           MOVE DAY-LS TO DAY-OUT-LS
           MOVE YEAR-LS TO YEAR-OUT-LS

       EXIT PROGRAM.



