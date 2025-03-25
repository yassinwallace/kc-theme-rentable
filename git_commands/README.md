# Git Workflow Scripts for Keycloak Theme Development

This folder contains PowerShell scripts to help manage your git workflow when developing Keycloak themes. These scripts are designed to make git operations safer and more consistent, helping you avoid common issues like detached HEAD states.

## Available Scripts

### 0_push.ps1
A comprehensive script that combines all git operations in one place. This interactive script allows you to:
- Check your current git status
- Commit changes
- Push changes to the remote repository
- Perform both commit and push in one operation

**Usage:**
```powershell
.\0_push.ps1
```
Then follow the interactive prompts.

### 1_status.ps1
Checks and displays your current git status, including branch information.

**Usage:**
```powershell
.\1_status.ps1
```

### 2_commit.ps1
Safely commits your changes with a specified commit message.

**Usage:**
```powershell
.\2_commit.ps1 -CommitMessage "Your commit message here"
```

### 3_push.ps1
Pushes committed changes to the remote repository.

**Usage:**
```powershell
.\3_push.ps1
```

### 4_switch_branch.ps1
Safely switches between branches, checking for uncommitted changes first.

**Usage:**
```powershell
.\4_switch_branch.ps1 -BranchName "branch-name"
```

### 5_recover.ps1
Helps recover from common git issues, such as detached HEAD states.

**Usage:**
```powershell
.\5_recover.ps1
```

## Keycloak Theme Development Guidelines

Remember these important guidelines when developing your Keycloak theme:

1. **Never modify the base theme directly**
   - The `base` folder contains the original untouched theme from Keycloak
   - Always keep this as a reference and never modify these files

2. **Copy files from base to rentable before modifying**
   - When you need to customize a component, first copy it from `base` to `rentable`
   - Then make your modifications to the copy in the `rentable` folder

3. **All customizations go into the rentable folder**
   - The `rentable` custom theme inherits from the base theme
   - It should contain only the modified elements

## Design Guidelines

The theme follows these design principles:
- Simple white card on a light background
- "Rentable" as the main title
- Clean form inputs
- Blue primary buttons
- Google sign-in option
- Minimalist approach with good whitespace
