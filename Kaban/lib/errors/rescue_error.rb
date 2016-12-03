module Errors
  module RescueError

    def self.included(base)
      base.rescue_from Errors::ResponseError do |e|
        render "public/#{e.code}", :status => e.code
      end
    end

  end
end
