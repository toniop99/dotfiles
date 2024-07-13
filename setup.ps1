$source = "./"
$destination = "~/.config/"

# Expand the destination path
$destination = [System.Environment]::ExpandEnvironmentVariables($destination)

# Check if the destination directory exists, if not, create it
if (!(Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Force -Path $destination
}

# Copy the dotfiles folder to the destination
Copy-Item -Path $source -Destination $destination -Recurse -Force

# Install alacritty config
try {
    $alacritty = Get-Command alacritty -ErrorAction Stop

    $alacrittyConfigSource = "./alacritty" # Append \* to copy only the contents
    $alacrittyConfigFile = $alacrittyConfigSource + "/alacritty-win.toml"

    $alacrittyConfigDestination = "%APPDATA%\alacritty"
    $alacrittyConfigDestinationFile = $alacrittyConfigDestination + "\alacritty.toml"

    # Expand the destination path
    $alacrittyConfigDestination = [System.Environment]::ExpandEnvironmentVariables($alacrittyConfigDestination)
    $alacrittyConfigDestinationFile = [System.Environment]::ExpandEnvironmentVariables($alacrittyConfigDestinationFile)

    # Check if the destination directory exists, if it does, delete it
    if ((Test-Path -Path $destination)) {
        Write-Output "Alacritty config already exists. Deleting the existing config."
        Remove-Item -Path $alacrittyConfigDestination -Recurse -Force
    }

    New-Item -ItemType Directory -Force -Path $alacrittyConfigDestination


    # Copy the Alacritty configuration files to the destination
    Copy-Item -Path $alacrittyConfigFile -Destination $alacrittyConfigDestinationFile -Recurse -Force

    Write-Output "Alacritty config installed."

} catch {
    Write-Output "Alacritty is not installed. Install it before running this script."
}
