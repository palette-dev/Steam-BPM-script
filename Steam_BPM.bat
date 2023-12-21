@echo off

rem	Copyright (C) 2023 PaletteDev
rem	
rem	Licensed under the Apache License, Version 2.0 (the "License");
rem	you may not use this file except in compliance with the License.
rem	You may obtain a copy of the License at
rem	
rem	    http://www.apache.org/licenses/LICENSE-2.0
rem	
rem	Unless required by applicable law or agreed to in writing, software
rem	distributed under the License is distributed on an "AS IS" BASIS,
rem	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem	See the License for the specific language governing permissions and
rem	limitations under the License.

if not defined MIN set min=1 & start "" /min "%~dpnx0" %* & exit

rem The path to your Steam executeable
set steam_exe="C:\Program Files (x86)\Steam\steam.exe"
rem The title of the BPM window in the language you set Steam to
set bpm_check="Big-Picture"

echo Steam BPM script v1.0 by PaletteDev
echo Licensed under Apache-2.0
echo -----------------------------------

tasklist /fi "IMAGENAME eq steamwebhelper.exe" /fi "USERNAME eq %USERNAME%" | find "steamwebhelper.exe" > nul || goto :steam_kill_skip
echo Closing Steam...
start "" %STEAM_EXE% "-shutdown"
:killed_check
timeout /t 1 /nobreak > nul
tasklist /fi "IMAGENAME eq steamwebhelper.exe" /fi "USERNAME eq %USERNAME%" | find "steamwebhelper.exe" > nul && goto :killed_check
:steam_kill_skip

echo Starting Steam in BPM...
start "" %STEAM_EXE% "-gamepadui"

echo Waiting for Steam BPM to start...
:open_check
timeout /t 5 /nobreak > nul
tasklist /fi "IMAGENAME eq steamwebhelper.exe" /fi "USERNAME eq %USERNAME%" /V | find %BPM_CHECK% > nul || goto :open_check

tasklist /fi "IMAGENAME eq explorer.exe" /fi "USERNAME eq %USERNAME%" | find "explorer.exe" > nul || goto :shell_kill_skip
echo Killing the Windows shell...
Taskkill /f /im explorer.exe /fi "USERNAME eq %USERNAME%" > nul
:shell_kill_skip

echo Running Steam BPM check...
:closed_check
timeout /t 10 /nobreak > nul
tasklist /fi "IMAGENAME eq steamwebhelper.exe" /fi "USERNAME eq %USERNAME%" /V | find %BPM_CHECK% > nul && goto :closed_check
echo Steam BPM closed!

echo Starting the Windows shell...
start "" "%WINDIR%\explorer.exe"

exit
