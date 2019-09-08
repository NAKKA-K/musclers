class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken

    def success_res(status, message: nil, data: nil)
      render json: {
        status: status,
        message: message,
        data: data
      }

    end

    def error_res(status, message: nil, err: nil)
      render json: {
        status: status,
        message: message,
        errors: [
          { message: err }
        ],
        data: nil
      }
    end
end
