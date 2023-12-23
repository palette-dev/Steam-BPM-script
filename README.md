# Steam BPM script

This is a script that handles everything to launch Steam Big-Picture-Mode (BPM from now on) in Windows 10/11

> [!IMPORTANT]
> Even though this script theoretically works in versions way earlier than Windows 7, I will not support versions
> older than Windows 10, as Valve is going to drop support for Windows 7/8/8.1 on January 1st 2024

## Features

- Starts Steam BPM *(duh)*
- Handles the Windows shell (`explorer.exe`) in the background
  - Kills the Windows shell to save on ressources
  - Reopens the Windows shell once Steam BPM has been closed
- Ignores all processes from other users to the one using the script
- User doesn't need Admin rights

## Usage

Just launch the script after you [configured](#configuration) it, the rest happens automatically

## Configuration

> [!TIP]
> Because the default configuration is written in a way that should apply to most people, this is usually not needed
> 
> The cases where you do need to change something are described below

<details>
  <summary><b>You didn't install Steam to the default directory</b></summary>
  
  > If you didn't change anything while installing Steam, this shouldn't apply to you
  
  If you didn't install steam to the default location, you need to replace the value ofthe first variable (`steam_exe`)
  with the path to your Steam executeable
</details>

<details>
  <summary><b>Steams translation of the BPM window title doesn't contain <code>Big-Picture</code></b></summary>
  
  If Steams translation of the BPM window title in the language your Steam installation is set to doesn't contain `Big-Picture`,
  you need to change the second variable (`bpm_check`) to whatever the name of the window is
</details>

## Running on startup

> [!NOTE]
> Installing Windows, Drivers and Steam will not be covered here
> Also, it is recommended to use a stripped down install of Windows (like [Tiny10/Tiny11](http://tinyxx.rf.gd/)) for a setup like this.

This guide will show you how to setup this script to run at startup

0. Make sure you have installed Steam and your graphics drivers
1. Place the script on your desktop
2. Open the registry editor (<kbd>Win</kbd> + <kbd>R</kbd>, type `regedit` and press <kbd>Enter</kbd>)
3. Navigate to `HKEY_CURRENT_USER\Software\Microsoft\WindowsNT\CurrentVersion\Winlogon`
4. Right click in the folder pane to the right, select `New > String Value` and name it `Shell`
5. Right click on `Shell` and select `Modify`
6. Type in `%USERPROFILE%\Desktop\Steam_BPM.bat` and hit <kbd>Enter</kbd>
7. ***Optional:*** [Setup Windows to automatically login to your account](https://www.lifewire.com/how-do-i-auto-login-to-windows-2626066)

## Why?

This script was originally intended as an alternative to
[HoloISO](https://github.com/HoloISO/holoiso)/[ChimeraOS](https://chimeraos.org/)/[Bazzite](https://github.com/ublue-os/bazzite)
for Nvidia users, because gamescope and the Steam Deck UI are both broken on Nvidia (and probably will always be if Nvidia
continues being shitty with linux support), but it now works as both a startup script and at runtime
