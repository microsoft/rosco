


echo "Hello World"

# Strip the first part to avoid credentials leaks.
#echo repository=$(echo $repository | %{$_ -replace '[.*@^]+', ''}
#echo package_type=$package_type
#echo packages=$packages
#echo upgrade=$upgrade

# Strip leading/trailing quotes if present.
#repository = echo $repository | %{$_ - replace '[]+', ''}

# Strip leading/trailing quotes if present.
# Also convert a comma-separated list to a whitespace-separated one.
#packages = echo $packages | %{$_ -replace ',' , ' '}


#function provision_nuget {
#
#    # Download NuGet
#    $storageDir = $pwd
#    $webclient = New-Object System.Net.WebClient
#    $url = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
#    $file = "$storageDir\NuGet.Tools.vsix"
#    $webclinet.DownloadFile($url, $file)
#}
