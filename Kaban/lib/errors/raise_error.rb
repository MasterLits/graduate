module Errors
  class RaiseError < Faraday::Response::Middleware
    def on_complete(env)
      # Ignore any non-error response codes
      return if (status = env[:status]) < 400
      case status
      when 404
        raise Errors::NotFound
      when 422
        raise Errors::UnprocessableEntity
      else
        raise Errors::InternalServerError # Treat any other errors as 500
      end
    end
  end
end
