//MSH XM8_P

while(1) {
    $bf3Running = Get-Process bf3 -ErrorAction silentlycontinue
    while($bf3Running -eq $null) { 
        $bf3Running = Get-Process bf3 -ErrorAction silentlycontinue
        [System.Threading.Thread]::Sleep(1000)
    }
    $runOnce = 0;
    while($runOnce -eq 0) {
        $oRunning = Get-Process origin -ErrorAction silentlycontinue;
        $bf3Running = Get-Process bf3 -ErrorAction silentlycontinue;
        if($oRunning -ne $null -and $bf3Running -eq $null) {
            $runOnce = 1;
            Stop-Process -name origin
			netsh advfirewall set allprofiles state on
        }
        [System.Threading.Thread]::Sleep(1000)
    }
}