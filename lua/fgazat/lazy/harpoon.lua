return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    commit = "7fd419b3231da33f32a5d31d1f4a06d61f815556",
    keys = {
        { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Add file" },
        { "<leader>0",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle menu" },
        { "<leader>1", function() require("harpoon.ui").nav_file(1) end,         desc = "" },
        { "<leader>2", function() require("harpoon.ui").nav_file(2) end,         desc = "" },
        { "<leader>3", function() require("harpoon.ui").nav_file(3) end,         desc = "" },
        { "<leader>4", function() require("harpoon.ui").nav_file(4) end,         desc = "" },
        { "<leader>5", function() require("harpoon.ui").nav_file(5) end,         desc = "" },
    }
}
