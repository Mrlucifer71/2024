$shell =New-Object -ComObject WScript.shell
$answer=$shell.Popup("Vill du ha kaffe",10,"Meddelande från Gud",3+32)

switch($answer){

2{Write-Host "Du valde cancel " -ForegroundColor Yellow   } 
6{Write-Host "Du valde JA " -ForegroundColor Green }
7{Write-Host "Du valde nej" -ForegroundColor Red }

default {Write-Output"du gjorde inget val eller tyckte på fel knapp"}
} 


<#
0 — OK button
1 — OK and Cancel buttons
2 — About, Retry and Ignore buttons
3 — Yes, No and Cancel buttons
4 — Yes and No buttons
5 — Retry and Cancel buttons
Icons
16 — Stop icon
32 — Question icon
48 — Exclamation icon
64 — Information icon
#>


#$wshell = New-Object -ComObject Wscript.Shell
# $wshell.Popup("Operation Completed",0,"Done",0x1)
