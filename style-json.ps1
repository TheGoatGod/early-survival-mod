Write-Output "JSON formatting script begins."
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
Set-Location -Path (Join-Path -Path $scriptDir -ChildPath "..")
$blacklist = Get-Content "early-survival-mod\json_blacklist" | Resolve-Path -Relative
$files = Get-ChildItem -Recurse -Include *.json "early-survival-mod\Goats_Early_Survival" | Resolve-Path -Relative | ?{$blacklist -notcontains $_}
$files | ForEach-Object { Invoke-Expression "early-survival-mod\tools\format\json_formatter.exe $_" }
Write-Output "JSON formatting script ends."
