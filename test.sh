#!/bin/bash

# Version 0.0.1

check_script_update() {
    # GitHub repository URL
    github_repo="https://raw.githubusercontent.com/quorn23/testrepo/main/test.sh"

    # Local path to the script
    local_script_path="/path/to/local/script.sh"

    # Fetch the version string from GitHub
    remote_version=$(curl -s $github_repo | grep -oP '# Version: \K[0-9]+\.[0-9]+\.[0-9]+')

    # Get local version string
    local_version=$(grep -oP '# Version: \K[0-9]+\.[0-9]+\.[0-9]+' $local_script_path)

    # Compare versions
    if [ "$local_version" != "$remote_version" ]; then
        echo "The script has been updated to version $remote_version on GitHub. You may want to pull the latest version."
        
        # Add additional notification logic here, such as sending an email or using a notification service
        # For example, sending an email using mail command:
        # echo "Subject: Script Update Notification" | mail -s "Script Update Notification" your@email.com
    else
        echo "The script is up-to-date (version $local_version)."
    fi
}

# Call the function
check_script_update
