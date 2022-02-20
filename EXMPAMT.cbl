       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXMPAMT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  MARITAL-IN           PIC X.
       01  EXEMPT-NUM-IN        PIC 99.
       01  EXEMPT-AMT-WS        PIC 9(7)V99 VALUE ZERO.



       LINKAGE SECTION.

       01  MARITAL-IN-LS        PIC X.
       01  EXEMPT-NUM-IN-LS     PIC 99.
       01  EXEMPT-AMT-LS        PIC 9(7)V99.


       PROCEDURE DIVISION USING MARITAL-IN-LS, EXEMPT-NUM-IN-LS,
       EXEMPT-AMT-LS.

       405-EXEMPTION-AMOUNT.
           IF MARITAL-IN-LS = 'S'  AND  EXEMPT-NUM-IN-LS = 1
           THEN COMPUTE EXEMPT-AMT-LS =  EXEMPT-NUM-IN-LS * 500.00
           END-IF

           IF MARITAL-IN-LS = 'M'  AND EXEMPT-NUM-IN-LS = 2
           THEN  COMPUTE EXEMPT-AMT-LS =  EXEMPT-NUM-IN-LS * 400.00
           END-IF

           IF (EXEMPT-NUM-IN-LS >= 2 AND <= 4) AND MARITAL-IN-LS = 'S'
           THEN COMPUTE EXEMPT-AMT-LS =  EXEMPT-NUM-IN-LS * 1000.00
           END-IF

           IF (EXEMPT-NUM-IN-LS >= 3 AND <= 5) AND  MARITAL-IN-LS = 'M'
           THEN COMPUTE EXEMPT-AMT-LS =  EXEMPT-NUM-IN-LS * 800.00
           END-IF

           IF (EXEMPT-NUM-IN-LS >= 5 AND <= 7) AND MARITAL-IN-LS = 'S'
           THEN COMPUTE EXEMPT-AMT-LS =  EXEMPT-NUM-IN-LS * 1500.00
           END-IF

           IF (EXEMPT-NUM-IN-LS >= 6 AND <= 8) AND  MARITAL-IN-LS = 'M'
           THEN COMPUTE EXEMPT-AMT-LS =  EXEMPT-NUM-IN-LS * 1200.00
           END-IF

           IF MARITAL-IN-LS = 'S'  AND  EXEMPT-NUM-IN-LS >= 8
           THEN MOVE 0 TO EXEMPT-AMT-LS
           END-IF

           IF MARITAL-IN-LS = 'M'  AND EXEMPT-NUM-IN-LS >= 9
           THEN MOVE 0 TO EXEMPT-AMT-LS
           END-IF.


           EXIT PROGRAM.

