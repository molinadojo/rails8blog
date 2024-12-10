class ApplicationController < ActionController::Base
  # Solo permitir usuarios autenticados para cualquier acción
  before_action :authenticate_user!

  # Permitir solo navegadores modernos que soporten características como WebP, web push, etc.
  allow_browser versions: :modern
end
