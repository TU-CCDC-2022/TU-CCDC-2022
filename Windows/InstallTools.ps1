#Download Sysinternals (do NOT run as admin)
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/SysinternalsSuite.zip", "SysinternalsSuite.zip")
./SysinternalsSuite.zip /norestart /passive

#Download AV (Security Essentials) 
(New-Object System.Net.WebClient).DownloadFile("https://download.microsoft.com/download/A/3/8/A38FFBF2-1122-48B4-AF60-E44F6DC28BD8/enus/amd64/mseinstall.exe", "MSEinstall.exe")
./MSEinstall.exe /norestart /passive 

# Download Process Hacker

# Download Vim for automated threathunt script
(New-Object System.Net.Webclient).DownloadFile("https://github.com/vim/vim-win32-installer/releases/download/v8.2.2825/gvim_8.2.2825_x86_signed.exe", "vimInstall.exe")
