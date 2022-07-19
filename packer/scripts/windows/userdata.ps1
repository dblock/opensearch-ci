<powershell>

############################## With HTTP ######################################
## Setup winrm
cmd /c winrm quickconfig -q
cmd /c winrm quickconfig '-transport:http'
cmd /c winrm set "winrm/config" '@{MaxTimeoutms="1800000"}'
cmd /c winrm set "winrm/config/winrs" '@{MaxMemoryPerShellMB="1024"}'
cmd /c winrm set "winrm/config/service" '@{AllowUnencrypted="true"}'
cmd /c winrm set "winrm/config/client" '@{AllowUnencrypted="true"}'
cmd /c winrm set "winrm/config/service/auth" '@{Basic="true"}'
cmd /c winrm set "winrm/config/client/auth" '@{Basic="true"}'
cmd /c winrm set "winrm/config/listener?Address=*+Transport=HTTP" '@{Port="5985"}'
cmd /c netsh advfirewall set allprofiles state off
cmd /c net stop winrm
cmd /c sc config winrm start= auto
cmd /c net start winrm

echo "Create Jenkins Home"
New-Item -Path 'C:\\Users\\Administrator\\jenkins' -ItemType Directory

</powershell>
