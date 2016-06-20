# Strip the first part to avoid credentials leaks.
#echo repository=$(echo $repository | %{$_ -replace '[.*@^]+', ''}
#echo package_type=$package_type
#echo packages=$packages
#echo upgrade=$upgrade

# Strip leading/trailing quotes if present.
#repository = echo $repository | %{$_ - replace '[]+', ''}

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