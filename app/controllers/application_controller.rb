class ApplicationController < ActionController::Base
  include ErrorHandlerConcern

  before_action :authenticate_user!

  layout :layout

  private

  def layout
    is_a?(Devise::SessionsController) ? "sign_in" : "application"
  end
end
