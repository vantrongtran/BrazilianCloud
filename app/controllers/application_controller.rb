class ApplicationController < ActionController::Base
  include ErrorHandlerConcern

  before_action :authenticate_user!
end
