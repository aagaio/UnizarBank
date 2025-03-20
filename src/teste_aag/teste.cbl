       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQLInjectionExample.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 USER-ID         PIC X(20).
       01 USER-PASSWORD   PIC X(20).
       01 SQL-COMMAND     PIC X(100).
 
       PROCEDURE DIVISION.
       ACCEPT USER-ID.
       ACCEPT USER-PASSWORD.

       STRING 'SELECT * FROM USERS WHERE USER_ID = "' 
              USER-ID 
              '" AND PASSWORD = "' 
              USER-PASSWORD 
              '"'
              INTO SQL-COMMAND.
           
       EXEC SQL
           CONNECT TO 'MYDB'
       END-EXEC.
           
       EXEC SQL
           DECLARE C1 CURSOR FOR USER-QUERY
       END-EXEC.
           
       EXEC SQL
           OPEN C1 USING :SQL-COMMAND
       END-EXEC.
           
       EXEC SQL
           FETCH C1 INTO :USER-ID, :USER-PASSWORD
       END-EXEC.
       
       EXEC SQL
           CLOSE C1
       END-EXEC.
 
       STOP RUN.
 
