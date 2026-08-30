$excludedDirs = @(
    "node_modules",
    ".git",
    "dist",
    "build",
    "coverage",
    ".vscode",
"mini-express"
)

$excludedFiles = @(
    ".env",
    ".env.local",
    ".env.development",
    ".env.production"
)

$allowedExtensions = @(
    ".js",
    ".mjs",
    ".cjs",
    ".json",
    ".sql",
    ".md"
)

$root = (Get-Location).Path

# =========================================================
# FILTRER LES FICHIERS
# =========================================================

$files = Get-ChildItem -Recurse -File | Where-Object {

    $relativePath = $_.FullName.Substring($root.Length + 1)

    # Vérifier les dossiers exclus
    $excludedDirectory = $excludedDirs | Where-Object {
        $relativePath -match "(^|\\)$([regex]::Escape($_))(\\|$)"
    }

    # Vérifier les fichiers exclus
    $excludedFile = $excludedFiles -contains $_.Name

    # Vérifier l'extension
    $allowed = $allowedExtensions -contains $_.Extension.ToLower()

    -not $excludedDirectory -and
    -not $excludedFile -and
    $allowed
}

# =========================================================
# AFFICHER LES FICHIERS QUI SERONT COPIÉS
# =========================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "       FICHIERS COPIES DANS CLIPBOARD" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

foreach ($file in $files) {

    $relativePath = $file.FullName.Substring($root.Length + 1)

    Write-Host "  + $relativePath" -ForegroundColor Green
}

Write-Host ""
Write-Host "Total : $($files.Count) fichiers" -ForegroundColor Yellow
Write-Host ""

# =========================================================
# CONSTRUIRE LE CONTENU
# =========================================================

$output = ""

$output += "PROJECT STRUCTURE`n"
$output += "=================`n`n"

foreach ($file in $files) {

    $relativePath = $file.FullName.Substring($root.Length + 1)

    $output += "===== $relativePath =====`n"
    $output += "`n"
    $output += Get-Content $file.FullName -Raw
    $output += "`n`n"
}

# =========================================================
# COPIER DANS LE PRESSE-PAPIERS
# =========================================================

$output | Set-Clipboard

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "       COPIE TERMINEE !" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Le contenu est maintenant dans le clipboard." -ForegroundColor Green
Write-Host "Fais Ctrl + V dans ChatGPT." -ForegroundColor Yellow
Write-Host ""