<p align="center">
  <img src="assets/screenshot.png" alt="screenshot">
</p>

<h1 align="center">NEOVIM</h1>

<p align="center">

 <a href="https://github.com/S4NKALP/nvim/graphs/contributors">
<img alt="People" src="https://img.shields.io/github/contributors/S4NKALP/nvim?style=flat&color=ffaaf2&label=People"> </a>

<a href="https://github.com/S4NKALP/nvim/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/S4NKALP/nvim?style=flat&color=98c379&label=Stars"></a>

<a href="https://github.com/S4NKALP/nvim/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/S4NKALP/nvim?style=flat&color=66a8e0&label=Forks"> </a>

<a href="https://github.com/S4NKALP/nvim/watchers">
<img alt="Watches" src="https://img.shields.io/github/watchers/S4NKALP/nvim?style=flat&color=f5d08b&label=Watches"> </a>

<a href="https://github.com/S4NKALP/nvim/pulse">
<img alt="Last Updated" src="https://img.shields.io/github/last-commit/S4NKALP/nvim?style=flat&color=e06c75&label="> </a>
</p>

<p align="center">
  <strong>Welcome to my personalized Neovim setup 👨‍💻</strong>
  <br>
    Optimized for a smooth and efficient coding experience.
  <br>
  <br>
  <a href="https://github.com/S4NKALP/nvim/wiki">Documentation</a>
  ·
  <a href="https://github.com/S4NKALP/nvim/issues">Report a Bug</a>
  ·
  <a href="https://github.com/S4NKALP/nvim/issues">Request a Feature</a>
</p>

<br>

## Highlights

- **Modular Structure**: Organized Lua scripts for readability and easy customization.
- **Language Support**: Automated setup for various languages using Mason.nvim.
- **Keybindings**: Streamlined shortcuts for productivity, detailed in `lua/plugins/tools/whichkey.lua`.
- **Plugins**: Handpicked plugins managed via Lazy.nvim for enhanced functionality.

## System dependencies

Important system dependencies:

- **Nerd fonts** ([information source](https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0)):

  - Download a [Nerd Font](https://www.nerdfonts.com/) (good choice is "JetBrainsMono Nerd Font").
  - Unzip and copy to '~/.local/share/fonts'.
  - Run the command `fc-cache -fv` to manually rebuild the font cache.

- **Tools for finding stuff**:
  - [ripgrep](https://github.com/BurntSushi/ripgrep#installation)

## Installation

Delete old nvim configuration

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

Clone the repository to ~/.config

```bash
git clone --filter=blob:none https://github.com/S4NKALP/nvim.git ~/.config/nvim
```

Run neovim to complete the setup

```bash
nvim
```

### Customization

Feel free to modify and adapt my configuration to your own needs!

### 🧰 Tools Used

- [dots](https://github.com/S4NKALP/hyprland) — Dev Environment
- [nvim](https://github.com/S4NKALP/nvim) — Personalized Editor

<div align="center">
    <strong>⭐ hit the star button if you found this useful ⭐</strong><br>
</div>
