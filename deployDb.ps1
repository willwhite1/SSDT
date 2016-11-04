param
(
	$Dacpac,
	$SQLInstance,
	$TargetDBName
)
$sqlPackagePath = "C:\Program Files (x86)\Microsoft SQL Server\130\DAC\bin\sqlpackage.exe"
if (!(Test-Path $sqlPackagePath))
{
	throw "Unable to locate sqlpackage.exe at path '$($sqlPackagePath)'"
}
if (!(Test-Path $Dacpac))
{
	throw "Unable to locate specified dacpac at path '$($Dacpac)'"
}

# run the command
& $sqlPackagePath "/Action:Publish" "/SourceFile:`"$($Dacpac)`"" "/TargetServerName:$($SQLInstance)" "/TargetDatabaseName:$($TargetDBName)"