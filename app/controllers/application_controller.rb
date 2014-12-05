require "application_responder"

class ApplicationController < ActionController::Base

  # Responders
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Decent exposure with strong params
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  # Set locale from params or session
  before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  # Navigation helpers
  include Navigation
end
