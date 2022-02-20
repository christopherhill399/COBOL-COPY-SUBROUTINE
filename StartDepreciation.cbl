       IDENTIFICATION DIVISION.
       PROGRAM-ID.   DEPRMAIN.
       AUTHOR.    CHRISTOPHER HILL.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            SELECT ASSET-INPUT-FILE ASSIGN TO 'ASSDATA.DAT'
            ORGANIZATION IS LINE SEQUENTIAL.

            SELECT ASSET-OUTPUT-FILE ASSIGN TO 'ASSETOUT.DOC'
            ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ASSET-INPUT-FILE RECORDING MODE IS F.
       01                              PICTURE X(80).

       FD  ASSET-OUTPUT-FILE RECORDING MODE IS F.
       01  PRINT-A-SINGLE-LINE         PICTURE X(132).

       WORKING-STORAGE SECTION.
       01  WORKING-VARIABLES.
           05  EOF-ASSET-WS            PICTURE X(3)     VALUE 'NO'.
           05  TOTAL-DEPR-WS           PICTURE S9(6)V99 VALUE ZERO.
           05  YEARLY-DEPR-WS          PICTURE S9(5)V99 VALUE ZERO.

       01  HOLD-DATE-WS.
           05 YEAR-WS      PIC 9999.
           05 MONTH-WS     PIC 99.
           05 DAY-WS       PIC 99.


      ***************************************************

       COPY "CPYIN.CPY".

       COPY "CPYOUT.CPY".

      ***************************************************


       01  REPORT-HEADER-LINE-SETUP.
           05                      PICTURE X       VALUE SPACES.
           05                      PICTURE X(10)   VALUE 'RUN DATE: '.
           05  REPORT-HEADER-DATE-OUT.

               10  MONTH-OUT       PICTURE 99.
               10                  PICTURE X       VALUE '/'.
               10  DAY-OUT         PICTURE 99.
               10                  PICTURE X       VALUE '/'.
               10  YEAR-OUT        PICTURE 9999.
           05                      PICTURE X(4)    VALUE SPACES.
           05                      PICTURE X(45)   VALUE
           'IRS INTERNATIONAL, INC.  AUDIT YEAR IS 2019'.


       01  COLUMN-HEADER-LINE-SETUP.
           05  FILLER              PICTURE X(4)    VALUE SPACE.
           05                      PICTURE X(4)    VALUE 'NAME'.
           05  FILLER              PICTURE X(10)   VALUE SPACES.
           05                      PICTURE X(5)    VALUE 'PRICE'.
           05  FILLER              PICTURE X(10)   VALUE SPACES.
           05                      PICTURE X(7)    VALUE 'SALVAGE'.
           05  FILLER              PICTURE X(5)    VALUE SPACES.
           05                      PICTURE X(4)    VALUE 'LIFE'.
           05  FILLER              PICTURE X(3)    VALUE SPACES.
           05                      PICTURE X(19)   VALUE
                                      'YEARLY DEPRECIATION'.
           05  FILLER              PICTURE X(5)    VALUE SPACES.


       01  ASSET-TOTAL-LINE.
           05  FILLER           PICTURE  X     VALUE SPACE.
           05                   PICTURE  X(50) VALUE
                 'TOTAL DEPRECIATION FOR ALL ASSETS IS '.
           05  TOTAL-DEPR-OUT   PICTURE  $$,$$$,$$9.99.
           05  FILLER           PICTURE  X(70) VALUE SPACES.

       PROCEDURE DIVISION.
       100-MAINLINE.
           PERFORM    200-OPEN
           PERFORM    300-PROCESS UNTIL EOF-ASSET-WS = 'YES'
           PERFORM    900-CLOSE
           STOP RUN.

       200-OPEN.
           OPEN INPUT ASSET-INPUT-FILE OUTPUT ASSET-OUTPUT-FILE
           PERFORM     250-READ-ONE-RECORD

      *******************************************************

      * TURN THIS CODE INTO A SUBROUTINE THAT YOU CALL
           CALL "RUNDATE" USING HOLD-DATE-WS, REPORT-HEADER-DATE-OUT.
      ******************************************************

           PERFORM 500-HEADER.

       250-READ-ONE-RECORD.
           READ ASSET-INPUT-FILE INTO CPYIN
              AT END MOVE 'YES' TO EOF-ASSET-WS
           END-READ.


       300-PROCESS.

           CALL "DEPRESUB" USING CPYIN, WORKING-VARIABLES.

           MOVE YEARLY-DEPR-WS TO YEARLY-DEPR-OUT
           MOVE NAME-IN        TO NAME-OUT
           MOVE PRICE-IN       TO PRICE-OUT
           MOVE SALVAGE-IN     TO SALVAGE-OUT
           MOVE USEFUL-LIFE-IN TO USEFUL-LIFE-OUT


           MOVE  CPYOUT TO PRINT-A-SINGLE-LINE
           WRITE PRINT-A-SINGLE-LINE AFTER 1 LINE
           PERFORM  250-READ-ONE-RECORD.



       500-HEADER.
           MOVE REPORT-HEADER-LINE-SETUP TO PRINT-A-SINGLE-LINE
           WRITE PRINT-A-SINGLE-LINE AFTER 1 LINE

           MOVE COLUMN-HEADER-LINE-SETUP TO PRINT-A-SINGLE-LINE
           WRITE PRINT-A-SINGLE-LINE  AFTER 2 LINES

           MOVE SPACES TO PRINT-A-SINGLE-LINE
           WRITE PRINT-A-SINGLE-LINE AFTER 1 LINE.

       900-CLOSE.
           MOVE  TOTAL-DEPR-WS  TO TOTAL-DEPR-OUT
           WRITE PRINT-A-SINGLE-LINE FROM ASSET-TOTAL-LINE AFTER PAGE
           CLOSE     ASSET-INPUT-FILE      ASSET-OUTPUT-FILE.
