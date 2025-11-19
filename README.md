# FU4Y-Config

Personal configuration toolkit and dotfiles — my essential setup for development across Windows and Linux. This repository contains my terminal/PowerShell configuration, Neovim (LazyVim) configuration, helper scripts, and a small `requirements.txt` for Python packages I frequently use.

> ⚠️ This is a personal config repo. Remove or sanitize any absolute paths, secrets, or machine-specific data before sharing publicly.

---

## Contents

* `nvim/` — Neovim configuration (Lua, LazyVim-compatible files).
* `powershell-config/` — PowerShell profile scripts and Windows Terminal settings snippets.
* `requirements.txt` — Python packages for fast environment bootstrapping.
* `scripts/` *(optional)* — Helper install or bootstrap scripts (PowerShell/Bash).
* Misc config snippets and notes.

---

## Goals

* Keep my development environment reproducible across devices.
* Centralize Neovim + LazyVim settings and plugin choices.
* Store PowerShell and Windows Terminal tweaks for quick setup on Windows machines.

---

## Quick install

> These instructions are intentionally minimal. Adjust for your OS and environment.

### 1) Clone the repo

```bash
git clone https://github.com/Riftcow/FU4Y-Config.git
cd FU4Y-Config
```

### 2) (Optional) Install Python packages

```bash
python -m pip install -r requirements.txt
```

### 3) Install / link Neovim config (Linux / macOS)

```bash
# backup existing config
[ -d "$HOME/.config/nvim" ] && mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup"
# symlink
ln -s "$PWD/nvim" "$HOME/.config/nvim"
# start nvim to let the plugin manager install
nvim
```

Windows (PowerShell):

```powershell
# Back up existing config if present
if (Test-Path $env:LOCALAPPDATA\nvim) { Rename-Item $env:LOCALAPPDATA\nvim "$env:LOCALAPPDATA\nvim.backup" }
# Copy config
Copy-Item -Path "$PWD\nvim\*" -Destination "$env:LOCALAPPDATA\nvim" -Recurse -Force
nvim
```

> If the repo uses LazyVim or another plugin manager, follow that manager's plugin installation instructions (they usually run on first `nvim` start or provide a headless install command).

### 4) Windows Terminal / PowerShell

* Import Terminal `settings.json` via the Terminal UI or place a settings file in the appropriate settings folder.
* For PowerShell profile scripts, back up your existing profile: `Copy-Item $profile "$profile.backup"` then copy the provided profile script from `powershell-config/` to your `$profile` path and restart the terminal.

---

## Files & structure (example)

```
FU4Y-Config/
├─ nvim/                     # init.lua, lua/plugins, etc.
├─ powershell-config/        # PowerShell profile(s), helper scripts
├─ requirements.txt          # pip install -r requirements.txt
├─ scripts/                  # (optional) install scripts
└─ README.md
```

---

## Customization tips

* Read `nvim/lua` plugin config to tweak keymaps and LSP settings.
* Keep machine-specific settings out of tracked files (use `.env` or local-only dotfiles).
* Use a branch for experiments so `main` is stable.

---

## Automation (optional)

If you'd like, I can add simple install scripts:

* `bootstrap.sh` for Linux/macOS (creates backups, symlinks, installs pip reqs).
* `bootstrap.ps1` for Windows (copies files, installs pip reqs, configures PowerShell profile).

Tell me which OS to target and I will add them.

---

## Contributing

This is a personal config repo. Contributions are welcome — fork and open a pull request. If you send PRs, keep changes isolated and document any behavior changes.

