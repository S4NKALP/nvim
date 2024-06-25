      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
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
          natural_order = true,
          show_hidden = false,
        },
        win_options = {
          wrap = true,
        },
      })
