Write-Output "::group::Cook for $Env:TARGET_PLATFORM"

$shouldSkip = [System.Convert]::ToBoolean($Env:SKIP_COOK)
Write-Output "SKIP_COOK set to $shouldSkip"
if($shouldSkip -eq $true) {
    Write-Output "::notice:: Cook Step Skipped"
    Write-Output '::endgroup::'
    return
}

$parameters = @(
    "-cook",
    "-skipstage",
    "-skippak",
    "-skipbuild"
)

& "$PSScriptRoot/RunUAT.ps1" -Parameters $parameters

Write-Output '::endgroup::'