local dap = require('dap')
local dapui = require('dapui')
local icons = require('lib.icons')

dapui.setup({
    icons = { expanded = icons.ui.ArrowClosed, collapsed = icons.ui.ArrowOpen },
    mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
    },
    expand_lines = vim.fn.has('nvim-0.7'),
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.25 },
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40,
            position = 'right',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 0.25,
            position = 'bottom',
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = 'rounded',
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
})

vim.fn.sign_define('DapBreakpoint', { text = icons.ui.Bug, texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

dap.adapters.python = {
    type = 'executable',
    command = '/usr/bin/python',
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',

        program = '${file}',
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end,
    },
}

dap.adapters.ruby = {
    type = 'executable',
    command = 'bundle',
    args = { 'exec', 'readapt', 'stdio' },
}

dap.configurations.ruby = {
    {
        type = 'ruby',
        request = 'launch',
        name = 'Rails',
        program = 'bundle',
        programArgs = { 'exec', 'rails', 's' },
        useBundler = true,
    },
}

dap.configurations.java = {
      {
        name = "Debug Launch (2GB)";
        type = 'java';
        request = 'launch';
        vmArgs = "" ..
          "-Xmx2g "
      },
      {
        name = "Debug Attach (8000)";
        type = 'java';
        request = 'attach';
        hostName = "127.0.0.1";
        port = 8000;
      },
      {
        name = "Debug Attach (5005)";
        type = 'java';
        request = 'attach';
        hostName = "127.0.0.1";
        port = 5005;
      },
      {
        name = "My Custom Java Run Configuration",
        type = "java",
        request = "launch",
        -- You need to extend the classPath to list your dependencies.
        -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
        -- classPaths = {},

        -- If using multi-module projects, remove otherwise.
        -- projectName = "yourProjectName",

        -- javaExec = "java",
        mainClass = "replace.with.your.fully.qualified.MainClass",

        -- If using the JDK9+ module system, this needs to be extended
        -- `nvim-jdtls` would automatically populate this property
        -- modulePaths = {},
        vmArgs = "" ..
          "-Xmx2g "
      },
    }


vim.api.nvim_create_user_command('DapUIToggle', function()
    require('dapui').toggle()
end, {})
