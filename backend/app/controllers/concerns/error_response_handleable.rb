module ErrorResponseHandleable
  extend ActiveSupport::Concern

  included do
    rescue_from Exceptions::AuthenticationError, with: :respond_401
    rescue_from ActiveRecord::RecordNotFound, with: :respond_404

    def respond_401(e)
      if matched = e.message.match(/^Exceptions::AuthenticationError$/)
        msg = I18n.t 'exceptions.authentication_error'
      else
        msg = e.message
      end
      error_res(401, message: msg, err: msg)
    end

    def respond_404(e)
      if matched = e.message.match(/^Couldn't find (\w+) with 'id'=([\S]*)/)
        msg = I18n.t 'exceptions.record_not_found', model_name: $1, id: $2
      else
        msg = e.message
      end
      error_res(404, message: msg, err: msg)
    end
  end
end
