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
$Arguments = @()
$Arguments += "/Action:Publish"
$Arguments += "/SourceFile:`"$($DacPac)`""
$Arguments += "/TargetServerName:$($SQLInstance)"
$Arguments += "/TargetDatabaseName:$($TargetDBName)"
$Arguments += "/p:IncludeCompositeObjects=True"
$Arguments += "/v:DataFiles=C:\something"
$tempErrorFile = [System.IO.Path]::GetTempFileName()
$tempStdFile = [System.IO.Path]::GetTempFileName()
$proc = Start-Process -File $SqlPackagePath -Wait -ArgumentList $Arguments -NoNewWindow -PassThru `
		-RedirectStandardError $tempErrorFile -RedirectStandardOutput $tempStdFile
if (Test-Path $tempStdFile)
{
	Get-Content -Path $tempStdFile | Out-String | Write-Verbose -Verbose
}
if ($proc.ExitCode -ne 0)
{
	if (Test-Path $tempErrorFile)
	{
		Get-Content -Path $tempErrorFile | Out-String | Write-Verbose -Verbose
	}
	Write-Error "`tsqlpackage exited with code '$($proc.ExitCode)' while trying to publish dacpac changes"
	exit $proc.ExitCode
}		
		
"VERBOSE: About to execute deployment..." | Add-Content -Path "C:\Builds\Logs\$($SQLInstance)-$($TargetDBName).log"
#& $sqlPackagePath "/Action:Publish" "/SourceFile:`"$($Dacpac)`"" "/TargetServerName:$($SQLInstance)" "/TargetDatabaseName:$($TargetDBName)" "/v:DataFiles=C:\Builds"
"VERBOSE: Deployment complete..." | Add-Content -Path "C:\Builds\Logs\$($SQLInstance)-$($TargetDBName).log"

exit $LASTEXITCODE
