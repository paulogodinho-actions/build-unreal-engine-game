param (
    [Parameter(Mandatory=$true, HelpMessage="UAT Parameters")] 
    [string[]] $Parameters
)

$enginePath = $Env:ENGINE_PATH
$uProjectPath = $Env:UPROJECT_PATH
$targetPlatform = $Env:TARGET_PLATFORM
$extraArgs = $Env:EXTRA_ARGS
$splitedExtraArgs = $extraArgs.Split(' ')
$buildConfiguration = $Env:CLIENT_CONFIG

$uatArgs = @(
    "BuildCookRun",
    "-project=$uProjectPath",
    "-targetplatform=$targetPlatform",
    "-clientconfig=$buildConfiguration"
    "-buildmachine",
    "-noP4"
) + $Parameters + $splitedExtraArgs

$uatBat = "$enginePath/Engine/Build/BatchFiles/RunUAT.bat"
Write-Output "Invoking RunUAT.bat BuildCookRun from $uatBat with args: $uatArgs"
& $uatBat $uatArgs $splitedExtraArgs | Tee-Object -Variable uatOutput

if($uatOutput.Contains("ExitCode=0") -eq $false) {
    throw "UAT returned non-zero ExitCode"
}