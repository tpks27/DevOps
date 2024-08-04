# Add Homebrew to the PATH
export PATH="/opt/homebrew/bin:$PATH"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install a package if it's not already installed
install_if_needed() {
    if ! command_exists "$1"; then
        echo "Installing $1..."
        brew install "$1"
    else
        echo "$1 is already installed."
    fi
}

# Function to install Docker Desktop
install_docker_desktop() {
    if ! command_exists "docker"; then
        echo "Installing Docker Desktop..."
        sudo -v
        sudo brew install --cask docker
        echo "Please start Docker Desktop manually and then run 'docker --version' to verify the installation."
    else
        echo "Docker Desktop is already installed."
    fi
}

# Ensure Homebrew is installed
if ! command_exists "brew"; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install packages
install_if_needed "docker"
install_if_needed "ansible"
install_if_needed "git"
install_if_needed "kubectl"
install_docker_desktop
install_if_needed "python"
install_if_needed "jq"

# Source the .zshrc file to apply changes
echo "Sourcing .zshrc to apply changes..."
source ~/.zshrc

# Print versions to verify installations
echo "Verifying installations..."
docker --version
ansible --version
git --version
kubectl version --client
python --version
jq --version

echo "Installation script completed."

