Write-Output "::group::Build for $Env:TARGET_PLATFORM"

$shouldSkip = [System.Convert]::ToBoolean($Env:SKIP_BUILD)
Write-Output "SKIP_BUILD set to $shouldSkip"
if($shouldSkip -eq $true) {
    Write-Output "::notice:: Build Step Skipped"
    Write-Output '::endgroup::'
    return
}

$parameters = @(
    "-build"
)

& "$PSScriptRoot/RunUAT.ps1" -Parameters $parameters

Write-Output '::endgroup::'