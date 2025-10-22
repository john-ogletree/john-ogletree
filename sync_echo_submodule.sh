#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting comprehensive local sync for Echo submodule..."

MAIN_REPO_DIR=$(pwd)
SUBMODULE_DIR="Echo"
SUBMODULE_REMOTE_BRANCH="master" # Or 'main', depending on Echo's default branch
MAIN_REPO_BRANCH="master" # Or 'main', depending on your main repo's default branch

# --- Part 1: Main-to-Submodule Sync ---
# Check for local changes in the Echo submodule within the main repo's working tree
cd "$SUBMODULE_DIR"

echo "Checking for local changes in $SUBMODULE_DIR (Main-to-Submodule Sync)..."
LOCAL_STATUS=$(git status --porcelain)

if [ -n "$LOCAL_STATUS" ]; then
  echo "Local changes detected in $SUBMODULE_DIR. Committing and pushing to submodule's remote..."
  git add .
  git commit -m "Automated: Sync changes from main repo to Echo submodule (local script)"
  git push origin "$SUBMODULE_REMOTE_BRANCH"
  echo "Changes pushed to $SUBMODULE_DIR remote."
else
  echo "No local changes detected in $SUBMODULE_DIR for Main-to-Submodule Sync."
fi

cd "$MAIN_REPO_DIR"

# --- Part 2: Submodule-to-Main Sync ---
# Check if the Echo submodule's remote has new commits and update main repo's reference
echo "Checking for new commits in $SUBMODULE_DIR's remote (Submodule-to-Main Sync)..."

# Ensure the submodule is initialized and updated
git submodule update --init --recursive

cd "$SUBMODULE_DIR"
git fetch origin "$SUBMODULE_REMOTE_BRANCH":"refs/remotes/origin/$SUBMODULE_REMOTE_BRANCH"
LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse origin/"$SUBMODULE_REMOTE_BRANCH")

if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
  echo "New commits detected in $SUBMODULE_DIR's remote. Updating local submodule and main repo reference..."
  git pull origin "$SUBMODULE_REMOTE_BRANCH" # Pull latest changes into local submodule
  cd "$MAIN_REPO_DIR"
  git add "$SUBMODULE_DIR"
  git commit -m "Automated: Update $SUBMODULE_DIR reference from its remote (local script)"
  git push origin "$MAIN_REPO_BRANCH"
  echo "Main repository updated with new $SUBMODULE_DIR reference."
else
  echo "No new commits detected in $SUBMODULE_DIR's remote for Submodule-to-Main Sync."
  cd "$MAIN_REPO_DIR" # Ensure we are back in main repo even if no changes
fi

# --- Part 3: Final check and push for main repository changes (if any from Part 1) ---
echo "Final check for main repository changes and pushing..."
if git diff --cached --quiet || ! git diff --quiet; then
  echo "No pending changes in main repository to push."
else
  echo "Pushing any pending main repository changes..."
  git push origin "$MAIN_REPO_BRANCH"
  echo "Main repository pushed."
fi

echo "Comprehensive local sync for Echo submodule completed."