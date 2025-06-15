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
