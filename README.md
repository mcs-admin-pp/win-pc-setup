# win-pc-setup
Default Windows PC Setup


When executed, the script  installs `chocolatey` on the local machine and then installs all applications and customizations defined in the `setup.ps1` script file.

## Install applications and customizations:
In order to run, open a Powershell instance in admin mode (Run as Administrator) and execute:

```console
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mcs-admin-pp/win-pc-setup/main/setup.ps1'))
```

It downloads the setup script and executes it.


Remove default Apps:
```console
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mcs-admin-pp/win-pc-setup/main/remove_apps.ps1'))
```
