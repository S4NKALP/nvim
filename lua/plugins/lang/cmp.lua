local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip/loaders/from_vscode').lazy_load()

local icons = require('lib.icons')
local kind_icons = icons.kind

local max_count = 15
      local rounded_border = true

      local function border(hl_name)
         if rounded_border then
            return {
               { "╭", hl_name },
               { "─", hl_name },
               { "╮", hl_name },
               { "│", hl_name },
               { "╯", hl_name },
               { "─", hl_name },
               { "╰", hl_name },
               { "│", hl_name },
            }
         else
            return {
               { "┌", hl_name },
               { "─", hl_name },
               { "┐", hl_name },
               { "│", hl_name },
               { "┘", hl_name },
               { "─", hl_name },
               { "└", hl_name },
               { "│", hl_name },
            }
         end
      end

      --   פּ ﯟ   some other good icons
      local kind_icons = {
         Text          = "",
         Method        = " '",
         Function      = "󰊕",
         Constructor   = "󰈏",
         Field         = "",
         Variable      = "",
         Class         = "",
         Interface     = "",
         Module        = "",
         Property      = "",
         Unit          = "",
         Value         = " ",
         Enum          = " ",
         Keyword       = "",
         Snippet       = "",
         Color         = "",
         File          = " ",
         Reference     = "",
         Folder        = "",
         EnumMember    = "",
         Constant      = "",
         Struct        = "",
         Event         = "",
         Operator      = "",
         TypeParameter = "",
      }

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,preview,noselect',
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.config.disable,
        ['<C-c>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        expandable_indicator = true,
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = kind_icons[vim_item.kind]
            vim_item.menu = ({
                codeium = '[Codeium]',
                nvim_lsp = '[LSP]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                path = '[Path]',
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'codeium'},
        { name = 'lazydev', group_index = 0 },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = {
            border = 'rounded',
            winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
            max_height = 15,
            scrollbar = false,
        },
        completion = {
            border = 'rounded',
            winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
            scrollbar = false,
        },
    },
    experimental = {
        ghost_text = true
    }
})

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/','?'}, {
         formatting = {
            fields = { "kind", "abbr" },
            format = function(entry, vim_item)
               -- Kind icons
               vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
               vim_item.menu = ({
                  buffer = "(buffer)"
               })[entry.source.name]
               return vim_item
            end,
         },
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            {
               name = 'buffer',
               option = { max_item_count = max_count }
            }
         }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
         formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
               -- Kind icons
               vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
               vim_item.menu = ({
                  buffer = "(buffer)",
                  path = "(path)",
               })[entry.source.name]
               return vim_item
            end,
         },
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            {
               name = 'path',
               option = { max_item_count = 10 }
            }
         },
         {
            {
               name = 'cmdline',
               option = { max_item_count = 10 }
            }
         })
      })

      cmp.setup.filetype("lua", {
         sources = cmp.config.sources({
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'nvim_lsp' },
            {
               name = "nvim_lua",
               option = { max_item_count = max_count }
            },
            {
               name = 'buffer',
               option = { keyword_length = 1 }
            },
            { name = "path" },
            { name = "orgmode" },
         }),
      })

      cmp.setup.filetype("norg", {
         sources = cmp.config.sources({
            { name = 'luasnip' }, -- For luasnip users.
            {
               name = 'neorg',
               option = { max_item_count = max_count }
            },
            { name = 'buffer', },
            { name = "path" },
         })
      })

require("luasnip.loaders.from_vscode").lazy_load()
local snippet_path = vim.fn.stdpath("config") .. "/snippets"
require("luasnip.loaders.from_snipmate").load({ path = { snippet_path } })


