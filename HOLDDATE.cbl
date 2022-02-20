       IDENTIFICATION DIVISION.
       PROGRAM-ID. HOLDDATE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  HOLD-DATE-WS.
           05 YEAR-WS            PIC 9999.
           05 MONTH-WS           PIC 99.
           05 DAY-WS             PIC 99.
           05 HOURS-WS           PIC 99.
           05 MINUTES-WS         PIC 99.
           05 SECONDS-WS         PIC 99.

       01  RUN-DATE-OUT.
           05 MONTH-OUT       PIC 99.
           05 FILLER          PIC X      VALUE '/'.
           05 DAY-OUT         PIC 99.
           05 FILLER          PIC X      VALUE '/'.
           05 YEAR-OUT        PIC 9999.
           05 FILLER          PIC X      VALUE SPACE.
           05 HOURS-OUT       PIC 99.
           05 FILLER          PIC X      VALUE ':'.
           05 MINUTES-OUT     PIC 99.
           05 FILLER          PIC X      VALUE ':'.
           05 SECONDS-OUT     PIC 99.
           05 FILLER          PIC X      VALUE SPACE.



       LINKAGE SECTION.

       01  HOLD-DATE-LS.
           05 YEAR-LS            PIC 9999.
           05 MONTH-LS           PIC 99.
           05 DAY-LS             PIC 99.
           05 HOURS-LS           PIC 99.
           05 MINUTES-LS         PIC 99.
           05 SECONDS-LS         PIC 99.


       01  RUN-DATE-LS.
           05 MONTH-OUT-LS       PIC 99.
           05 FILLER             PIC X.
           05 DAY-OUT-LS         PIC 99.
           05 FILLER             PIC X.
           05 YEAR-OUT-LS        PIC 9999.
           05 FILLER             PIC X.
           05 HOURS-OUT-LS       PIC 99.
           05 FILLER             PIC X.
           05 MINUTES-OUT-LS     PIC 99.
           05 FILLER             PIC X.
           05 SECONDS-OUT-LS     PIC 99.
           05 FILLER             PIC X.



       PROCEDURE DIVISION USING HOLD-DATE-LS, RUN-DATE-LS.
       210-DATE.

           MOVE FUNCTION CURRENT-DATE TO HOLD-DATE-LS
           MOVE YEAR-LS TO YEAR-OUT-LS
           MOVE MONTH-LS TO MONTH-OUT-LS
           MOVE DAY-LS TO DAY-OUT-LS
           MOVE HOURS-LS TO HOURS-OUT-LS
           MOVE MINUTES-LS TO MINUTES-OUT-LS
           MOVE SECONDS-LS TO SECONDS-OUT-LS.


           EXIT PROGRAM.

