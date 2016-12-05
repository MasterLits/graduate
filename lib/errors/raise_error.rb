module Errors
  class RaiseError < Faraday::Response::Middleware

    def on_complete(env)
      return if (status = env[:status]) < 400
      raise Errors.class_for_error_code(status)
    end

  end
end
