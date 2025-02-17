return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- event = "VeryLazy",
    lazy = false,
    keys = {
        { "<leader>e", vim.cmd.Oil, "Oil" },
        { "-",         vim.cmd.Oil, "Oil" },
    },
    config = function()
        local git_ignored = setmetatable({}, {
            __index = function(self, key)
                local proc = vim.system(
                    { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
                    {
                        cwd = key,
                        text = true,
                    }
                )
                local result = proc:wait()
                local ret = {}
                if result.code == 0 then
                    for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
                        -- Remove trailing slash
                        line = line:gsub("/$", "")
                        table.insert(ret, line)
                    end
                end

                rawset(self, key, ret)
                return ret
            end,
        })

        local keymaps = {
            ["<C-h>"] = false,
            ["<C-s>"] = false,
            ["<leader>v"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
            ["<leader>h"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        }
        require("oil").setup({
            default_file_explorer = false,
            keymaps = keymaps,
            view_options = {
                show_hidden = false,
            },

            buf_options = {
                buflisted = true,
                bufhidden = "hide",
            },
        })

        require("oil.config").setup({
            default_file_explorer = true,
            keymaps = keymaps,
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = false,
                -- This function defines what is considered a "hidden" file
                is_hidden_file = function(name, bufnr)
                    local dir = vim.api.nvim_buf_get_name(bufnr)

                    local newPath = dir.gsub(dir, "oil://", "")

                    local function is_symlink(filepath)
                        local lstat = vim.uv.fs_lstat(filepath)
                        if lstat then
                            return lstat.type == 'link'
                        else
                            print("Error: Could not retrieve file attributes for " .. filepath)
                            return false
                        end
                    end
                    local function join_paths(dirname, filename)
                        local sep = package.config:sub(1, 1) -- This gives the path separator ('/' or '\')
                        return dirname .. sep .. filename
                    end

                    local nPath = join_paths(newPath, name)
                    if is_symlink(nPath) then
                        return true
                    end

                    local cur_dir = require("oil").get_current_dir()
                    -- if no local directory (e.g. for ssh connections), always show
                    if not cur_dir then
                        return false
                    end
                    -- Check if file is gitignored
                    if vim.list_contains(git_ignored[cur_dir], name) then
                        return true
                    end

                    if vim.startswith(name, "test-results") or
                        vim.startswith(name, "ya.make") or
                        vim.startswith(name, "gotest") or
                        vim.startswith(name, "__pycache__") or
                        vim.startswith(name, "node_modules") or
                        vim.startswith(name, ".") then
                        return true
                    end


                    return false
                end,
            }
        })
        if vim.fn.exists("#FileExplorer") then
            vim.api.nvim_create_augroup("FileExplorer", { clear = true })
        end
    end,
}
