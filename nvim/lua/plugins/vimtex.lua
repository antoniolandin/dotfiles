return {
	"lervag/vimtex",
	lazy = false, -- lazy-loading will disable inverse search
	config = function()
		vim.api.nvim_create_autocmd({ "FileType" }, {
			group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
			pattern = { "bib", "tex" },
			callback = function()
				vim.wo.conceallevel = 0
			end,
		})

		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
		vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

		-- Configure vimtex with tdf viewer
		vim.g.vimtex_view_method = "general"
		vim.g.vimtex_view_general_viewer = "tdf"
		vim.g.vimtex_view_general_options = "@pdf"
		vim.g.vimtex_view_automatic = 1 -- Auto-open on compilation
		vim.g.vimtex_pdf_output_dir = "build" -- Relative to tex root (or use absolute path)

		_G.tdf_viewer = function(status)
			if not status or not vim.b.vimtex then
				return
			end

			-- Get output directory (falls back to tex root if not set)
			local output_dir = vim.g.vimtex_pdf_output_dir or vim.b.vimtex.root
			local pdf_path = vim.fn.fnamemodify(
				output_dir .. "/" .. vim.b.vimtex.name .. ".pdf",
				":p" -- Convert to absolute path
			)

			-- Create directory if it doesn't exist
			if vim.g.vimtex_pdf_output_dir then
				vim.fn.mkdir(output_dir, "p")
			end

			vim.fn.system({
				"kitty",
				"@",
				"kitten",
				"tdf_handler.py",
				pdf_path,
			})
		end

		-- Close tdf when Vimtex stops
		_G.tdf_close = function()
			vim.fn.system({
				"kitty",
				"@",
				"close-window",
				"--match",
				"title:tdf",
			})
		end

		-- Set up autocommands
		vim.api.nvim_create_augroup("vimtex_tdf", { clear = true })

		-- Open viewer on compilation start
		vim.api.nvim_create_autocmd("User", {
			group = "vimtex_tdf",
			pattern = "VimtexEventCompileStarted",
			callback = function()
				if vim.g.vimtex_view_automatic == 1 then
					_G.tdf_viewer(true)
				end
			end,
		})

		-- Close viewer when compilation stops
		vim.api.nvim_create_autocmd("User", {
			group = "vimtex_tdf",
			pattern = "VimtexEventCompileStopped",
			callback = _G.tdf_close,
		})

		vim.g.vimtex_view_skim_sync = 1
		vim.g.vimtex_view_skim_activate = 1
		vim.g.vimtex_view_skim_reading_bar = 1
	end,
}
