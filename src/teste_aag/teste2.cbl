       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQLINJECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 USERID       PIC X(20).
       01 PASSWORD     PIC X(20).
       01 SQLQUERY     PIC X(200).

       PROCEDURE DIVISION.
           DISPLAY "Enter UserID:".
           ACCEPT USERID.
           DISPLAY "Enter Password:".
           ACCEPT PASSWORD.

           * Construção dinâmica da query sem sanitização
           STRING "SELECT * FROM USERS WHERE USERID = '"
                  USERID DELIMITED BY SIZE
                  "' AND PASSWORD = '"
                  PASSWORD DELIMITED BY SIZE
                  "'" DELIMITED BY SIZE
                  INTO SQLQUERY.

           DISPLAY "Executing SQL: " SQLQUERY.

           EXEC SQL
               EXECUTE IMMEDIATE :SQLQUERY
           END-EXEC.

           STOP RUN.

