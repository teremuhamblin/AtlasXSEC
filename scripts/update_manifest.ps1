$manifest = Get-Content manifest/manifest.json | ConvertFrom-Json

foreach ($m in $manifest.modules) {
    $zip = "dist/$($m.id).zip"
    if (Test-Path $zip) {
        $hash = (Get-FileHash $zip -Algorithm SHA256).Hash
        $m.hash = "sha256:$hash"
    }
}

$manifest | ConvertTo-Json -Depth 10 | Set-Content manifest/manifest.json
