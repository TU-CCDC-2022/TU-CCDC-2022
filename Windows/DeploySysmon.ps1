# Download Sysinternals Suite if not already installed
certutil.exe -urlcache -f https://download.sysinternals.com/files/SysinternalsSuite.zip C:\Users\Administrators\Documents\SysinternalsSuite.zip

# Download Sysmon Modular Configuration
certutil.exe -urlcache -f https://raw.githubusercontent.com/olafhartong/sysmon-modular/master/sysmonconfig.xml C:\Users\Administrators\Documents\sysmonconfig.xml

# Install Sysmon
C:\Users\Administrator\Documents\SysinternalsSuite\sysmon64 -i sysmonconfig.xml

# Install the Manifest
C:\Users\Administrator\Documents\SysinternalsSuite\sysmon64 -s
