param (
    [string]$Caminho
)

if (-Not (Test-Path $Caminho)) {
    Write-Host "O caminho especificado não existe." -ForegroundColor Red
    exit 1
}

$pastasTerraform = Get-ChildItem -Path $Caminho -Recurse -Directory -Filter ".terraform"

foreach ($pasta in $pastasTerraform) {
    Get-ChildItem -Path $pasta.FullName -Force | Remove-Item -Recurse -Force
    Write-Host "Conteúdo de $($pasta.FullName) apagado." -ForegroundColor Green
}

Write-Host "Processo concluído." -ForegroundColor Cyan