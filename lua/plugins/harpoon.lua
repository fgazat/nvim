return {
    "ThePrimeagen/harpoon",
    commit = "7fd419b3231da33f32a5d31d1f4a06d61f815556",
    keys = {
        { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Add file" },
        { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle menu" },
        { "<C-h>",     function() require("harpoon.ui").nav_file(1) end,         desc = "" },
        { "<C-y>",     function() require("harpoon.ui").nav_file(2) end,         desc = "" },
        { "<C-n>",     function() require("harpoon.ui").nav_file(3) end,         desc = "" },
        { "<C-s>",     function() require("harpoon.ui").nav_file(4) end,         desc = "" },
    }
}
