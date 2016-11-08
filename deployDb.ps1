param
(
	$Dacpac,
	$SQLInstance,
	$TargetDBName
)
$sqlPackagePath = "C:\Program Files (x86)\Microsoft SQL Server\130\DAC\bin\sqlpackage.exe"
if (!(Test-Path $sqlPackagePath))
{
	"ERROR: Unable to locate sqlpackage.exe at path '$($sqlPackagePath)'" | Add-Content -Path "C:\Builds\Logs\$($SQLInstance)-$($TargetDBName).log"
	throw "Unable to locate sqlpackage.exe at path '$($sqlPackagePath)'"
}
if (!(Test-Path $Dacpac))
{
	"ERROR: Unable to locate specified dacpac at path '$($Dacpac)'" | Add-Content -Path "C:\Builds\Logs\$($SQLInstance)-$($TargetDBName).log"
	throw "Unable to locate specified dacpac at path '$($Dacpac)'"
}

# run the command
"VERBOSE: About to execute deployment..." | Add-Content -Path "C:\Builds\Logs\$($SQLInstance)-$($TargetDBName).log"
& $sqlPackagePath "/Action:Publish" "/SourceFile:`"$($Dacpac)`"" "/TargetServerName:$($SQLInstance)" "/TargetDatabaseName:$($TargetDBName)"
"VERBOSE: Deployment complete..." | Add-Content -Path "C:\Builds\Logs\$($SQLInstance)-$($TargetDBName).log"

exit $LASTEXITCODE
