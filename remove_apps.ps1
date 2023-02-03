Write-Host "Uninstalling default apps"
$apps = @(
            "CandyCrushSaga" 
            "CandyCrush" # CandyCrushSaga
            "wallet" 
            "Microsoft Pay"  # Microsoft Wallet (Microsoft Pay)
            "skypeapp"       # App Get Skype
            "officehub"      # App Get Office
            "getstarted"     # Get Started or Tips
            "solitaire"      # Microsoft Solitaire Collection
             #"bing"           # Money, News, Sports and Weather apps together
            "bingfinance"    # Money
             #"bingweather"    # Weather
            "bingnews"       # News
            "bingsports"     # Sports
            "onenote"        # OneNote
            "sway"           # Sway
            "oneconnect"     # Paid Wi-Fi & Cellular
            "cortana"        # Cortana used to be Non-Removable but is removable on some version of Windows
            "Microsoft.549981C3F5F10" 
            "Cortana" # Alias for cortana on some version of Windows
            "Help"
            "tiktok"
            "twitter"
            "instagram"
            "BubbleWitchSaga"
            "MarchOfEmpires"
            "Disney"
            "spotify"
            "hulu"
            "photoshop"
            "picsart"
            "Facebook"
            "phone"          # Phone and Phone Companion apps together
            "feedback" 
            "Feedback Hub" # Feedback Hub
            "xbox"           # All Xbox Apps
            "xboxapp"
            "XBox"
            "Microsoft.XboxGamingOverlay"
            "GamingApp"
            #"communicationsapps"  # Calendar and Mail apps together
            "todos"
            "maps"           # Maps
            "messaging"      # Messaging and Skype Video apps together
            #"onedrive"       # OneDrive Connect
            "connectivitystore"  # Microsoft Wi-Fi
            "mspaint"        # Paint 3D
            "people"         # People
            "sticky"         # Sticky Notes
            "3dbuilder"      # 3D Builder
            "3d"             # View 3D
            "soundrecorder"  # Voice Recorder
            "holographic"    # Windows Holographic
            "mixedReality"
            "Mixed Reality Portal" 
            "Dolby"
            "Teams"
            "zune"           # Groove Music and Movies & TV apps together
            "zunemusic"      # Groove Music
            "zunevideo"      # Movies & TV
            

)
foreach ($app in $apps) {
    #Simple Version     
    #get-appxpackage -AllUsers -ErrorAction SilentlyContinue *$app* | remove-appxpackage
    $package = Get-AppxPackage -Name *$app* -AllUsers -ErrorAction SilentlyContinue
    if ($package) { 
        Remove-AppxPackage -Package $package.PackageFullName
        Get-AppXProvisionedPackage -Online | where DisplayName -EQ $app |`
            Remove-AppxProvisionedPackage -Online
    }
}

    
    

    

