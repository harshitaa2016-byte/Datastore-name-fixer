ESXi Host Management Script

This PowerShell script automates the management of ESXi hosts by enabling SSH services and ensuring hosts exit maintenance mode using VMware PowerCLI.

🔧 Features

Connects to specified ESXi hosts using provided credentials.

Checks if each host is in maintenance mode and exits it if true.

Enables and starts the SSH service on each host.

Sets the SSH service to start automatically on boot.

🧰 Prerequisites

PowerShell 5.1 or later.

VMware PowerCLI module installed.

Valid credentials with appropriate permissions to manage ESXi hosts.

⚙️ Usage

Open PowerShell as an administrator.

Run the script by entering:

.\Enable-SSH-ESXi.ps1
