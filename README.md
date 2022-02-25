# Send-KeyStrokes
A PowerShell script which simulates keyboard input (keystrokes) from an input string.
Useful for applications such as HPE ILO Remote Console Standalone which do not accept clipboard paste.

Supported Operating Systems:
 - Windows

Example Usage:
```powershell
PS> . .\Send-KeyStrokes.ps1
PS> Send-KeyStrokes -StringToSend:'supersecretpassword' -Delay:5 -Minimize:$true
```