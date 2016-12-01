module Errors
  module RescueError

    def self.included(base)
      base.rescue_from Errors::NotFound do |e|
        render "public/404", :status => 404
      end
      base.rescue_from Errors::UnprocessableEntity do |e|
        render "public/422", :status => 422
      end
      base.rescue_from Errors::InternalServerError do |e|
        render "public/500", :status => 500
      end
    end

  end
end
