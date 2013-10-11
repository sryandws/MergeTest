Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
$global:major = 0
$global:minor = 0
$global:build = 0
$global:revision = 0

function loadVersionNumbers() {
    [xml]$version = Get-Content (Resolve-Path "BuildVersionNumbers.xml")
    $global:major = $version.BuildVersionNumbers.Major
    $global:minor = $version.BuildVersionNumbers.Minor
    $global:build = $version.BuildVersionNumbers.Build
    $global:revision = $version.BuildVersionNumbers.Revision    
    $version.BuildVersionNumbers.Revision = ((($version.BuildVersionNumbers.Revision) -as [int]) + 1) -as [string]
    $version.Save((Resolve-Path "BuildVersionNumbers.xml"))
}

function updateVersionNumbers([string] $file, [string] $search) {
    $content = Get-Content $file
    $content | Foreach-Object { 
            if ($_ -match $search) {
                $replace = $matches.opentag +  $global:major + "." + $global:minor + "." + $global:build + "." + $global:revision + $matches.closetag               
                $_ -replace $search, $replace
            } else {
				$_
			}
        } | Set-Content -encoding UTF8 $file
    
}

loadVersionNumbers
$basePath = Get-Location
cd..
# Update the AssemblyInfo.cs files.
$assemblyFiles = Get-ChildItem -Include AssemblyInfo.cs -recurse
@($assemblyFiles).GetEnumerator() | Foreach {
    $search = "(?<opentag>^\[assembly:\s+Assembly(File)?Version\(`")(?<major>\d+)\.(?<minor>\d+)\.(?<build>\d+)\.(?<revision>\d+)(?<closetag>`"\)*])"
    updateVersionNumbers $_ $search
}