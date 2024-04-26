      require("oil").setup({
        use_default_keymaps = false,
        keymaps = {
          ["q"] = "actions.close",
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-\\>"] = "actions.select_split",
          ["<C-enter>"] = "actions.select_vsplit", -- this is used to navigate left
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-r>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["h"] = "actions.toggle_hidden",
        },
        view_options = {
          show_hidden = false,
        },
      })
