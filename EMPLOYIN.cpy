       01  INPUT-DATA-REC.
           05  COMPANY-IN            PIC XX.
           05  SSN-IN                PIC X(9).
           05  MARITAL-IN            PIC X.
           05  EXEMPT-NUM-IN         PIC 99.
           05  NAME-IN.
               10 F-INIT-IN          PIC X.
               10 M-INIT-IN          PIC X.
               10 LAST-IN            PIC X(20).
           05  GROSS-IN              PIC S9(7)V99.
           05  FICA-IN               PIC S9(4)V99.
           05  WH-IN                 PIC S9(5)V99.
           05  FILLER                PIC X(22).
