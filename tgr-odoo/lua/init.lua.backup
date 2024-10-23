-- Plugin: odoo.nvim
-- Archivo: lua/odoo/init.lua

local M = {}

-- Configuración por defecto
M.config = {
	-- Rutas de búsqueda para módulos Odoo
	odoo_paths = {
		"~/odoo/addons",
		"./addons",
		"./custom_addons",
	},
	-- Extensiones de archivo para buscar
	file_patterns = {
		"*.py",
		"*.xml",
		"*/__manifest__.py",
	},
	-- Comandos personalizados
	commands = {
		enable = true,
	},
	-- Integración con LSP
	lsp = {
		enable = true,
		python_path = vim.fn.exepath("python3"),
	},
}

-- Función de configuración
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	-- Registrar comandos de Neovim
	if M.config.commands.enable then
		M.create_commands()
	end

	-- Configurar autocompletado y LSP
	if M.config.lsp.enable then
		M.setup_lsp()
	end

	-- Configurar keymaps
	M.setup_keymaps()
end

-- Función para registrar comandos
function M.create_commands()
	vim.api.nvim_create_user_command("OdooGotoModel", function(opts)
		require("odoo.navigation").goto_model(opts.args)
	end, {
		nargs = 1,
		complete = function()
			return require("odoo.utils").list_models()
		end,
	})

	vim.api.nvim_create_user_command("OdooGotoView", function(opts)
		require("odoo.navigation").goto_view(opts.args)
	end, {
		nargs = 1,
		complete = function()
			return require("odoo.utils").list_views()
		end,
	})
end

-- Función para configurar LSP
function M.setup_lsp()
	local lspconfig = require("lspconfig")

	-- Configurar el servidor LSP de Python con conocimiento específico de Odoo
	lspconfig.pyright.setup({
		settings = {
			python = {
				analysis = {
					extraPaths = M.config.odoo_paths,
				},
			},
		},
	})
end

-- Función para configurar keymaps
function M.setup_keymaps()
	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true }

	-- Navegación rápida
	keymap("n", "<Leader>om", ":OdooGotoModel ", opts)
	keymap("n", "<Leader>ov", ":OdooGotoView ", opts)

	-- Más keymaps específicos de Odoo...
end

return M
