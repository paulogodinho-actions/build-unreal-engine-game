Write-Output "::group::Archive for $Env:TARGET_PLATFORM"

$shouldSkip = [System.Convert]::ToBoolean($Env:SKIP_ARCHIVE)
Write-Output "SKIP_ARCHIVE set to $shouldSkip"
if($shouldSkip -eq $true) {
    Write-Output "::notice:: Archive Step Skipped"
    Write-Output '::endgroup::'
    return
}

$parameters = @(
    "-skipcook",
    "-skipstage",
    "-skippak",
    "-skipbuild",
    "-archive"
)

& "$PSScriptRoot/RunUAT.ps1" -Parameters $parameters

Write-Output '::endgroup::'