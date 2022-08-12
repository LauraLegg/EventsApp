Param(
   [string] $Server = "(localdb)\MSSQLLocalDb",
   [string] $Database = "EventsApp"
)

# This script requires the SQL Server module for PowerShell.
# The below commands may be required.

# To check whether the module is installed.
# Get-Module -ListAvailable -Name SqlServer;

# Install the SQL Server Module
# Install-Module -Name SqlServer -Scope CurrentUser

$CurrentDrive = (Get-Location).Drive.Name + ":"

Write-Host ""
Write-Host "Rebuilding database $Database on $Server..."
Invoke-SqlCmd -ServerInstance $Server -Database "master" -InputFile "Database.sql"

Write-Host "Creating schema..."
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "Schema.sql"

Write-Host "Creating tables..."
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "Tables.sql"

Write-Host "Stored procedures..."
Get-ChildItem "Procedures" -Recurse -Include "*.sql" | % {
	$filename = $_.FullName
	& Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "$filename"
}

Write-Host "Inserting data..."
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "Data.sql"

Write-Host "Rebuild completed."
Write-Host ""

Set-Location $CurrentDrive
