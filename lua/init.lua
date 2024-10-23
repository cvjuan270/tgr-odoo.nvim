-- Configuración principal del plugin
local M = {}

-- Función para inicializar el plugin
function M.setup(opts)
	-- Configuraciones predeterminadas
	M.options = opts or {}

	-- Aquí cargaremos nuestras funciones
	M.load_navigation()
	M.setup_autocomplete()
	M.setup_orm_management()
end

-- Funciones del plugin
function M.load_navigation()
	print("Navegación para Odoo cargada")
end

function M.setup_autocomplete()
	print("Autocompletado específico de Odoo activado")
end

function M.setup_orm_management()
	print("Gestión del ORM de Odoo configurada")
end

return M
