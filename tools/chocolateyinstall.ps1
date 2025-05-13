$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/erryox/Switchy/releases/download/1.4.3/Switchy.exe'
$checksum   = '24a4423982fb4a313f3d077b7ad450d1c0fa398099f554b6696d8ad7cd810643'
$checksumType = 'sha256'

$exePath = Join-Path $toolsDir 'Switchy.exe'

Get-ChocolateyWebFile -PackageName 'switchy' `
                      -FileFullPath $exePath `
                      -Url $url `
                      -Checksum $checksum `
                      -ChecksumType $checksumType

Install-BinFile -Name 'switchy' -Path $exePath