# Public location of zip file
echo "repository=$repository"

# Download zip
$storageDir = $pwd
$webclient = New-Object System.Net.WebClient
$url = $repository
$file = "$storageDir\myapp.zip"
$webclinet.DownloadFile($url, $file)

# Unzip files
$shell = new-object -com shell.application
$destination = $pwd
$zip = $shell.NameSpace($file)
foreach($item in $zip.items()){
    $shell.Namespace($destination).copyhere($item)
}

# If there is a install.ps1 then execute it
If (Test-Path $storageDir\install.ps1) {
    powershell -executionpolicy bypass -File .\install.ps1
}

# Generalize Image
#cd %WINDIR%\system32\sysprep
#Sysprep /generalize
& "$Env:SystemRoot\system32\sysprep\sysprep.exe" /generalize /oobe /shutdown