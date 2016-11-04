REM Call Deployment Util
c:\Windows\Sysnative\WindowsPowerShell\v1.0\powershell.exe -Command "& {.\deployDb.ps1 -Dacpac 'C:\Builds\AdventureWorks\AdventureWorks.dacpac' -SQLInstance 'localhost' -TargetDBName 'AdventureWorks'}"
