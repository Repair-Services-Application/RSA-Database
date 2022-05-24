# RSA-Database
The Repair-Services-Application-Database will be the database repository the application relies on
The database is a PostgreSQL database which can be created / transfered and other usage using the following commands.

SQL files:
repairServicesSystemdbSCHEMA.sql is the schema of the database (only the schema without any data).

## Used Commands
Commands to be used for exporting, importing and creating the database:
For database exportation excluding the data:
pg_dump -W -F p --schema-only -U username  -d dbname -h host > Path/filename.sql
-username: The postgreSQL username
-host: The URL of the host (localhost/https://...)
-Path: The directory path where the database is desired to be saved at.
-filename.sql: The database file name.

For database exportation include the data:
pg_dump -W -F p -U username -d dbname -h host > Path/filename.sql
-username: The postgreSQL username
-host: The URL of the host (localhost/https://...)
-Path: The directory path where the database is desired to be saved at.
-filename.sql: The database file name.

For database importation:
psql -U username -d dbname -h host < Path/filename.sql
-username: The postgreSQL username
dbname: The pre-created database name.
-host: The URL of the host (localhost/https://...)
-Path: The directory path where the database is desired to be imported from.
-filename.sql: The database creation file name.
