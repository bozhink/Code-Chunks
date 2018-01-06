@echo off
if %1.==. goto error

@echo on

REM compile sample java
%1\javac.exe -cp MapForceAPI.jar;AltovaAutomation.jar RunMapForce.java

REM run sample java
%1\java.exe -cp MapForceAPI.jar;AltovaAutomation.jar;. RunMapForce

@echo off
goto end

:error
echo Usage: buildAndRun "<path_to_java_bin_folder>"

:end
