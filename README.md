📁 Datastore Renaming Automation Script

This PowerShell script automates the renaming of datastores in a VMware vSphere environment using VMware PowerCLI. It allows administrators to efficiently rename datastores based on a specified naming convention, enhancing consistency and manageability across the infrastructure.

🔧 Features

Dynamic Renaming: Automatically renames datastores by inserting a specified suffix (e.g., -xr-srv001) after the site code in the datastore name.

Flexible Input: Prompts the user for the vCenter server's FQDN or IP address and the site code at runtime, eliminating the need for hardcoded values.

Selective Processing: Targets only datastores whose names start with the specified site code, ensuring that only relevant datastores are renamed.

Safety Checks: Skips renaming for datastores that already contain the specified suffix, preventing redundant operations.

⚙️ Prerequisites

PowerShell 5.1 or later.

VMware PowerCLI module installed.

Valid credentials with appropriate permissions to manage datastores in the vSphere environment.

📝 Usage Instructions

Open PowerShell as an administrator.

Run the script by entering:

.\Rename-Datastore.ps1


When prompted, enter the vCenter server's FQDN or IP address.

Provide the site code when prompted.

The script will process each datastore, renaming those that match the specified criteria.
