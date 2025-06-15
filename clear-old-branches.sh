#!/bin/bash
# Clear Old Branches - Cross Platform Git Branch Cleanup
# This script removes local branches that have been deleted from the remote

set -e

echo "🧹 Clearing old branches..."
echo "Switching to main branch..."
git checkout main

echo "Updating remote references and pruning..."
git remote update origin --prune

echo "Finding branches to delete..."
branches_to_delete=$(git branch -vv | grep ': gone]' | awk '{print $1}' || true)

if [ -z "$branches_to_delete" ]; then
    echo "✅ No old branches found to delete."
else
    echo "🗑️  Deleting the following branches:"
    echo "$branches_to_delete"
    echo "$branches_to_delete" | xargs -r git branch -D
    echo "✅ Old branches cleared successfully!"
fi
