-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<F5>"] = {
            function()
              -- Automatically use launch.json if it exist
              local json_path = vim.fn.getcwd() .. "/launch.json"
              print("local json path found " .. json_path)
              if vim.fn.filereadable(json_path) then require("dap.ext.vscode").load_launchjs(json_path) end
              -- Python Anaconda support (use currently active environment)
              if vim.fn.environ()["CONDA_PREFIX"] ~= nil then
                for _, conf in ipairs(require("dap").configurations.python) do
                  print(vim.fn.environ()["CONDA_PREFIX"])
                  conf.pythonPath = vim.fn.environ()["CONDA_PREFIX"] .. "/bin/python"
                end
              end
              -- Start debug
              require("dap").continue()
            end
          },
          ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<leader>bD"] = {
            function()
              require("astronvim.utils.status").heirline.buffer_picker(
                function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<leader>b"] = { name = "Buffers" },
          ["<A-1>"] = {
            function() require("harpoon.mark").set_current_at(1) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 1",
          },
          ["<A-2>"] = {
            function() require("harpoon.mark").set_current_at(2) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 2",
          },
          ["<A-3>"] = {
            function() require("harpoon.mark").set_current_at(3) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 3",
          },
          ["<A-4>"] = {
            function() require("harpoon.mark").set_current_at(4) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 4",
          },
          ["<A-5>"] = {
            function() require("harpoon.mark").set_current_at(5) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 5",
          },
          ["<A-6>"] = {
            function() require("harpoon.mark").set_current_at(6) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 6",
          },
          ["<A-7>"] = {
            function() require("harpoon.mark").set_current_at(7) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 7",
          },
          ["<A-8>"] = {
            function() require("harpoon.mark").set_current_at(8) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 8",
          },
          ["<A-9>"] = {
            function() require("harpoon.mark").set_current_at(9) end,
            desc = "Harpoon: Set mark for current buffer/file on idx 9",
          },
          ["<leader>1"] = {
            function() require("harpoon.ui").nav_file(1) end,
            desc = "Harpoon: Jump to mark on idx 1",
          },
          ["<leader>2"] = {
            function() require("harpoon.ui").nav_file(2) end,
            desc = "Harpoon: Jump to mark on idx 2",
          },
          ["<leader>3"] = {
            function() require("harpoon.ui").nav_file(3) end,
            desc = "Harpoon: Jump to mark on idx 3",
          },
          ["<leader>4"] = {
            function() require("harpoon.ui").nav_file(4) end,
            desc = "Harpoon: Jump to mark on idx 4",
          },
          ["<leader>5"] = {
            function() require("harpoon.ui").nav_file(5) end,
            desc = "Harpoon: Jump to mark on idx 5",
          },
          ["<leader>6"] = {
            function() require("harpoon.ui").nav_file(6) end,
            desc = "Harpoon: Jump to mark on idx 6",
          },
          ["<leader>7"] = {
            function() require("harpoon.ui").nav_file(7) end,
            desc = "Harpoon: Jump to mark on idx 7",
          },
          ["<leader>8"] = {
            function() require("harpoon.ui").nav_file(8) end,
            desc = "Harpoon: Jump to mark on idx 8",
          },
          ["<leader>9"] = {
            function() require("harpoon.ui").nav_file(9) end,
            desc = "Harpoon: Jump to mark on idx 9",
          },
          ["<A-0>"] = {
            function() require("harpoon.ui").toggle_quick_menu() end,
            desc = "Harpoon: Toggle Quick-Menu",
          },
          ["<leader>m"] = {
            function()
              local peek = require "peek"
              if peek.is_open() then
                peek.close()
              else
                peek.open()
              end
            end,
          }
        }
      }
    }
  }
}
