#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# user and repository innformation
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API

function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "${url}"
}

function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access

    if [[ -z $collaborators ]]
    then 
        echo "No users with read access found for repo ${REPO_OWNER}/${REPO_NAME}.."
    else    
        echo "Users with read access to repo ${REPO_OWNER}/${REPO_NAME}"
        echo "$collaborators"
    fi

}

# Helper function to pass required args

function helper {
    if [[ $# -ne 2 ]]
    then 
        echo "please pass the required arguments to the script."
        exit 1
    fi
}

echo "Listing users with read access to repo ${REPO_OWNER}/${REPO_NAME}"
helper
list_users_with_read_access