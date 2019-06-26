module ErrorHandlerConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::UnknownAttributeError, ActiveRecord::StatementInvalid, ActiveRecord::RecordInvalid do
      render_error 500
    end

    rescue_from ActiveRecord::RecordNotFound do
      render_error 404
    end

    def not_found
      render_error 404
    end

    def internal_server_error
      render_error 500
    end

    private

    def render_error(code)
      render file: Rails.root.join("public", "#{code}.html"), layout: false
    end
  end
end
