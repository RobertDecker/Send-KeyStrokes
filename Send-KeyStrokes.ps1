$Script:showWindowAsync = Add-Type -MemberDefinition @"
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@ -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru
	
Function Show-Powershell() {
	$null = $showWindowAsync::ShowWindowAsync((Get-Process -Id $pid).MainWindowHandle, 10)
}

Function Hide-Powershell() {
	$null = $showWindowAsync::ShowWindowAsync((Get-Process -Id $pid).MainWindowHandle, 2)
}


Function Send-KeyStrokes
{   <#
    .SYNOPSIS
        Sends keystrokes to the window in focus after a delay
    .PARAMETER StringToSend
        String which the function will send to the window in focus
    .PARAMETER Delay
        Delay, in seconds, which the function will wait before sending the string
	.PARAMETER Minimize
		Minimize the PowerShell window before sending keystrokes.
    .EXAMPLE
        Send-KeyStrokes -StringToSend 'SuperSecretPassword' -Delay 7
    .NOTES
        Author:             Robert Decker
        Email:              rdecker@cybernorth.com
       
        Changelog:
            1.0.2           Added Minimize capabilities.
            1.0.1           Minor bug fixes
            1.0.0           Initial Release
    #>

    param (
        [Parameter(
            Mandatory=$true,
            HelpMessage="String containing the keystrokes to send."
        )]
        [String]$StringToSend,
        
        [Parameter(
            HelpMessage="Delay in seconds prior to sending keystrokes."
        )]
        [int]$Delay=7,
		
		[Parameter(
			HelpMessage="Minimize PowerShell window."
		)]
		[bool]$Minimize=$true
    )
    
    Add-Type -AssemblyName System.Windows.Forms
    $SpecialCharacters = '+~^%(){}'

    $Message =  "Please set focus on window to receive keystrokes."  

	if ($true -eq $Minimize) {
		Hide-PowerShell
	}
	
    ForEach ($Count in (1..$Delay))
    {
        Write-Progress -Id 1 -Activity $Message -Status "Waiting before sending keystrokes" -SecondsRemaining $($Delay-$Count) -PercentComplete (($Count/$Delay)*100) 
        Start-Sleep -Seconds 1
    }
    Write-Progress -Id 1 -Activity $Message -Status "Sending keystrokes" -PercentComplete 99 -Completed

    for ($i=0; $i -lt $StringToSend.Length; $i++) {
        $character = $StringToSend.Substring($i,1)
        for ($j=0; $j -lt $SpecialCharacters.Length; $j++) {
            if ($character -eq $SpecialCharacters.Substring($j,1)) {
                $character = "{$character}"
                break
            }
        }
        [System.Windows.Forms.SendKeys]::SendWait($character)
    }

    Write-Progress -Id 1 -Activity $Message -Status "Sent Keystrokes" -PercentComplete 100 -Completed
}