$dotfilespath = $args[0]

# Install alacritty config
try {
    Get-Command alacritty -ErrorAction Stop | Out-Null

    $alacrittyConfigSource = $dotfilespath + "/alacritty"
    $alacrittyConfigFile = $alacrittyConfigSource + "/alacritty-win.toml"

    $alacrittyConfigDestination = "%APPDATA%\alacritty"
    $alacrittyConfigDestinationFile = $alacrittyConfigDestination + "\alacritty.toml"

    # Expand the dotfilespath path
    $alacrittyConfigDestination = [System.Environment]::ExpandEnvironmentVariables($alacrittyConfigDestination)
    $alacrittyConfigDestinationFile = [System.Environment]::ExpandEnvironmentVariables($alacrittyConfigDestinationFile)

    # Check if the dotfilespath directory exists, if it does, delete it
    if ((Test-Path -Path $alacrittyConfigDestination)) {
        Write-Output "Alacritty config already exists. Deleting the existing config."
        Remove-Item -Path $alacrittyConfigDestination -Recurse -Force
    }

    New-Item -ItemType Directory -Force -Path $alacrittyConfigDestination


    # Copy the Alacritty configuration files to the dotfilespath
    Copy-Item -Path $alacrittyConfigFile -Destination $alacrittyConfigDestinationFile -Recurse -Force

    Write-Output "Alacritty config installed."

} catch {
    Write-Output "Alacritty is not installed. Install it before running this script."
}
