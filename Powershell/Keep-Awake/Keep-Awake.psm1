function Keep-Awake {
    param (
        [int] $duration = 4, #in hours
        [int] $refresh = 240 #in seconds
    )
    $now = Get-Date
    $expire = $now.AddHours($duration)
    Write-Output ("Current Time: " + $now)
    Write-Output ("Set to expire: " + $expire)
    Write-Output ("Refresh rate : " + $refresh + " seconds")

    $wshell = New-Object -ComObject wscript.shell

    while((get-date) -lt $expire) {
        # Write-Output "Toggle Numlock"
        #$wshell.SendKeys('{NUMLOCK}')

        #Write-Output "Toggle Scrolllock"
        $wshell.SendKeys('{SCROLLLOCK}')

        #Write-Output ("Wait " + $refresh + " seconds")
        Start-Sleep -Seconds $refresh
    } 

    Write-Output ("Exired: " + $expire)
}