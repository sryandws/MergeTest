: Get the location of this script set the build directory to be in the same folder called 'Release'
: Using a folder named 'Release' means that the contents wont be picked up by git becuase our gitignore file specifically ignores Release folders
SET BUILDDIR=%~dp0
SET BUILDOUTPUTDIR=%BUILDDIR%\Release

: Clean and create build output directory
IF EXIST %BUILDOUTPUTDIR% RMDIR /S /Q %BUILDOUTPUTDIR%
IF NOT EXIST %BUILDOUTPUTDIR% MKDIR %BUILDOUTPUTDIR%

: Update version numbers
powershell -File .\IncrementVersionNumbers.ps1

: Build solution - I am specifying the build output directory using the /p:OutputDirectory switch at the end
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\msbuild Build.targets /fileLogger1 /flp1:logfile=Logs\BuildFramework-All.log /fileLogger2 /flp2:errorsonly;logfile=Logs\BuildFramework-Errors.log /fileLogger3 /flp3:warningsonly;logfile=Logs\BuildFramework-Warnings.log /p:OutputPath=%BUILDOUTPUTDIR%

pause
