       IDENTIFICATION DIVISION.

       PROGRAM-ID. DEPRESUB.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CPYIN.
           05  NAME-IN          PIC X(10).
           05  PRICE-IN         PIC S9(5)V99.
           05  SALVAGE-IN       PIC S9(5)V99.
           05  USEFUL-LIFE-IN   PIC 99.

       01  WORKING-VARIABLES.
           05  TOTAL-DEPR-WS    PIC S9(6)V99 VALUE ZERO.
           05  YEARLY-DEPR-WS   PIC S9(5)V99 VALUE ZERO.




       LINKAGE SECTION.
       01  WORKING-VARIABLES-LS.
           05  TOTAL-DEPR-LS    PIC S9(6)V99.

       01  CPYIN-LS.
           05  NAME-IN-LS          PIC X(10).
           05  PRICE-IN-LS         PIC S9(5)V99.
           05  SALVAGE-IN-LS       PIC S9(5)V99.
           05  USEFUL-LIFE-IN-LS   PIC 99.
           05  YEARLY-DEPR-LS      PIC S9(5)V99.




       PROCEDURE DIVISION USING CPYIN-LS, WORKING-VARIABLES-LS.
       400-CALCULATE-DEPRECIATION.
           COMPUTE YEARLY-DEPR-LS = (PRICE-IN-LS - SALVAGE-IN-LS)
                   / USEFUL-LIFE-IN-LS

           ADD   YEARLY-DEPR-LS  TO  TOTAL-DEPR-LS.

           EXIT PROGRAM.
