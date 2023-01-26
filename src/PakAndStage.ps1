Write-Output "::group::Pak and Stage for $Env:TARGET_PLATFORM"

$shouldSkip = [System.Convert]::ToBoolean($Env:SKIP_PAKANDSTAGE)
Write-Output "SKIP_PAKANDSTAGE set to $shouldSkip"
if($shouldSkip -eq $true) {
    Write-Output "::notice:: Pak and Stage Step Skipped"
    Write-Output '::endgroup::'
    return
}

$parameters = @(
    "-skipcook",
    "-stage",
    "-pak",
    "-skipbuild",
    "-package"
)

& "$PSScriptRoot/RunUAT.ps1" -Parameters $parameters

Write-Output '::endgroup::'