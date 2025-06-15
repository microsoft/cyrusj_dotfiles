# cyrusj_dotfiles

General dotfile repo used to consolidate all my personal settings and configurations

## Git Configuration

### Files

- `.gitconfig` - Git configuration with user settings, aliases, and color preferences

### Installation

To install the git configuration:

```bash
./install_git.sh
```

This will:

1. Backup your existing `.gitconfig` (if any) to `~/.dotfiles_backup/`
2. Install the new `.gitconfig` to your home directory
3. Verify the installation

### Manual Installation

Alternatively, you can manually copy the configuration:

```bash
cp .gitconfig ~/.gitconfig
```

### Features

- User information (name and email)
- Helpful aliases (st, co, br, ci, etc.)
- Color-coded output for better readability
- Git LFS support
- Sensible defaults for push/pull behavior
- **Clear Old Branches** - Cross-platform branch cleanup functionality

## Branch Cleanup

This repository includes a cross-platform "Clear Old Branches" feature that removes local branches that have been deleted from the remote repository.

### Usage Options

1. **Git Alias** (Recommended): `git clear-old-branches`
2. **VS Code Task**: Use `Ctrl+Shift+P` → "Tasks: Run Task" → "Clear Old Branches"
3. **Bash Script**: `./clear-old-branches.sh`
4. **PowerShell Script**: `./Clear-OldBranches.ps1`

### What it does

1. Switches to the main branch
2. Updates remote references and prunes deleted branches
3. Identifies local branches that track deleted remote branches
4. Safely deletes those local branches

This is equivalent to the PowerShell command:
```powershell
git checkout main; git remote update origin --prune; git branch -vv | Select-String -Pattern ": gone]" | % { $_.toString().Trim().Split(" ")[0]} | % {git branch -D $_}
```
