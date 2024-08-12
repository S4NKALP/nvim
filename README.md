<div align = "center">

<h1>nvim</h1>

<a href="https://github.com/S4NKALP/nvim/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/S4NKALP/nvim?style=flat&color=eee&label="> </a>

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

<h3>Your Personalized Development Environment ❤️👨‍💻</h3>

<figure>
  <img src= "images/nvim.png" alt="nvim Demo">
  <br/>
  <figcaption>nvim screenshot</figcaption>
</figure>

</div>

Handcrafted Neovim setup for the ultimate CLI dev experience.

## ✨ Features

- **Fully configured LSP**: Out of the box LSP and completions, including Copilot (optional)
- **Awesome keybindings**: Intuitive and well documented keybindings with which-key
- **Blazingly fast**: Starts up in less than 30ms thanks to extensive lazy loading
- **Batteries included**: Has all the necessary plugins included out of the box
- **Git in there**: Powerful git integrations thanks to lazygit, fugitive, gitsigns and more
- **Pretty colors**: Comes with treesitter and dracula preconfigured with full transparency support
- **Goto for notes**: Comes with powerful note-taking capabilities, thanks to [tdo](https://github.com/2kabhishek/tdo)
- **Tmux integration**: Works with your tmux configurations out of the box
- **Dev tools**: Comes with debugging, testing, database and REPL support, pick and choose
- **Auto install**: All necessary LSPs, Null LS sources, Treesitter Parsers etc. are auto installed
- **User module**: Configure nvim according to your needs by using the `user` module!
- and some more

Most importantly:

**Built for extending**: nvim has a easy to understand config structure that promotes personalization, so go ahead, bring your keybindings, functions and plugins over, and truly make **nvim: Your Personalized Development Environment!**

## ⚡ Setup

### ⚙️ Requirements

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of `neovim`
- Python provider is necessary for some operations: `pip install neovim`
- Some command line tools: fd, ripgrep

- To use nvim for notes, take a look at [tdo.nvim](https://github.com/2kabhishek/tdo.nvim)

### 💻 Installation

To install `nvim` clone the repo and setup the symlink

```bash
git clone https://github.com/S4NKALP/nvim
```

On Linux and Mac

```bash
ln -sfnv $PWD/nvim $HOME/.config/nvim
```

On Windows Powershell

```powershell
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$PWD\nvim" -Force
```

## 🚀 Usage

Edit files in [lua/core](./lua/core/) for tweaking [options](./lua/core/options.lua), and to add/remove [functions](./lua/core/functions.lua) and [autocmds](./lua/core/autocmd.lua)

### 📦 Plugins

To add new plugins add it to the [plugins list](./lua/plugins/list.lua)

For plugin configs you can place them in these folders based on the functionality:

- [lang](./lua/plugins/lang/): Plugins related to language features, completions, lsp, debugging etc.
- [tools](./lua/plugins/tools/): General purpose tool plugins that aid in the editing experience.
- [ui](./lua/plugins/ui/): Cosmetic plugins that make neovim pretty.

### ⌨️ Keybindings

Find the [keybinding manual here](./docs/keybindings.md).

If you want to change functionality of a core keybinding, edit [core/keys](./lua/core/keys.lua)

To add new keybindings edit the [which-key config](./lua/plugins/tools/which-key.lua)

### 🎨 User Configs

`nvim` supports a user module where you can store your custom configs, these will always override the default configs, whenever there is a clash.

To use custom configs create the file `lua/user/init.lua`, you can structure your configs as you like there.

> `lua/user/init.lua` must be present to load custom configs, `require` any custom modules in this file.

`user` module is not part of the repo, you can set up `user` module as a separate git repository while continuously receiving `nvim2k` updates.

#### 🤖 Auto Install

By default nvim will auto install a set of LSP servers and null-ls sources using mason, if you want to disable it make sure to add the following to your user module.

```lua
-- lua/user/init.lua
local user = {
    auto_install = true,
}

return user
```

To setup and access other user options you can use the `get_user_config(key, default)` method in `lib.util`

Example: `local auto_install = require('lib.util').get_user_value('auto_install', true)`

## 🧑‍💻 Behind The Code

### 🌈 Inspiration

I have been using vim/neovim for  years now, I wanted to share my config for everyone to use

### 💡 Challenges/Learnings

- Finding out the right plugins and configs!
- Setting up the initial config structure with lazy loading was tough.

### 🧰 Tools Used

- [dots](https://github.com/S4NKALP/hyprland) — Desktop Environment
- [nvim](https://github.com/S4NKALP/nvim) — Personalized Editor

<hr>

<div align="center">

<strong>⭐ hit the star button if you found this useful ⭐</strong><br>

</div>
