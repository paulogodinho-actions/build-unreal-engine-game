param (
    [Parameter(Mandatory=$true, HelpMessage="UAT Parameters")] 
    [string[]] $Parameters
)

$defaultArgs = @()
if($Env:USE_DEFAULT_ARGS) {
    Write-Output "Using Default Args combined with anything in EXTRA_ARGS"
    $defaultArgs =  & "$PSScriptRoot/GetDefaultArgs.ps1"
}

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
) + $Parameters + $defaultArgs + $splitedExtraArgs

$uatBat = "$enginePath/Engine/Build/BatchFiles/RunUAT.bat"
Write-Output "Invoking RunUAT.bat BuildCookRun from $uatBat with args: $uatArgs"
& $uatBat $uatArgs $splitedExtraArgs