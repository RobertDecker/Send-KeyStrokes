# Send-KeyStrokes
A PowerShell function which simulates keyboard input (keystrokes or sending keys) from an input string.
It is useful for applications such as HPE ILO Remote Console Standalone and Zoom which do not accept clipboard paste.  It is also useful for ensuring consistency when typing long and complex passwords.

Supported Operating Systems:
 - Windows

Example Usage:
```powershell
PS> . .\Send-KeyStrokes.ps1
PS> Send-KeyStrokes -StringToSend:'supersecretpassword' -Delay:5 -Minimize:$true
```

## License
This software is licensed under the GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
