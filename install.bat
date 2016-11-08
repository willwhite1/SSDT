REM Call Deployment Util
c:\Windows\Sysnative\WindowsPowerShell\v1.0\powershell.exe -Command "& {. C:\Builds\AdventureWorks\deployDb.ps1 -Dacpac 'C:\Builds\AdventureWorks\AdventureWorks.dacpac' -SQLInstance 'localhost' -TargetDBName 'AdventureWorks'}"
