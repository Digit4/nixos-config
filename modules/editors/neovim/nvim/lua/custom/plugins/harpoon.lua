local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- basic telescope configuration
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
	{ desc = "Open harpoon window" })
vim.keymap.set("n", "<C-d>", function() harpoon:list():remove(selected_entity) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Go to mark [1]" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Go to mark [2]" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Go to mark [3]" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Go to mark [4]" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Go to mark [5]" })
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Go to mark [6]" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<F9>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<F10>", function() harpoon:list():next() end)

harpoon:extend({
	UI_CREATE = function(cx)
		vim.keymap.set("n", "<C-v>", function()
			harpoon.ui:select_menu_item({ vsplit = true })
		end, { buffer = cx.bufnr })

		vim.keymap.set("n", "<C-x>", function()
			harpoon.ui:select_menu_item({ split = true })
		end, { buffer = cx.bufnr })

		vim.keymap.set("n", "<C-t>", function()
			harpoon.ui:select_menu_item({ tabedit = true })
		end, { buffer = cx.bufnr })
	end,
})

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" }
}
