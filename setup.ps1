# Software Install

Write-Output "`nInstall PacketManager and Basic Software:`n"
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); 
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin";
choco feature enable -n=allowGlobalConfirmation;

#Software Setup: 
choco install chocolateygui googlechrome adobereader vlc irfanview irfanview-languages irfanviewplugins 7zip advanced-renamer.install mediainfo teamviewer vscode.install putty.install filezilla winscp.install;

# Windows Customize

# Enable Dark Mode
Write-Output "Enable Dark Mode`n"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force


# Show Computer Shortcut on Desktop
Write-Output "Show Computer Shortcut on Desktop`n"
$RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$RegKey = "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
    If (!(Test-Path $RegPath)) {
        New-Item $RegPath
    }
    Set-ItemProperty $RegPath $RegKey -Value 0 -Type Dword -Force
    
# Disable Taskbar Widgets
Write-Output "Disable Taskbar Widgets`n"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarDa -Value 0 -Type Dword -Force
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarMn -Value 0 -Type Dword -Force
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -Value 0 -Type Dword -Force

# Disable Taskbar Search
Write-Output "Disable Taskbar Search`n"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -Value 0 -Type Dword -Force

# Set File Explorer to open This PC
Write-Output "Set File Explorer to open This PC`n"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1 -Type Dword -Force

# Show File Extensions
Write-Output "Show File Extensions`n"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0 -Type Dword -Force

# Show All Folder in Navigation Panel
Write-Output "Show All Folder in Navigation Panel`n"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1 -Type Dword -Force

# Rename This PC Shortcut
Write-Output "Rename This PC Shortcut`n"
$RegPath = "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
$RegKey = "(Default)"
$RegValue = "Arbeitsplatz "+ $env:COMPUTERNAME
    If (!(Test-Path $RegPath)) {
        New-Item $RegPath
    }
    Set-ItemProperty $RegPath $RegKey -Value $RegValue -Type String -Force
    
# Rename System Drive
Write-Output "Rename System Drive`n"
$RegPath = "HKCU:Software\Classes\Applications\Explorer.exe\Drives\C\DefaultLabel"
$RegKey = "(Default)"
$RegValue = "SYSTEM "+ $env:COMPUTERNAME
    If (!(Test-Path $RegPath)) {
        New-Item HKCU:Software\Classes\Applications
        New-Item HKCU:Software\Classes\Applications\Explorer.exe
        New-Item HKCU:Software\Classes\Applications\Explorer.exe\Drives
        New-Item HKCU:Software\Classes\Applications\Explorer.exe\Drives\C
        New-Item $RegPath
    }
    Set-ItemProperty $RegPath $RegKey -Value $RegValue -Type String -Force
    
    
Write-Output "Starting with Windows Apps removal"

RemoveSoftware "CandyCrushSaga" "CandyCrush" # CandyCrushSaga
RemoveSoftware "wallet" "Microsoft Pay"  # Microsoft Wallet (Microsoft Pay)
RemoveSoftware "skypeapp"       # App Get Skype
RemoveSoftware "officehub"      # App Get Office
RemoveSoftware "getstarted"     # Get Started or Tips
RemoveSoftware "solitaire"      # Microsoft Solitaire Collection
RemoveSoftware "bing"           # Money, News, Sports and Weather apps together
###  Single bing softwares (Skipped if bing is selected above) ###
RemoveSoftware "bingfinance"    # Money
RemoveSoftware "bingweather"    # Weather
RemoveSoftware "bingnews"       # News
RemoveSoftware "bingsports"     # Sports
## 
RemoveSoftware "onenote"        # OneNote
RemoveSoftware "sway"           # Sway
RemoveSoftware "oneconnect"     # Paid Wi-Fi & Cellular
RemoveSoftware "cortana"        # Cortana used to be Non-Removable but is removable on some version of Windows
RemoveSoftware "Microsoft.549981C3F5F10" "Cortana" # Alias for cortana on some version of Windows
# Windows 11 most preinstalled apps
RemoveSoftware "tiktok"
RemoveSoftware "twitter"
RemoveSoftware "instagram"
RemoveSoftware "BubbleWitchSaga"
RemoveSoftware "MarchOfEmpires"
RemoveSoftware "Disney"
RemoveSoftware "spotify"
RemoveSoftware "hulu"
RemoveSoftware "photoshop"
RemoveSoftware "picsart"
RemoveSoftware "Facebook"

### RECOMMENDED FOR REMOVAL ###
promptContinue("Continue with Software recommended for removal ?")

RemoveSoftware "phone"          # Phone and Phone Companion apps together
RemoveSoftware "feedback" "Feedback Hub" # Feedback Hub:
RemoveSoftware "xbox"           # All Xbox Apps
RemoveSoftware "communicationsapps"  # Calendar and Mail apps together
RemoveSoftware "todos"
RemoveSoftware "maps"           # Maps
RemoveSoftware "messaging"      # Messaging and Skype Video apps together
RemoveSoftware "onedrive"       # OneDrive Connect
RemoveSoftware "connectivitystore"  # Microsoft Wi-Fi
RemoveSoftware "mspaint"        # Paint 3D
RemoveSoftware "people"         # People
RemoveSoftware "sticky"         # Sticky Notes
RemoveSoftware "3dbuilder"      # 3D Builder
RemoveSoftware "3d"             # View 3D
RemoveSoftware "soundrecorder"  # Voice Recorder
RemoveSoftware "holographic"    # Windows Holographic
RemoveSoftware "mixedReality" "Mixed Reality Portal" 
RemoveSoftware "Dolby"
RemoveSoftware "Teams"

# Dell Laptop Specific
RemoveSoftware "partnerpromo"  "Dell PromoApp"
RemoveSoftware "dell*connect"  "Dell Connect Apps"
RemoveSoftware "dellCustomer"  "Dell Customer Connect"
RemoveSoftware "dellMobile"    "Dell Mobile Connect"
RemoveSoftware "myDell"        "My Dell"
