#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting local sync for Echo submodule..."

MAIN_REPO_DIR=$(pwd)
SUBMODULE_DIR="Echo"
SUBMODULE_REMOTE_BRANCH="master" # Or 'main', depending on Echo's default branch

# --- Step 1: Check for changes in the Echo submodule ---
cd "$SUBMODULE_DIR"

echo "Checking for changes in $SUBMODULE_DIR..."
LOCAL_STATUS=$(git status --porcelain)

if [ -n "$LOCAL_STATUS" ]; then
  echo "Changes detected in $SUBMODULE_DIR. Committing and pushing..."
  git add .
  git commit -m "Automated: Sync changes from main repo to Echo submodule (local script)"
  git push origin "$SUBMODULE_REMOTE_BRANCH"
  echo "Changes pushed to $SUBMODULE_DIR remote."
else
  echo "No local changes detected in $SUBMODULE_DIR."
fi

cd "$MAIN_REPO_DIR"

# --- Step 2: Update main repository's reference to the Echo submodule ---
echo "Updating main repository's reference to $SUBMODULE_DIR..."
git add "$SUBMODULE_DIR"

# Check if there are actual changes to commit for the submodule reference
if git diff --cached --quiet "$SUBMODULE_DIR"; then
  echo "No change in $SUBMODULE_DIR reference in main repository."
else
  echo "Committing $SUBMODULE_DIR reference update in main repository..."
  git commit -m "Automated: Update $SUBMODULE_DIR reference after local sync"
  echo "Pushing main repository..."
  git push origin master # Or 'main', depending on your main repo's default branch
  echo "Main repository pushed."
fi

echo "Local sync for Echo submodule completed."
