       01  DETAIL-LN.
           05  CC4                   PIC X     VALUE SPACE.
           05  FILLER                PIC X     VALUE SPACE.
           05  SSN-OUT               PIC X(9)  VALUE SPACES.
           05  FILLER                PIC X(6)  VALUE SPACES.
           05  NAME-OUT.
               10 F-INIT-OUT         PIC X.
               10 FILLER             PIC X     VALUE SPACE.
               10 M-INIT-OUT         PIC X.
               10 FILLER             PIC X     VALUE SPACE.
               10 LAST-OUT           PIC X(17).
           05  FILLER                PIC X(2)  VALUE SPACES.
           05  GROSS-OUT             PIC Z,ZZZ,ZZ9.99 VALUE ZERO.
           05  FILLER                PIC X(7)  VALUE SPACES.
           05  WH-OUT                PIC ZZ,ZZ9.99 VALUE ZERO.
           05  FILLER                PIC X(9)  VALUE SPACES.
           05  FICA-OUT              PIC ZZZ,ZZ9.99 VALUE ZERO.
           05  FILLER                PIC X(6)  VALUE SPACES.
           05  MARITAL-OUT           PIC X     VALUE SPACES.
           05  FILLER                PIC X(10)  VALUE SPACES.
           05  EXEMPT-NUM-OUT        PIC 9(2)  VALUE ZEROS.
           05  FILLER                PIC X(9)  VALUE SPACES.
           05  EXEMPT-AMT-OUT        PIC ZZZ,ZZ9.99 VALUE ZERO.
      *    05  FILLER                PIC X(3) VALUE SPACES.
