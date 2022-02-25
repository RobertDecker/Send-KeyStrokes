# Send-KeyStrokes
A PowerShell function which simulates keyboard input (keystrokes or sending keys) from an input string.
It is useful for applications such as HPE ILO Remote Console Standalone and Zoom which do not accept clipboard paste.  It is also useful for ensuring consistency when typing long and complex passwords.

## Supported Operating Systems:
 - Windows

## How to use it
 1. Dot source the script.
 2. Execute the Send-KeyStrokes function with arguments appropriate to your needs.  The script will wait 7 seconds by default before it sends keystrokes to the window in focus.
 3. Before the delay timer expires, click or otherwise set focus on the window to receive the keystrokes.
 4. If you wish to include a single qoute within the string to send, either enclose the string with double qoutes or escape the single qoute by using another single qoute.  Normal PowerShell string syntax applies.

## Example Video
https://user-images.githubusercontent.com/32723250/155756410-1dd3eb17-5684-4a6f-a343-2d740e39d6b4.MP4



## Example Usage:
```powershell
PS> . .\Send-KeyStrokes.ps1
PS> Send-KeyStrokes -StringToSend:'supersecretpassword'
```
```powershell
PS> . .\Send-KeyStrokes.ps1
PS> $complicatedString = 'Sup3r$3cr3tP@$$w0rdN0bodyL1k3sToTyp3ABunchofTimes.!'
PS> Send-KeyStrokes -StringToSend:$complicatedString -Delay:10
```
```powershell
PS> . .\Send-KeyStrokes.ps1
PS> $stringWithASingleQoute = 'thisIsAStringWithASingle''QouteInTheMiddle'
PS> Send-KeyStrokes -StringToSend:$stringWithASingleQoute
```
## License
This software is licensed under the GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
