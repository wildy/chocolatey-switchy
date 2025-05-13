$repo = 'erryox/Switchy'
$assetName = 'Switchy.exe'

# GitHub API call
$release = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo/releases/latest" -Headers @{ 'User-Agent' = 'choco-updater' }

$version = $release.tag_name.TrimStart("v")
$asset = $release.assets | Where-Object { $_.name -eq $assetName }
$url = $asset.browser_download_url

# Download for checksum
Invoke-WebRequest -Uri $url -OutFile 'tmp.exe'
$checksum = (Get-FileHash -Path 'tmp.exe' -Algorithm SHA256).Hash.ToLower()

# Clean up
Remove-Item 'tmp.exe'

# Output or inject into files
"Version: $version"
"URL:     $url"
"SHA256:  $checksum"