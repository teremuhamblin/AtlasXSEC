IDENTIFICATION DIVISION.
       PROGRAM-ID. CREATE-MODULE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MODULE-NAME PIC X(50).
       01 CMD PIC X(400).

       PROCEDURE DIVISION.
           ACCEPT MODULE-NAME.

           MOVE SPACES TO CMD
           STRING "mkdir -p "
                  MODULE-NAME
                  "/src/main/java/com/themaddogtmdg/"
                  MODULE-NAME
                  "/api"
                  DELIMITED BY SIZE
                  INTO CMD
           END-STRING
           CALL "SYSTEM" USING CMD.

           MOVE SPACES TO CMD
           STRING "mkdir -p "
                  MODULE-NAME
                  "/src/main/java/com/themaddogtmdg/"
                  MODULE-NAME
                  "/internal"
                  DELIMITED BY SIZE
                  INTO CMD
           END-STRING
           CALL "SYSTEM" USING CMD.

           MOVE SPACES TO CMD
           STRING "mkdir -p "
                  MODULE-NAME
                  "/src/main/java/com/themaddogtmdg/"
                  MODULE-NAME
                  "/core"
                  DELIMITED BY SIZE
                  INTO CMD
           END-STRING
           CALL "SYSTEM" USING CMD.

           DISPLAY "Module créé: " MODULE-NAME.

           STOP RUN.
